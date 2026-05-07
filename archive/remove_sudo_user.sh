#!/bin/bash

# Prompt for username to remove
read -p "Enter the username to remove: " targetuser

# Check if the user exists
if ! id "$targetuser" &>/dev/null; then
    echo "❌ User '$targetuser' does not exist."
    exit 1
fi

# Prompt for confirmation
read -p "Are you sure you want to delete user '$targetuser'? [y/N]: " confirm
confirm=${confirm:-n}
if [[ ! "$confirm" =~ ^[Yy]$ ]]; then
    echo "❎ Deletion aborted."
    exit 0
fi

# Remove passwordless sudo privileges if present
if [ -f "/etc/sudoers.d/$targetuser" ]; then
    sudo rm -f "/etc/sudoers.d/$targetuser"
    echo "🧹 Removed sudoers entry for $targetuser."
else
    echo "⚠️ No sudoers entry found for $targetuser."
fi

# Delete the user and their home directory
sudo userdel -r "$targetuser"
echo "🗑️ User '$targetuser' and home directory removed."
