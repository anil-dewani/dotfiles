#!/bin/bash

# Part of the display name to search for
DISPLAY_NAME_PART="LG ULTRAGEAR"

# Use system_profiler to get display info and check if the display is connected
if system_profiler SPDisplaysDataType | grep -q "$DISPLAY_NAME_PART"; then
	yabai -m config left_padding 110
	yabai -m config right_padding 110
else
	yabai -m config left_padding 10
	yabai -m config right_padding 10
fi
