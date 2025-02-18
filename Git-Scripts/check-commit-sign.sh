#!/bin/bash

git config --global commit.gpgSigned true

if git log --pretty=format: "%h" --no-merges | xargs -I {} git show --quite {} | grep -q "GPG commit"; then
    echo " all commits are signed"
else
    echo " there are unsigned commits, please sign them before push"
fi



