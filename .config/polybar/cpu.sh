#!/bin/sh

while true; do
	sleep 1
	output=""
	gov=$(cat /sys/devices/system/cpu/cpu0/cpufreq/scaling_governor)
	if [ "$gov" != "conservative" ]; then
		output="${output}cpu=${gov%"${gov#???}"}"
	fi
	modefile="/var/run/tlp/manual_mode"
	if [ -f "$modefile" ]; then
		mode=$(cat "$modefile")
		if [ "$mode" = "0" ]; then
			output="${output} mode=ac"
		else
			output="${output} mode=bat"
		fi
	fi
	echo "$output" | sed 's/[[:space:]]*$//'
done
