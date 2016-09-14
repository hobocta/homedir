#!/bin/bash

find -mindepth 2 -maxdepth 2 -type f -name '.hobocta.git.pull.on' -mmin +60 -exec sh -c '\
		cd $(dirname "{}") \
		&& touch $(basename "{}") \
		&& echo -n "${PWD##*/}: " \
		&& git pull -n\
	' \;
