#!/bin/bash
# -*- coding: utf-8 -*-

: <<'END_COMMENT'
CS50 Makefile Selection Script
-----------------------------
This script handles Makefile selection logic for CS50 assignments. It automatically
determines whether to use the CS50-specific Makefile or the default system
Makefile based on the current working directory.

Author: Muhammed Azhar
Date: December 2024
END_COMMENT

# ------------------------------------------------------------
# Environment Variables
# ------------------------------------------------------------
# Allow override via environment variable, otherwise use default path
CS50DIR=${CS50DIR:-"$HOME/Developer/CS50x"}
CS50MAKE="$CS50DIR/Docs/Makefile"

# ------------------------------------------------------------
# Directory Validation
# ------------------------------------------------------------
# Check if directory exists
if [ ! -d "$CS50DIR" ]; then
    echo -e "Error: CS50 directory not found: $CS50DIR\n"
    exit 1
fi

# ------------------------------------------------------------
# Makefile Selection Logic
# ------------------------------------------------------------
# Check if the current directory is inside the project directory
if [[ "$(pwd)" == "$CS50DIR"* ]]; then
    # Call make with -f flag to specify the Makefile location
    /usr/bin/make -f "$CS50MAKE" "$@"
else
    # Call the real make command normally
    /usr/bin/make "$@"
fi
