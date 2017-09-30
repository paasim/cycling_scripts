BEGIN {
  RS="}|{"
  ORS="\n"
}
/stationId/ {
  gsub(/"/,"", $0)
  print
}

