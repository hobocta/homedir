#!/bin/bash

cd e:\mysql-backup\

files=()

for file in `find . -name '*.sql.gz'`; do
	files+=($file)
done

dbNames=()

in_array() {
	local haystack=${1}[@]
	local needle=${2}
	for i in ${!haystack}; do
		if [[ ${i} == ${needle} ]]; then
			return 0
		fi
	done
	return 1
}

counter=0

for file in "${files[@]}"
do
	let counter=counter+1

	IFS='.' read directory dbName tableName ext gz <<< "$file"
	IFS='/' read directory dbName <<< "$dbName"

	in_array dbNames "${dbName}" && echo -n '' || dbNames+=($dbName)

	let zero=$counter%100

	if [ $zero = 0 ]; then
		echo -n '.'
	fi
done

echo ''

dbNamesCount=${#dbNames[@]}
dbNamesCounter=0

for dbName in "${dbNames[@]}"
do
	let dbNamesCounter=dbNamesCounter+1

	createDbComand='CREATE DATABASE IF NOT EXISTS '$dbName';'

	printf '[%02d/%02d] %-50s...' "$dbNamesCounter" "$dbNamesCount" "$createDbComand"
	echo $createDbComand | mysql -u root
	echo 'done'
done

filesCount=${#files[@]}
filesCounter=0

for file in "${files[@]}"
do
	let filesCounter=filesCounter+1

	printf '[%02d/%02d] %-50s...' "$filesCounter" "$filesCount" "$file"

	gzip -d -k -f $file
	echo -n 'gzip ...'

	IFS='.' read directory dbName tableName ext gz <<< "$file"
	IFS='/' read directory dbName <<< "$dbName"

	printf -v fileName '%s.%s.%s' "$dbName" "$tableName" "$ext"
	
	mysql -u root $dbName < $fileName
	echo -n 'dump ...'

	rm $fileName
	echo 'rm'
done
