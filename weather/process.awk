#! /usr/bin/awk -f
function proc_timestamp(ts) {
  res = substr(ts, 1, 13)
  gsub("-|T", ",", res)
  return res
}

BEGIN {
  OFS=","
}
{
  time = proc_timestamp($0)
  getline; getline
  temp = $0
  getline; getline; getline
  rain = $0
  getline; getline; getline
  print time, temp, rain, $0
}

