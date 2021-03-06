#!/bin/bash

cd /i/projects-backup

domainsLinksFile=domainsLinks.bat
date >> $domainsLinksFile
for link in `find -L /f/OpenServer/domains -mindepth 1 -maxdepth 1 -xtype l`; do
	linkLs="$(ls -lR $link)"
	IFS='/' read one two <<< "$linkLs"
	IFS=' ' read from separator to <<< "$two"
	IFS='/' read fromDisk fromOpenServer fromDomains from <<< "$from"
	IFS='/' read empty toDisk toPath <<< "$to"
	echo 'rmdir /Q /S '$fromDisk':\'$fromOpenServer'\'$fromDomains'\'$from >> $domainsLinksFile
	echo 'mklink /D '$fromDisk':\'$fromOpenServer'\'$fromDomains'\'$from' "'$toDisk':\'${toPath//\//\\}'"' >> $domainsLinksFile
done

projectsLinksFile=projectsLinks.bat
date >> $projectsLinksFile
for link in `find -L /f/projects -mindepth 1 -maxdepth 3 -xtype l`; do
	linkLs="$(ls -lR $link)"
	IFS='/' read one two <<< "$linkLs"
	IFS=' ' read from separator to <<< "$two"
	IFS='/' read fromDisk fromPath <<< "$from"
	IFS='/' read empty toDisk toPath <<< "$to"
	echo 'rmdir /Q /S '$fromDisk':\'${fromPath//\//\\} >> $projectsLinksFile
	echo 'mklink /D '$fromDisk':\'${fromPath//\//\\}' "'$toDisk':\'${toPath//\//\\}'"' >> $projectsLinksFile
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

while true
do
	echo -ne '\007'
	sleep 1
done
