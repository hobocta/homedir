#!/bin/bash

find -mindepth 2 -maxdepth 2 -type f -name '.hobocta.git.prune.on' -exec sh -c 'cd $(dirname "{}") && echo "${PWD##*/}" && git remote prune origin && git branch -vv | grep ": gone]" | awk "{print $1}" | xargs --no-run-if-empty git branch -d' \;
