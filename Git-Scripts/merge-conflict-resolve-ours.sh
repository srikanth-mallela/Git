#!/bin/bash

MAIN_BRANCH="main"
FEATURE_BRANCH="feature-branch"

echo "switching to main"
git switch $MAIN_BRANCH

echo "fetching latest changes from the repo"
git fetch origin

git merge origin/$FEATURE_BRANCH

if [ $? -ne 0]; then
    echo "conflict detected trying to solve by accepting the current changes"
    git ls-files -u | sort -u | awk '{print $2}' | while read file; do
        git checkout --ours $file #accepting current change
        git add $file
    done
    git commit -m "Merge completed after merging the current change"
else
    echo "Merger completed successfully without any issues"









