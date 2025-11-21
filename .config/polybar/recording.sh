#!/bin/sh

if pgrep -af "ffmpeg.*-f" > /dev/null; then
	output="rec"
fi

echo "$output"
