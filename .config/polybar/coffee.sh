#!/bin/sh

output=""

if ! pgrep -x xautolock > /dev/null && ! pgrep -x xlock > /dev/null; then
	output="${output}*"
fi

echo "$output"
