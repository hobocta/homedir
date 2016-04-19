#!/bin/bash

branch="$1"

git co dev && git pull && git co -b $branch && git push origin $branch && git br --set-upstream-to=origin/$branch
