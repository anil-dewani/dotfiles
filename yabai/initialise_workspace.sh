DISPLAY_NAME_PART="LG ULTRAGEAR"

# start docker engine via docker desktop and keep it in background
osascript -e 'tell application "Docker" to set visible of front window to false'
open -a "Docker"

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

yabai -m space --focus 1
open -a "Arc"
sleep 3

if ! yabai -m query --spaces | jq -e ".[] | select(.index == 2)" >/dev/null; then
  yabai -m space --create
  sleep 0.5
fi
yabai -m space --focus 2
alacritty &
sleep 3

if ! yabai -m query --spaces | jq -e ".[] | select(.index == 3)" >/dev/null; then
  yabai -m space --create
  sleep 0.5
fi
yabai -m space --focus 3
open -a "Fork"
sleep 3

if ! yabai -m query --spaces | jq -e ".[] | select(.index == 4)" >/dev/null; then
  yabai -m space --create
  sleep 0.5
fi
yabai -m space --focus 4
open -a "KeepassXC"
sleep 3

if ! yabai -m query --spaces | jq -e ".[] | select(.index == 5)" >/dev/null; then
  yabai -m space --create
  sleep 0.5
fi
yabai -m space --focus 5
open -a "Anki"
sleep 3

if ! yabai -m query --spaces | jq -e ".[] | select(.index == 6)" >/dev/null; then
  yabai -m space --create
  sleep 0.5
fi
yabai -m space --focus 6
open -a "Safari"
sleep 4

if ! yabai -m query --spaces | jq -e ".[] | select(.index == 7)" >/dev/null; then
  yabai -m space --create
  sleep 0.5
fi
yabai -m space --focus 7
open -a "Docker"
sleep 5

if ! yabai -m query --spaces | jq -e ".[] | select(.index == 8)" >/dev/null; then
  yabai -m space --create
  sleep 0.5
fi
yabai -m space --focus 8
open -n -a "TablePlus"
sleep 5

if ! yabai -m query --spaces | jq -e ".[] | select(.index == 9)" >/dev/null; then
  yabai -m space --create
  sleep 1
fi
yabai -m space --focus 9
open -n -a "Cursor"
sleep 6

if ! yabai -m query --spaces | jq -e ".[] | select(.index == 10)" >/dev/null; then
  yabai -m space --create
  sleep 1
fi
yabai -m space --focus 10
open -n -a "Obsidian"
sleep 3

# shift back to the first space
yabai -m space --focus 1
