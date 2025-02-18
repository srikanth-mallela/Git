#!/bin/bash

MAIN_BRANCH="main"
FEATURE_BRANCH="feature-branch"

echo "checking out to feature branch"

git checkout $FEATURE_BRANCH

echo "fetching the changes"
git fetch origin

git rebase origin/$MAIN_BRANCH

#check if rebase resulted in a conflict

if [ $? -ne 0 ]; then
    echo "conflicts detected trying to solve them manually"
    git ls-files -u | sort -u | awk '{print $2}' | while read file; do
        git checkout --ours  $file  #accept current changes
        git add $file
    done
    git rebase --continue
    echo "rebase successful"
else
    echo "Successfully rebased without conflicts"
    


