#/bin/bash

#script to delete older branched from the git repository and local which are merged with the main branch
MAIN_BRANCH=main
DAYS_OLD=30

#fetch latest changes and remove unexisting branches in local
git fetch --prune

#delete older branches in local
for branch in $(git branch --merged $MAIN_BRANCH | grep -v $MAIN_BRANCH); do 
    LAST_COMMIT=$(git log -1 --format=%ci $branch)
    LAST_COMMIT_TIME_STAMP=$(date -d $LAST_COMMIT +%s)
    CURRENT_TIME_STAMP=$(date -d +%s)
    DAYS_DIFF=(($LAST_COMMIT_TIMESTAMP - $CURRENT_TIME_STAMP) / 86400)

    if [$DAYS_DIFF -ge $DAYS_OLD]; then
        echo "deleting older branches locally"
        git branch -d $branch
    fi
done

for branch in $(git branch -r --merged $MAIN_BRANCH | grep -v $"origin/$MAIN_BRANCH"); do
    LAST_COMMIT=$(git log -1 --format=%ci $branch)
    LAST_COMMIT_TIME_STAMP=$(date -d $LAST_COMMIT +%s)
    CURRENT_TIME_STAMP=$(date -d +%s)
    DAYS_DIFF=(($LAST_COMMIT_TIMESTAMP - $CURRENT_TIME_STAMP) / 86400)

    if [$DAYS_DIFF -ge $DAYS_OLD]
        echo " deleting older branches from remote"
        git push origin --delete $(echo $branch| sed 's/origin\//')
    fi
done