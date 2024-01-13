#!/bin/bash

iterm_path="/Applications/iTerm.app"

# Check if iTerm2 exists
if [ -e "$iterm_path" ]; then
    # Open iTerm2
    open "$iterm_path"
    
    # Close the current Terminal app
    osascript -e 'tell application "Terminal" to quit'
else
    echo "iTerm2 not found. Continuing with the current Terminal."
fi