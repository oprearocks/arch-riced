#!/bin/bash

# Serial number of the Apple Studio Display (replace with your monitor's serial)
EXTERNAL_MONITOR_SERIAL="0xA6FAA04E" # Update after running: hyprctl monitors -j

# Fallback: use make and model
EXTERNAL_MONITOR_MAKE="Apple"
EXTERNAL_MONITOR_MODEL="Studio Display"

# Log file for debugging
LOG_FILE="$HOME/monitor-hotplug.log"

# Function to log messages
log() {
  echo "[$(date '+%Y-%m-%d %H:%M:%S')] $1" >>"$LOG_FILE"
}

# Function to configure monitors
configure_monitors() {
  log "Starting configure_monitors"

  # Get all monitors as JSON
  monitors_json=$(hyprctl monitors -j)
  log "Monitors: $(echo "$monitors_json" | jq '.[] | {name, serial}')"

  # Find all monitor names matching the serial number
  EXTERNAL_MONITOR_NAMES=$(echo "$monitors_json" | jq -r --arg serial "$EXTERNAL_MONITOR_SERIAL" '.[] | select(.serial == $serial) | .name')

  # Fallback to make and model
  if [ -z "$EXTERNAL_MONITOR_NAMES" ]; then
    EXTERNAL_MONITOR_NAMES=$(echo "$monitors_json" | jq -r --arg make "$EXTERNAL_MONITOR_MAKE" --arg model "$EXTERNAL_MONITOR_MODEL" '.[] | select(.make == $make and .model == $model) | .name')
  fi

  # Select the first monitor name
  EXTERNAL_MONITOR_NAME=$(echo "$EXTERNAL_MONITOR_NAMES" | head -n 1)
  log "Selected external monitor: $EXTERNAL_MONITOR_NAME"

  # Get all monitor names
  ALL_MONITORS=$(echo "$monitors_json" | jq -r '.[] | .name')

  # If external monitor is connected
  if [ -n "$EXTERNAL_MONITOR_NAME" ]; then
    # Disable all other monitors
    for monitor in $ALL_MONITORS; do
      if [ "$monitor" != "$EXTERNAL_MONITOR_NAME" ]; then
        log "Disabling monitor $monitor"
        hyprctl keyword monitor "$monitor,disable"
      fi
    done

    # Configure external monitor
    log "Configuring $EXTERNAL_MONITOR_NAME"
    hyprctl keyword monitor "$EXTERNAL_MONITOR_NAME,5120x2880@60,0x0,1.6"
  else
    # Disable all monitors except eDP-1
    for monitor in $ALL_MONITORS; do
      if [ "$monitor" != "eDP-1" ]; then
        log "Disabling monitor $monitor"
        hyprctl keyword monitor "$monitor,disable"
      fi
    done
    # Configure eDP-1
    log "Configuring eDP-1"
    hyprctl keyword monitor "eDP-1,2880x1800@60,0x0,1.6"
  fi

  # Restart Waybar
  # log "Restarting Waybar"
  # pkill waybar && waybar &
}

# Run initial configuration
configure_monitors

# Listen for monitor events
socat -u UNIX-CONNECT:$XDG_RUNTIME_DIR/hypr/$HYPRLAND_INSTANCE_SIGNATURE/.socket2.sock - | while read -r event; do
  log "Received event: $event"
  if [[ $event == monitoradded* || $event == monitorremoved* ]]; then
    configure_monitors
  fi
done
