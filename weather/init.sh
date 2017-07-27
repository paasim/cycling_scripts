#! /bin/bash

DB=$(cat ../db_dir.txt)

sqlite3 "$DB" 'CREATE TABLE weather(year INT, mon INT, day INT, hour INT, temp REAL, rain REAL, wind REAL)'

