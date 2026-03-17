#!/bin/bash
# Sends a macOS notification that, when clicked, activates the exact iTerm2 tab/session.

SESSION_GUID="${ITERM_SESSION_ID##*:}"

if [ -z "$SESSION_GUID" ]; then
  # Fallback: just show a basic notification
  osascript -e 'display notification "Claude Code needs your attention" with title "Claude Code"'
  exit 0
fi

ACTIVATE_SCRIPT="tell application \"iTerm2\"
  activate
  repeat with aWindow in windows
    repeat with aTab in tabs of aWindow
      repeat with aSession in sessions of aTab
        if unique ID of aSession is \"$SESSION_GUID\" then
          select aWindow
          select aTab
          select aSession
        end if
      end repeat
    end repeat
  end repeat
end tell"

terminal-notifier \
  -title "Claude Code" \
  -message "Needs your attention" \
  -execute "osascript -e '$ACTIVATE_SCRIPT'"
