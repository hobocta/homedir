#!/bin/bash

folder='tmp_'`date "+%Y-%m-%d-%H-%M-%S"`

mkdir $folder && git diff --cached --name-only --diff-filter=ACMR | xargs -I % cp --parents % $folder
