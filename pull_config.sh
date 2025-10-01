#!/bin/bash
# pull_config.sh
# Usage: ./pull_config.sh [user@server]

if [ -z "$1" ]; then
  echo "Usage: $0 user@server"
  echo "Example: $0 oscar@fitPC3-music-server"
  exit 1
fi

SERVER="$1"
BACKUP_DIR="Scripting"

echo "Backing up duckyPad configuration from $SERVER..."

# Create directory structure
mkdir -p "$BACKUP_DIR"

# Pull config files
echo "Fetching triggerhappy trigger config..."
scp "$SERVER:/etc/triggerhappy/triggers.d/shairport.conf" "$BACKUP_DIR/" || echo "Warning: Could not fetch shairport.conf"

echo "Fetching systemd override..."
scp "$SERVER:/etc/systemd/system/triggerhappy.service.d/override.conf" "$BACKUP_DIR/" || echo "Warning: Could not fetch override.conf"

echo "Fetching shairport-sync config..."
scp "$SERVER:/etc/shairport-sync.conf" "$BACKUP_DIR/" || echo "Warning: Could not fetch shairport-sync.conf"

echo ""
echo "Backup complete! Files saved to $BACKUP_DIR/"
echo ""
echo "To commit changes:"
echo "  git add $BACKUP_DIR/"
echo "  git commit -m \"Updated server configuration\""
echo "  git push"