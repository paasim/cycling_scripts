#!/usr/bin/env bash

TIME=$(date "+%Y,%m,%d,%H,%M")
DB=$(cat ../db_dir.txt)

# download the raw data
rm -f raw.html
curl --silent 'http://www1.infracontrol.com/cykla/barometer/barometer_fi.asp?system=helsinki&mode=year' > raw.html

# Get the count from the data and append the timestamp to it
rm -f data.csv
awk -f process.awk -v time="$TIME" raw.html > data.csv

# read the data to the db
sqlite3 -csv "$DB" '.import data.csv baana'

