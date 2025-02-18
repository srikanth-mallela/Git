#!/bin/bash

#script to clone multiple repos

USER_NAME="user-name"
REPOS=("repo1" "repo2" "repo3")

for REPO in "${REPO[@]}"; do
    git clone https://github.com/$USER_NAME/$REPO.git

done

echo "cloning completed"


