#!/bin/bash

echo "Current active PHP:"
which php
php --version

echo -e "\nHomebrew PHP:"
brew list php --versions
HOMEBREW_PHP_PATH=$(brew --prefix php)/bin/php
echo "Path: $HOMEBREW_PHP_PATH"
$HOMEBREW_PHP_PATH --version

echo -e "\nMAMP PHP versions:"
ls -1 /Applications/MAMP/bin/php

echo -e "\nTo use Homebrew PHP, run:"
echo "export PATH=\"$(brew --prefix php)/bin:\$PATH\""

echo -e "\nTo use MAMP PHP, run (replace X.X.X with desired version):"
echo "export PATH=\"/Applications/MAMP/bin/php/phpX.X.X/bin:\$PATH\""

echo -e "\nTo start a PHP server with Homebrew PHP:"
echo "$HOMEBREW_PHP_PATH -S localhost:8000"

echo -e "\nTo start a PHP server with MAMP PHP (replace X.X.X with desired version):"
echo "/Applications/MAMP/bin/php/phpX.X.X/bin/php -S localhost:8000"
