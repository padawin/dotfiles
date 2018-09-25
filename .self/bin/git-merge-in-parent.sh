if [ $# -ne 1 ]; then
	echo "Usage: $0 <parent_hash>"
	exit 1
fi

PARENT_BRANCH="$1"
PARENT_COMMIT=$(git rev-parse "$PARENT_BRANCH")
CURRENT_COMMIT=$(git rev-parse HEAD)
CURRENT_BRANCH=$(git rev-parse --abbrev-ref HEAD)
CURR_TREE=$(git log --pretty='format:%T' -n 1)
MERGE_COMMIT=$(git commit-tree "$CURR_TREE" -p "$PARENT_COMMIT" -p "$CURRENT_COMMIT" -m "Merge $CURRENT_BRANCH into $PARENT_BRANCH")
git branch -f "$PARENT_BRANCH" "$MERGE_COMMIT"
git checkout "$PARENT_BRANCH"
