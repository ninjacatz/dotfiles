#!/bin/sh

while true; do
	sleep 1
	if pgrep -x ffmpeg > /dev/null; then
		echo ffmpeg
	else
		echo
	fi
done
