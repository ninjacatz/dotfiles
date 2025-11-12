#!/bin/sh

gov=$(cat /sys/devices/system/cpu/cpu0/cpufreq/scaling_governor)
modefile="/var/run/tlp/manual_mode"

output=""

if [ "$gov" != "conservative" ]; then
	output="${gov%"${gov#???}"} "
fi

if [ -f "$modefile" ]; then
	mode=$(cat "$modefile")
	if [ "$mode" = "0" ]; then
		output="${output}ac"
	else
		output="${output}bat"
	fi
fi

output="$(printf '%s' "$output" | sed 's/[[:space:]]*$//')"
echo "$output"
