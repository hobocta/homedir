#!/bin/bash

files=()

for file in `find ./ -maxdepth 1 -name '*.sql'`; do
	files+=($file)
done

dbNames=()

for file in "${files[@]}"
do
	dbName="${file/\.\//}"
	dbName="${dbName/\.sql/}"

	createDbComand='CREATE DATABASE IF NOT EXISTS '$dbName';'

	printf '%s create database...' "$file"

	echo $createDbComand | mysql -u root

	printf 'done; execute sql...'

	mysql -u root $dbName < $file

	echo 'done'
done
