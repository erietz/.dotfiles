#!/usr/bin/env bash
# Delete remote branches that are 0 commits ahead of $BASE and >0 behind.
# Skips $BASE, develop, and release/* branches. Deletions run in parallel,
# up to $GIT_JOBS at a time.
# Usage: REMOTE=origin BASE=main DRY_RUN=0 GIT_JOBS=8 ./prune-stale-branches.sh
#
# If nlock is on PATH, git operations that talk to the remote (fetch, push)
# go through a lock named after the remote URL, so concurrent runs share one
# budget: at most $GIT_JOBS at once and $GIT_RATE starts (default 30/m).
set -euo pipefail

REMOTE="${REMOTE:-origin}"
BASE="${BASE:-main}"
DRY_RUN="${DRY_RUN:-1}"
GIT_JOBS="${GIT_JOBS:-10}"
GIT_RATE="${GIT_RATE:-100/m}"

# Run a git command that contacts the remote, rate limited when nlock exists.
if command -v nlock >/dev/null 2>&1; then
	remote_url="$(git remote get-url "$REMOTE")"
	remote_git() {
		nlock run --slots "$GIT_JOBS" --rate "$GIT_RATE" "git-remote:$remote_url" -- git "$@"
	}
else
	remote_git() {
		git "$@"
	}
fi

remote_git fetch --prune "$REMOTE"

base_ref="refs/remotes/$REMOTE/$BASE"

is_protected() {
	case "$1" in
	"$BASE" | HEAD | develop | release/*) return 0 ;;
	*) return 1 ;;
	esac
}

delete_branch() {
	local branch="$1" behind="$2"
	if remote_git push --quiet "$REMOTE" --delete "$branch" </dev/null; then
		echo "Deleted $branch ($behind behind, 0 ahead)"
	else
		echo "Failed to delete $branch" >&2
		return 1
	fi
}

failed=0
running=0 # deletions currently in the background

# No pipe or < <(...) around this loop: background jobs must belong to this
# shell, and `wait -n` would also count a finished process substitution.
refs="$(git for-each-ref --format='%(refname:short)' "refs/remotes/$REMOTE/")"
while read -r ref; do
	[[ -n "$ref" ]] || continue
	branch="${ref#"$REMOTE"/}"
	is_protected "$branch" && continue

	# `--left-right --count A...B` prints "<left> <right>"
	# left = in base, not branch (behind); right = in branch, not base (ahead)
	read -r behind ahead <<<"$(git rev-list --left-right --count "$base_ref...$ref")"

	if [[ "$ahead" -eq 0 && "$behind" -gt 0 ]]; then
		if [[ "$DRY_RUN" -eq 0 ]]; then
			# At the limit: wait for any one deletion to finish first.
			if ((running >= GIT_JOBS)); then
				wait -n || failed=1
				running=$((running - 1))
			fi
			delete_branch "$branch" "$behind" &
			running=$((running + 1))
		else
			echo "[dry-run] would delete $branch ($behind behind, 0 ahead)"
		fi
	fi
done <<<"$refs"

# Wait for the rest.
while ((running > 0)); do
	wait -n || failed=1
	running=$((running - 1))
done

exit "$failed"
