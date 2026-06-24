#!/usr/bin/env bash
# Delete remote branches that are 0 commits ahead of $BASE and >0 behind.
# Skips $BASE, develop, and release/* branches.
# Usage: REMOTE=origin BASE=main DRY_RUN=0 ./prune-stale-branches.sh
set -euo pipefail

REMOTE="${REMOTE:-origin}"
BASE="${BASE:-main}"
DRY_RUN="${DRY_RUN:-1}"

git fetch --prune "$REMOTE"

base_ref="refs/remotes/$REMOTE/$BASE"

is_protected() {
	case "$1" in
	"$BASE" | HEAD | develop | release/*) return 0 ;;
	*) return 1 ;;
	esac
}

git for-each-ref --format='%(refname:short)' "refs/remotes/$REMOTE/" |
	while read -r ref; do
		branch="${ref#"$REMOTE"/}"
		is_protected "$branch" && continue

		# `--left-right --count A...B` prints "<left> <right>"
		# left = in base, not branch (behind); right = in branch, not base (ahead)
		read -r behind ahead < <(git rev-list --left-right --count "$base_ref...$ref")

		if [[ "$ahead" -eq 0 && "$behind" -gt 0 ]]; then
			if [[ "$DRY_RUN" -eq 0 ]]; then
				echo "Deleting $branch ($behind behind, 0 ahead)"
				git push "$REMOTE" --delete "$branch"
			else
				echo "[dry-run] would delete $branch ($behind behind, 0 ahead)"
			fi
		fi
	done
