#!/bin/sh

capslk=$(cat /sys/class/leds/input0::capslock/brightness)
nmlk=$(cat /sys/class/leds/input0::numlock/brightness)
scrlk=$(cat /sys/class/leds/input0::scrolllock/brightness)

output=""

if [ "$capslk" = "1" ]; then
	output="CapsLk "
fi
if [ "$nmlk" = "1" ]; then
	output="${output}NmLk "
fi
if [ "$scrlk" = "1" ]; then
	output="${output}ScrLk"
fi

output="$(printf '%s' "$output" | sed 's/[[:space:]]*$//')"
echo "$output"
