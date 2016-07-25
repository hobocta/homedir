#!/bin/bash

find -mindepth 2 -maxdepth 2 -type d -name '.git' -exec sh -c 'cd {} && cd .. && pwd && git pull -n' \;
