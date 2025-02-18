#!/bin/bash

SIZE_THRESHOLD_MB=10

read -p "give me repo path: " REPO_PATH

if [ ! -d $REPO_PATH/.git ]; then
    echo " not a git repository"
    exit 1
fi

SIZE_THRESHOLD=$(($SIZE_THRESHOLD_MB * 1024 * 1024))

#finding large files

find "$REPO_PATH"  -type f -size +${SIZE_THRESHOLD} | while read file; do
    FILE_SIZE=$( du -h $FILE | cut -f1 )
    REL_PATH=$(realpath --relative-to="$REPO_PATH" "$FILE")
    echo " large file exist: "$REPO_PATH" "$FILE"
    echo " getting commit history"
    git -C "$REPO_PATH" log --follow --pretty=format: %h - %an , %ar %s" -- "$REL_PATH"
    echo "-------------------------------------------------------------------"
done

