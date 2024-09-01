#!/usr/bin/env bash
#-------------------------------------------------------------------------------
# Author:         Ethan Rietz
# Date:           2023-01-04
# Description:    Clone or pull all repos from GitHub
#-------------------------------------------------------------------------------

BACKUP_DIR="${HOME}/cron/gh_backup"
MAX_REPOS=1000
GITHUB_HANDLE="erietz"

mkdir -p "$BACKUP_DIR"

gh repo list "$GITHUB_HANDLE" --limit "$MAX_REPOS" | cut -d '/' -f2- | while read -r repo_name _; do
	out_dir="${BACKUP_DIR}/$repo_name"
	gh repo clone "$repo_name" "$out_dir" 2>/dev/null || (
		cd "$out_dir" || exit # exit the enclosing subshell

		# Handle case where local checkout is on a non-main/master branch.
		# Ignore checkout errors because some repos may have zero commits, so
		# no main or master.
		git checkout -q master 2>/dev/null || true
		git checkout -q main 2>/dev/null || true

		echo "$out_dir"
		git pull
	)
done
