#!/bin/bash

status=$(git status -s)

if [ -n $status ]; then
    echo "there are some uncommitted changed"
    echo $status
else
    echo "nothing changes"
fi