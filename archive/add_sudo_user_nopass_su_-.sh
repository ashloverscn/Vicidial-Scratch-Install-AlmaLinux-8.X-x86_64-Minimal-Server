#!/bin/bash

# Prompt for username
read -p "Enter new username: " newuser

# Check if user already exists
if id "$newuser" &>/dev/null; then
    echo "⚠️ User '$newuser' already exists."
    read -p "Do you want to update the password? [y/N]: " confirm
    confirm=${confirm:-n}
    if [[ "$confirm" =~ ^[Yy]$ ]]; then
        while true; do
            read -s -p "Enter new password: " userpass
            echo
            read -s -p "Confirm new password: " userpass_confirm
            echo
            if [ "$userpass" == "$userpass_confirm" ]; then
                echo "$newuser:$userpass" | sudo chpasswd
                echo "✅ Password updated for user '$newuser'."
                break
            else
                echo "❌ Passwords do not match. Please try again."
            fi
        done
    else
        echo "❎ Skipped password update."
    fi
else
    # Prompt for password with confirmation
    while true; do
        read -s -p "Enter default password: " userpass
        echo
        read -s -p "Confirm password: " userpass_confirm
        echo
        if [ "$userpass" == "$userpass_confirm" ]; then
            break
        else
            echo "❌ Passwords do not match. Please try again."
        fi
    done

    # Create the user with home directory and bash shell
    sudo useradd -m -s /bin/bash "$newuser"

    # Set the user password
    echo "$newuser:$userpass" | sudo chpasswd

    echo "✅ User '$newuser' created."
fi

# Determine if 'sudo' or 'wheel' group exists and add user to the group
if getent group sudo > /dev/null; then
    sudo usermod -aG sudo "$newuser"
    groupname="sudo"
elif getent group wheel > /dev/null; then
    sudo usermod -aG wheel "$newuser"
    groupname="wheel"
else
    echo "❌ Neither 'sudo' nor 'wheel' group found. Please add sudo privileges manually."
    exit 1
fi

# Grant passwordless sudo to this user
echo "$newuser ALL=(ALL) NOPASSWD:ALL" | sudo tee /etc/sudoers.d/"$newuser" > /dev/null
sudo chmod 0440 /etc/sudoers.d/"$newuser"

# Confirm
echo "✅ User '$newuser' is in '$groupname' group with passwordless sudo access."
