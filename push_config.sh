#!/bin/bash
# push_config.sh
# Usage: ./push_config.sh [user@server]

if [ -z "$1" ]; then
  echo "Usage: $0 user@server"
  echo "Example: $0 oscar@fitPC3-music-server"
  exit 1
fi

SERVER="$1"
BACKUP_DIR="Scripting"

echo "Restoring duckyPad configuration to $SERVER from backup..."

# Copy files to temp directory
echo "Copying files to server's temp directory..."
scp "$BACKUP_DIR/shairport.conf" "$SERVER:/tmp/" || { echo "Error copying shairport.conf"; exit 1; }
scp "$BACKUP_DIR/shairport-sync.conf" "$SERVER:/tmp/" || { echo "Error copying shairport-sync.conf"; exit 1; }
scp "$BACKUP_DIR/override.conf" "$SERVER:/tmp/" || { echo "Error copying override.conf"; exit 1; }
scp "$BACKUP_DIR/install_configs.sh" "$SERVER:/tmp/" || { echo "Error copying installer"; exit 1; }

echo ""
echo "Files copied to server. Now run on the server:"
echo "  ssh $SERVER"
echo "  sudo bash /tmp/install_configs.sh"
