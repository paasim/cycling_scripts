#!/usr/bin/env bash

TIME=$(date "+%Y,%m,%d,%H,%M")
DB=$(cat ../db_dir.txt)

# get the data
rm -f raw.txt
curl https://api.digitransit.fi/routing/v1/routers/hsl/index/graphql \
-H "Content-Type: application/graphql" \
-o raw.txt \
-d @- << DATA
{
  bikeRentalStations {
    stationId
    bikesAvailable
    spacesAvailable
    allowDropoff
  }
}
DATA

# transform curly brackets to newlines, fields contain the text 'stationId'.
# remove quotation marks
rm -f lines.out
./clean.awk raw.txt > lines.out

# process the data
rm -f data.csv
./process.awk -v time="$TIME" lines.out > data.csv

# read the data to the db
sqlite3 -csv "$DB" '.import data.csv citybike'

