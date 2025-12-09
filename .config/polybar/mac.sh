#!/bin/sh

output=""

if [ -e /tmp/mac_on ]; then
	output="${output}mac"
fi

echo "$output"
