#! /usr/bin/awk -f

function getval(string) {
  gsub(/\t|<[^>]*>|&#160;/, "", string)
  return string
}

BEGIN {
  OFS=","
}

/layer6/ {
  getline; print time, getval($0)
}
