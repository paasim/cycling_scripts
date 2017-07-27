#! /bin/bash

DB=$(cat ../db_dir.txt)

sqlite3 "$DB" 'CREATE TABLE baana(year INT, mon INT, day INT, hour INT, min INT, value INT)'

