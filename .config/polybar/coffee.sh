#!/bin/sh

while true; do
	sleep 1
	if ! pgrep -x xautolock > /dev/null && ! pgrep -x xlock > /dev/null; then
		echo "*"
	else
		echo
	fi
done
