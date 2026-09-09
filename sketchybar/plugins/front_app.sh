#!/bin/sh

if [ "$SENDER" = "front_app_switched" ]; then
  case "$INFO" in
    "kitty")              ICON="󰄛" ;;
    "Ghostty")            ICON="" ;;
    "TablePlus")          ICON="󰆼" ;;
    "Spotify")            ICON="󰓇" ;;
    "Slack")              ICON="󰒱" ;;
    "Google Chrome")      ICON="" ;;
    "Microsoft Edge")     ICON="󰇩" ;;
    "GitHub Desktop")     ICON="" ;;
    "Postgres"*|"pgAdmin"*) ICON="" ;;
    "Microsoft Outlook")  ICON="󰴢" ;;
    "Microsoft Teams"*)   ICON="󰊻" ;;
    "Finder")             ICON="󰀶" ;;
    *)                    ICON=">" ;;
  esac

  sketchybar --set chevron icon="$ICON"
fi
