#!/bin/bash

cd e:\mysql-backup\

dbNames=()

for dbName in `mysql -u root -e 'show databases;' | grep -v mysql | grep -v information_schema | grep -v performance_schema | grep -v Database`; do
	dbNames+=($dbName)
done

dbNamesCount=${#dbNames[@]}
dbNamesCounter=0

for dbName in "${dbNames[@]}"
do
	let dbNamesCounter=dbNamesCounter+1

	tablesNames=()

	for tableName in `mysql -u root -e 'show tables from '$dbName';' | grep -v 'Tables_in_'$dbName`; do
		tablesNames+=($tableName)
	done

	tablesNamesCount=${#tablesNames[@]}
	tablesNamesCounter=0

	for tableName in "${tablesNames[@]}"
	do
		let tablesNamesCounter=tablesNamesCounter+1

		printf '[%02d/%02d] %-14s | [%03d/%03d] %-50s...' "$dbNamesCounter" "$dbNamesCount" "$dbName" "$tablesNamesCounter" "$tablesNamesCount" "$tableName"

		fileName=$dbName'.'$tableName'.sql'

		mysqldump -u root --skip-comments --opt $dbName $tableName | gzip --no-name > $fileName'.gz'
		echo 'done'
	done
done
