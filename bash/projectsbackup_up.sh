#!/bin/bash

cd /e/projects-backup

archives=()

for archive in `find -maxdepth 1 -name '*.tar.gz'`; do
	archives+=($archive)
done

count=${#archives[@]}
counter=0

for archive in "${archives[@]}"
do
	let counter=counter+1

	printf '[%02d/%02d] %-50s...' "$counter" "$count" "$archive"

	tar xzf $archive -C /

	echo 'done'
done

while true
do
	echo -ne '\007'
	sleep 1
done
