#!/bin/bash

find -mindepth 2 -maxdepth 2 -type d -name '.git' -exec sh -c 'cd {} && cd .. && pwd && git remote prune origin && git branch -vv | grep ": gone]" | awk "{print $1}" | xargs --no-run-if-empty git branch -d' \;
