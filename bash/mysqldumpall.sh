#!/bin/bash

dbNames=()

for dbName in `mysql -u root -e 'show databases;' | grep -v mysql | grep -v information_schema | grep -v performance_schema | grep -v Database`; do
	dbNames+=($dbName)
done

dbNamesCount=${#dbNames[@]}
dbNamesCounter=0

for dbName in "${dbNames[@]}"
do
	let dbNamesCounter=dbNamesCounter+1

	dbName="$(echo -e "${dbName}" | tr -d '[:space:]')"

	printf '%d/%d %s... ' $dbNamesCounter $dbNamesCount $dbName

	mysqldump -u root --skip-comments --opt $dbName > $dbName.sql

	echo 'done'
done
