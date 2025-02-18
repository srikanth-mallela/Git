#!/bin/bash

PATTERN="^ISSUE #[0-9]+: .+"

LAST_COMMIT_MESSAGE=$(git log -1 --pretty=format:%B)

if [ ! "$LAST_COMMIT_MESSAGE" =~ "$PATTERN" ]
    echo " Commit message format not matched"
    exit 1
else
    echo " commit message matched"
fi
