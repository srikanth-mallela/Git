#!/bin/bash

PATTERN="^ISSUE #[0-9]+: .+"

COMMIT_MESSAGE_FILE=$1
COMMIT_MESSAGE=$(cat "$COMMIT_MESSAGE_FILE")

if [ ! "$COMMIT_MESSAGE" =~ $PATTERN ]
    echo " Commit message didn't match the format : $PATTERN"
    exit 1
else 
    echo " commit message is valid"
fi