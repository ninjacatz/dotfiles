#!/bin/sh

default_card=$(grep qqvolume_default_card\= ~/.local/userscripts/qqlib | awk -F '[="]' '{print $3}')

while true; do
	sleep 1
	if amixer -c "$default_card" get Capture | grep "\[on\]" > /dev/null; then
		echo cap
	else
		echo
	fi
done
