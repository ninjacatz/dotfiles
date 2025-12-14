#!/bin/sh

while true; do
	sleep 1
	connection=$(pgrep -a openvpn$ | head -n 1 | awk '{print $NF }' | cut -d '.' -f 1)
	if [ -n "$connection" ]; then
		echo vpn
	else
		echo
	fi
done
