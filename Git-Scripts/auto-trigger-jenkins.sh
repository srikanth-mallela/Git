#!/bin/bash

working-dir="/path/to/file/"
jenkins-url="http://179.68.73.108:8080/job/my-job/...."

set -e


if [ ! -d $working-dir/.git]; then 
    echo " not a git repository"
    exit 1
fi

cd $working-dir

local-hash=$(git rev-parse HEAD)
remote-hash=$git(git rev-parse origin/main)

if [ local-hash != remote-hash ]; then
    echo "changes detected"
    git pull origin main || { echo "git pull failed"; exit 1; }

    echo 'triggering jenkins"
    curl -X POST "$jenkins-url"
else
    echo "no changes detected exiting"
fi

