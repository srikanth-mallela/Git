#!/bin/bash

if [ -z "$1" ]; then
    echo "no branches matching"
fi

commit-hashes=($@)

for commit-hashes in "${commit-hashes[@]}"; do
    echo " processing"
    git revert --no-commit $committ-hashes
done
