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

# Push config files
echo "Posting triggerhappy trigger config..."
scp "$BACKUP_DIR/shairport.conf" "$SERVER:/etc/triggerhappy/triggers.d/" || echo "Warning: Could not post shairport.conf"

echo "Posting systemd override..."
scp "$BACKUP_DIR/override.conf" "$SERVER:/etc/systemd/system/triggerhappy.service.d/"  || echo "Warning: Could not post override.conf"

echo "Posting shairport-sync config..."
scp "$SERVER:/etc/shairport-sync.conf" "$BACKUP_DIR/" || echo "Warning: Could not post shairport-sync.conf"

echo ""
echo "Backup complete! Files saved to $BACKUP_DIR/"
echo ""
echo "To load changes:"
echo "  ssh $SERVER"
echo "  sudo systemctl reload shairport-sync triggerhappy"