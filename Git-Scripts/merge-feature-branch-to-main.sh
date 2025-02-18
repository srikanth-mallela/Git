#!/bin/bash
MAIN_BRANCH="main"
FEATURE_BRANCH="feature"

echo "switching to main"
git checkout $MAIN_BRANCH

echo "pulling the latest from repo"
git pull origin $MAIN_BRANCH || { echo "failed to pull"; exit 1 }

echo "going to merge"
git merge --no-ff $FEATURE_BRANCH

echo "pushing changes to remote"
git push origin $MAIN_BRANCH

echo " merge completed"
