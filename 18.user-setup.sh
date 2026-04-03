#!/bin/bash

# Exit if any command fails
set -e

USER_NAME="sivakumar"
HOME_DIR="/home/$USER_NAME"
SSH_DIR="$HOME_DIR/.ssh"
AUTH_KEYS="$SSH_DIR/authorized_keys"
PUB_KEY_FILE="$1"   # Pass public key file as argument

echo "Creating user..."
sudo useradd -m "$USER_NAME" || echo "User may already exist"

echo "Creating .ssh directory..."
sudo mkdir -p "$SSH_DIR"

echo "Setting permissions for .ssh..."
sudo chmod 700 "$SSH_DIR"

echo "Setting ownership for .ssh..."
sudo chown "$USER_NAME:$USER_NAME" "$SSH_DIR"

echo "Creating authorized_keys file..."
sudo touch "$AUTH_KEYS"

echo "Setting permissions for authorized_keys..."
sudo chmod 600 "$AUTH_KEYS"

echo "Setting ownership for authorized_keys..."
sudo chown "$USER_NAME:$USER_NAME" "$AUTH_KEYS"

# Add public key if provided
if [ -f "$PUB_KEY_FILE" ]; then
    echo "Adding public key to authorized_keys..."
    sudo cat "$PUB_KEY_FILE" >> "$AUTH_KEYS"
else
    echo "⚠️ No public key file provided or file not found"
fi

echo "SSH setup completed successfully ✅"

echo "Final verification:"
ls -ld "$SSH_DIR"
ls -l "$SSH_DIR"