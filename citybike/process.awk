#! /usr/bin/awk -f
function getval(string) {
  return substr(string, index(string, ":")+1)
}
BEGIN {
  FS=","
  OFS=","
  dropoff["true"] = 1
  dropoff["false"] = 0
}
{
  print time, getval($1), getval($2), getval($3), dropoff[getval($4)]
}

