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

read -p "Delete branch $CURRENT_BRANCH (y/N)? " -r DELETE_BRANCH
if [ "$DELETE_BRANCH" == "Y" ] || [ "$DELETE_BRANCH" == "y" ]; then
	git branch -d "$CURRENT_BRANCH"
fi

git rev-parse "origin/$CURRENT_BRANCH" 2> /dev/null
REMOTE_EXISTS=$?
if [ $REMOTE_EXISTS -eq 0 ]; then
	read -p "Delete remote branch origin/$CURRENT_BRANCH (y/N)? " -r DELETE_BRANCH
	if [ "$DELETE_BRANCH" == "Y" ] || [ "$DELETE_BRANCH" == "y" ]; then
		git push -d origin "$CURRENT_BRANCH"
	fi
fi
