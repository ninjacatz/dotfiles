#!/bin/sh

output=$(df -h | awk '
  $NF ~ /^\/mnt\// {
    sub("^/mnt/", "", $NF)
    printf "%s ", $NF
  }
  END {
    print ""
  }
')

echo $output
