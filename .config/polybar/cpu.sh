#!/bin/sh

gov=$(cat /sys/devices/system/cpu/cpu0/cpufreq/scaling_governor)
if [ $gov != "conservative" ]; then
	output="${gov%${gov#???}}"
fi
modefile="/var/run/tlp/manual_mode"
if [ -f $modefile ]; then
	mode=$(cat $modefile)
	if [ $mode = "0" ]; then
		output="$output ac"
	else
		output="$output bat"
	fi
fi

echo $output
