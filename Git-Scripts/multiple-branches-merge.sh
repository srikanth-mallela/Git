#!/bin/bash


MAIN_BRANCH="main"

# Ensure at least one branch is provided
if [ "$#" -lt 1 ]; then
    echo "Please provide at least one branch to merge."
    exit 1
fi

# Checkout to the main branch
git checkout "$MAIN_BRANCH"
git fetch --all

# Loop through all the branches provided as arguments
for branch in "$@"; do
    echo "Merging branch: $branch"
    git merge "$branch" || { echo "Merge failed for branch: $branch"; exit 1; }
done

echo "All merges completed successfully."

    