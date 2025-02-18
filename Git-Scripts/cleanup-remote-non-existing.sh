#!/bin/bash

git fetch --prune

git branch -r | grep -v '\->' | while read remote; do
    if ! git show-ref --quiet --verify "ref/remotes/$remote"; then
        echo " not existing try to delete it if not needed"
        git branch -d $remote
    fi
done


 

