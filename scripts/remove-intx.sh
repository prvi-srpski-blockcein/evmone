#!/bin/bash

# Script to uninstall intx from the local machine
# Removes headers, libraries, and pkg-config files

set -e

# Remove headers
if [ -d "/usr/local/include/intx" ]; then
    echo "Removing /usr/local/include/intx..."
    sudo rm -rf /usr/local/include/intx
else
    echo "/usr/local/include/intx not found."
fi

# Remove libraries
LIBS=(/usr/local/lib/libintx*)
if compgen -G "/usr/local/lib/libintx*" > /dev/null; then
    echo "Removing /usr/local/lib/libintx*..."
    sudo rm -f /usr/local/lib/libintx*
else
    echo "No intx libraries found in /usr/local/lib."
fi

# Remove pkg-config files
if [ -f "/usr/local/lib/pkgconfig/intx.pc" ]; then
    echo "Removing /usr/local/lib/pkgconfig/intx.pc..."
    sudo rm -f /usr/local/lib/pkgconfig/intx.pc
else
    echo "/usr/local/lib/pkgconfig/intx.pc not found."
fi

echo "intx uninstall complete." 