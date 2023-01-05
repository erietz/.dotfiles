#!/usr/bin/env bash
#-------------------------------------------------------------------------------
# Author:         Ethan Rietz
# Date:           2023-01-04
# Description:    Clone or pull all repos from GitHub
#-------------------------------------------------------------------------------

set -x
BACKUP_DIR="${HOME}/gh_backup"


mkdir -p "$BACKUP_DIR"
gh repo list erietz --limit 1000 | while read -r repo _; do
	repo_name=$(echo $repo | sed 's/erietz\///')
	outdir="${BACKUP_DIR}/$repo_name"
	gh repo clone "$repo" "$outdir" -- -q 2>/dev/null || (
		cd "$outdir"
		# Handle case where local checkout is on a non-main/master branch
		# - ignore checkout errors because some repos may have zero commits, 
		# so no main or master
		git checkout -q master 2>/dev/null || true
		git checkout -q main 2>/dev/null || true
		git pull -q
		)
done
