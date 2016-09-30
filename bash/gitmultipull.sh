#!/bin/bash

find -mindepth 2 -maxdepth 2 -type f -name '.hobocta.git.pull.on' -mmin +720 -exec sh -c '\
		cd $(dirname "{}") \
		&& echo -n "$(tput setaf 4)" \
		&& echo "${PWD##*/}" \
		&& echo -n "$(tput sgr0)" \
		&& git pull -n \
		&& touch $(basename "{}") \
	' \;
