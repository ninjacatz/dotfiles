#!/bin/sh

output=""

output=$(df -h | awk '
  $NF ~ /^\/mnt\// {
    sub("^/mnt/", "", $NF)
    printf "%s ", $NF
  }
  END {
    print ""
  }
')

output="$(printf '%s' "$output" | sed 's/[[:space:]]*$//')"
echo "$output"
