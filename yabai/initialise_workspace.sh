DISPLAY_NAME_PART="LG ULTRAGEAR"

# Use system_profiler to get display info and check if the display is connected
if system_profiler SPDisplaysDataType | grep -q "$DISPLAY_NAME_PART"; then
  yabai -m config left_padding 110
  yabai -m config right_padding 110
else
  yabai -m config left_padding 0
  yabai -m config right_padding 0
fi

if ! yabai -m query --spaces | jq -e ".[] | select(.index == 1)" >/dev/null; then
  yabai -m space --create
  sleep 0.5
fi

open -a "Arc"
yabai -m space --focus 1
sleep 2

if ! yabai -m query --spaces | jq -e ".[] | select(.index == 2)" >/dev/null; then
  yabai -m space --create
  sleep 0.5
fi
open -a "Alacritty"
yabai -m space --focus 2
sleep 2

if ! yabai -m query --spaces | jq -e ".[] | select(.index == 3)" >/dev/null; then
  yabai -m space --create
  sleep 0.5
fi
open -a "Fork"
yabai -m space --focus 3
sleep 2

if ! yabai -m query --spaces | jq -e ".[] | select(.index == 4)" >/dev/null; then
  yabai -m space --create
  sleep 0.5
fi
open -a "Tableplus"
yabai -m space --focus 4
sleep 2

if ! yabai -m query --spaces | jq -e ".[] | select(.index == 5)" >/dev/null; then
  yabai -m space --create
  sleep 0.5
fi
open -a "Obsidian"
yabai -m space --focus 5
sleep 2

if ! yabai -m query --spaces | jq -e ".[] | select(.index == 6)" >/dev/null; then
  yabai -m space --create
  sleep 0.5
fi
open -a "Safari"
yabai -m space --focus 6
sleep 2

if ! yabai -m query --spaces | jq -e ".[] | select(.index == 7)" >/dev/null; then
  yabai -m space --create
  sleep 0.5
fi
open -a "Docker"
yabai -m space --focus 7
sleep 2

if ! yabai -m query --spaces | jq -e ".[] | select(.index == 8)" >/dev/null; then
  yabai -m space --create
  sleep 0.5
fi
open -a "KeepassXC"
yabai -m space --focus 8
sleep 4

if ! yabai -m query --spaces | jq -e ".[] | select(.index == 9)" >/dev/null; then
  yabai -m space --create
  sleep 1
fi
open -a "Zed"
yabai -m space --focus 9
sleep 2

if ! yabai -m query --spaces | jq -e ".[] | select(.index == 10)" >/dev/null; then
  yabai -m space --create
  sleep 1
fi
open -a "Texts 2"
yabai -m space --focus 10
sleep 2

# shift back to the first space
yabai -m space --focus 1
