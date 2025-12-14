#!/bin/sh

while true; do
	sleep 1
	if pgrep -x sshd > /dev/null; then
		echo ssh
	else
		echo
	fi
done
