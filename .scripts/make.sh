#!/bin/bash

# Set the root directory of your project
CS50DIR="/Users/muhammedazhar/Developer/CS50x/"

echo "Current directory: $(pwd)"
echo "CS50 Files: $CS50DIR"

# Check if the current directory is inside the project directory
if [[ "$(pwd)" == "$CS50DIR"* ]]; then
    echo "Running make in project root: $CS50DIR"
    # Call the real make command with the root directory as the working directory
    /usr/bin/make -C "$CS50DIR" "$@"
else
    echo "Running make normally."
    # Call the real make command normally
    /usr/bin/make "$@"
fi
