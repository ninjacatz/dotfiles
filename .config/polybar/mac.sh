#!/bin/sh

while true; do
	sleep 1
	if [ -e /tmp/mac_on ]; then
		echo mac
	else
		echo
	fi
done
