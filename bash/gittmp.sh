#!/bin/bash

number="$1"

if [ -z "$number" ]; then
    echo "Not specified number of commits"
    exit
fi

folder='tmp_'`date "+%Y-%m-%d-%H-%M-%S"`

mkdir $folder && git log -$number --name-only --no-commit-id --pretty="format:" | sort | uniq | xargs -I % cp --parents % $folder
