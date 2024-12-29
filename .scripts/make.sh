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
    # Handle special flags within CS50 context
    case "$1" in
        --version|-v)
            /usr/bin/make -f "$CS50MAKE" -- --version
            ;;
        --author)
            /usr/bin/make -f "$CS50MAKE" -- --author
            ;;
        which_compiler)
            /usr/bin/make -f "$CS50MAKE" which_compiler
            ;;
        which_device)
            /usr/bin/make -f "$CS50MAKE" which_device
            ;;
        *)
            # Default: Call make with CS50 Makefile for all other cases
            /usr/bin/make -f "$CS50MAKE" "$@"
            ;;
    esac
else
    # Handle special flags outside CS50 context
    case "$1" in
        --version|-v|version)
            /usr/bin/make --version
            ;;
        --author|author)
            echo "Not in CS50 directory. Author information unavailable."
            ;;
        which_compiler|which_device)
            echo "Not in CS50 directory. Device information unavailable."
            ;;
        *)
            # Default: Call the real make command normally
            /usr/bin/make "$@"
            ;;
    esac
fi
