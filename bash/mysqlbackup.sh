#!/bin/bash

cd e:\mysql-backup\

for i in `mysql -u root -e'show databases;' | grep -v information_schema | grep -v Database`; do mysqldump -u root $i > `date +%Y-%m-%d`-$i; gzip `date +%Y-%m-%d`-$i;done
