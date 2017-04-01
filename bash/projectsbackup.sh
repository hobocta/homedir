#!/bin/bash

cd /i/projects-backup

date >> domains.bat

for link in `find -L /f/OpenServer/domains -mindepth 1 -maxdepth 1 -xtype l`; do
	linkLs="$(ls -lR $link)"
	IFS='/' read one two <<< "$linkLs"
	IFS=' ' read from separator to <<< "$two"
	IFS='/' read fromDisk fromOpenServer fromDomains from <<< "$from"
	IFS='/' read empty toDisk toPath <<< "$to"
	echo 'mklink /D '$from' "'$toDisk':\'${toPath//\//\\}'"' >> domains.bat
done

directories=()

for dir in `find /f/projects -mindepth 1 -maxdepth 1 -type d`; do
	directories+=($dir)
done

count=${#directories[@]}
counter=0

for dir in "${directories[@]}"
do
	let counter=counter+1

	printf '[%02d/%02d] %-50s...' "$counter" "$count" "$dir"

	IFS='/' read empty disk root projectName <<< "$dir"

	tar czfP $projectName.tar.gz --overwrite --exclude 'bitrix/cache/*' --exclude 'bitrix/managed_cache/*' --exclude 'bitrix/stack_cache/*' $dir

	echo 'done'
done
