#!/bin/bash

# Kill any previously running close_notifier.sh scripts
pkill -f close_notifier.sh

# Paths
CONFIG_DIR="$HOME/.config/eww/bottom-notifier"
ICON_DIR="$HOME/.config/eww/bottom-notifier/icons"
NOTIFIER_SCRIPT="$CONFIG_DIR/bin/close_notifier.sh"

# Args
mode="$1"

# Check if EWW widget is already open
is_widget_open=$(eww active-windows | rg -q "bottom-notifier" && echo 1 || echo 0)

# --- Helper Functions ---

open_notifier_widget() {
  [[ "$is_widget_open" -eq 0 ]] && eww open bottom-notifier
}

show_notifier() {
  local value=$1
  local icon=$2

  eww update notifier-value="$value"
  eww update notifier-icon-path="$icon"
  open_notifier_widget
  "$NOTIFIER_SCRIPT" &
  disown
}

get_volume_percent() {
  local node=$1 # e.g., @DEFAULT_AUDIO_SINK@ or @DEFAULT_AUDIO_SOURCE@
  wpctl get-volume "$node" | rg -o '[0-9.]+' | awk '{ printf("%d", $1 * 100) }'
}

get_mute_status() {
  local node=$1
  wpctl get-volume "$node" | rg -q MUTED && echo 1 || echo 0
}

get_brightness_percent() {
  local controller=$1 # e.g., "backlight" or "*::kbd_backlight"
  local current
  current=$(brightnessctl -c "$controller" g)
  local max
  max=$(brightnessctl -c "$controller" m)
  awk -v b="$current" -v m="$max" 'BEGIN { printf("%d", (b/m)*100) }'
}

get_kbd_brightness_percent() {
  local device=$1
  local current=$(brightnessctl -d "$device" g 2>/dev/null)
  local max=$(brightnessctl -d "$device" m 2>/dev/null)

  if [[ -z "$current" || -z "$max" || "$max" -eq 0 ]]; then
    echo ""
    return 1
  fi

  awk -v b="$current" -v m="$max" 'BEGIN { printf("%d", (b/m)*100) }'
}

# --- Main Case Handler ---

case "$mode" in
"volume")
  percent=$(get_volume_percent @DEFAULT_AUDIO_SINK@)
  show_notifier "$percent" "$ICON_DIR/volume.svg"
  ;;

"micvolume")
  percent=$(get_volume_percent @DEFAULT_AUDIO_SOURCE@)
  show_notifier "$percent" "$ICON_DIR/mic.svg"
  ;;

"mute")
  if [[ $(get_mute_status @DEFAULT_AUDIO_SINK@) -eq 1 ]]; then
    show_notifier 0 "$ICON_DIR/mute.svg"
  else
    percent=$(get_volume_percent @DEFAULT_AUDIO_SINK@)
    show_notifier "$percent" "$ICON_DIR/volume.svg"
  fi
  ;;

"micmute")
  if [[ $(get_mute_status @DEFAULT_AUDIO_SOURCE@) -eq 1 ]]; then
    echo "$ICON_DIR/micmute.svg"
    show_notifier 0 "$ICON_DIR/micmute.svg"
  else
    percent=$(get_volume_percent @DEFAULT_AUDIO_SOURCE@)
    echo "$ICON_DIR/mic.svg"
    show_notifier "$percent" "$ICON_DIR/mic.svg"
  fi
  ;;

"brightness")
  percent=$(get_brightness_percent "backlight")
  show_notifier "$percent" "$ICON_DIR/brightness.svg"
  ;;

"kbd_brightness")
  percent=$(get_kbd_brightness_percent "asus::kbd_backlight")
  show_notifier "$percent" "$ICON_DIR/kbd_brightness.svg"
  ;;

*)
  echo "Usage: $0 [volume|micvolume|mute|micmute|brightness|kbd_brightness]"
  exit 1
  ;;
esac
