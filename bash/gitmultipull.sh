#!/bin/bash

find -mindepth 2 -maxdepth 2 -type f -name '.hobocta.git.pull.on' -exec sh -c 'cd $(dirname "{}") && echo -n "${PWD##*/}: " && git pull -n' \;
