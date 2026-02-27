# select network
selected=$(nmcli dev wifi | rofi -dmenu)
ssid=$(echo "$selected" | awk '{print $2}')

# exit if no network selected
if [ -z "$ssid" ]; then
  exit 0
fi

# check if it's known
if nmcli connection show | awk '{print $1}' | rg -Fxq "$ssid"; then
  # connect
  nmcli connection up "$ssid"
  notify-send "Connected to $ssid"
else
  password=$(rofi -dmenu -password -p "Password for $ssid")
  output=$(nmcli dev wifi connect "$ssid" password "$password")
  notify-send "$output"
fi
