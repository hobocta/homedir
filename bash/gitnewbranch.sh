#!/bin/bash

branch="$1"

if [ -z "$branch" ]; then
    echo "Not specified branch"
    exit
fi

branch=$(echo $branch | sed 's/-/_/g')

git co dev && git pull && git co -b $branch && git push origin $branch && git br --set-upstream-to=origin/$branch
