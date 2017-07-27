#! /usr/bin/awk -f

/Time|ParameterName|ParameterValue/ {
  gsub(/(<[^>]+>)|\ /, "", $0)
  print
}
