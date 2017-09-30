#!/usr/bin/env bash

DB=$(cat ../db_dir.txt)

sqlite3 "$DB" 'CREATE TABLE citybike(year INT, mon INT, day INT, hour INT, min INT, station_id INT, bikes INT, spaces INT, allow_drop INT)'

