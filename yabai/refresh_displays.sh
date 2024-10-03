#!/bin/bash

DISPLAY_NAME_PART_1="LG ULTRAGEAR"
DISPLAY_NAME_PART_2="LG HDR 4K"

# Use system_profiler to get display info and check if either display is connected
if system_profiler SPDisplaysDataType | grep -q "$DISPLAY_NAME_PART_1" || system_profiler SPDisplaysDataType | grep -q "$DISPLAY_NAME_PART_2"; then
  yabai -m config left_padding 110
  yabai -m config right_padding 110
else
  yabai -m config left_padding 0
  yabai -m config right_padding 0
fi
