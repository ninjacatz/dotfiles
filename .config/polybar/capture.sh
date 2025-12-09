#!/bin/sh

output=""

default_card=$(grep qqvolume_default_card\= ~/.local/userscripts/qqlib | awk -F '[="]' '{print $3}')
if amixer -c "$default_card" get Capture | grep "\[on\]" > /dev/null; then
	output="${output}cap"
fi

echo "$output"
