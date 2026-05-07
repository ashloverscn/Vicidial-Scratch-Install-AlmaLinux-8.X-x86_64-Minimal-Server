#!/bin/bash

echo "Fixing shell scripts in ./ and ../ ..."

find . ../ -type f -name "*.sh" -exec sed -i 's/\r$//' {} \;
find . ../ -type f -name "*.sh" -exec chmod +x {} \;

echo "Done."
