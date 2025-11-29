#!/bin/sh

output=""

if pgrep -x ffmpeg > /dev/null; then
	output="ffmpeg"
fi

echo "$output"
