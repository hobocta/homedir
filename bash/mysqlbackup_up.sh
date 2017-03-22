#!/bin/bash

cd e:\mysql-backup\

files=()

for file in `find . -name '*.sql.gz'`; do
	files+=($file)
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
