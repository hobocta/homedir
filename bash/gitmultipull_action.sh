#!/bin/bash

for i in "$@"
do
	cd $(dirname $i) \
	&& echo -n "$(tput setaf 2)" \
	&& echo "${PWD##*/}" \
	&& echo -n "$(tput sgr0)" \
	&& git pull -n
done
