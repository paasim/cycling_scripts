#! /bin/bash

APIK=$(cat apik.txt)
DB=$(cat ../db_dir.txt)

TIME=$(date -d "yesterday" "+%Y-%m-%d")
TIMESTR='&starttime='$TIME'T00:00:00Z&endtime='$TIME'T23:00:00Z'

QUERY='http://data.fmi.fi/fmi-apikey/'$APIK$(cat req.txt)$TIMESTR

# download the data
rm -f raw.xml
curl $QUERY > raw.xml

# remove 'unnecessary' information, keep only the values of the records
rm -f lines.out
awk -f clean.awk raw.xml > lines.out

# get the actual data
rm -f data.csv
awk -f process.awk lines.out > data.csv

# read the data to the db
sqlite3 -csv "$DB" '.import data.csv weather'
