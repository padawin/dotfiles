#!/bin/bash
if [ $# -gt 2 ] || [ $# -lt 1 ]; then
	echo "Usage: $0 <parent_hash> [<pull_request_number>]"
	exit 1
fi

PARENT_BRANCH="$1"
PR_NUMBER="$2"
PARENT_COMMIT=$(git rev-parse "$PARENT_BRANCH")
CURRENT_COMMIT=$(git rev-parse HEAD)
CURRENT_BRANCH=$(git rev-parse --abbrev-ref HEAD)
CURR_TREE=$(git log --pretty='format:%T' -n 1)
if [ -z "$PR_NUMBER" ]; then
	MESSAGE="Merge $CURRENT_BRANCH into $PARENT_BRANCH"
else
	MESSAGE="Merge pull request #$PR_NUMBER from IDAGIO/$CURRENT_BRANCH"
fi
MERGE_COMMIT=$(git commit-tree "$CURR_TREE" -p "$PARENT_COMMIT" -p "$CURRENT_COMMIT" -m "$MESSAGE")
git branch -f "$PARENT_BRANCH" "$MERGE_COMMIT"
git checkout "$PARENT_BRANCH"
