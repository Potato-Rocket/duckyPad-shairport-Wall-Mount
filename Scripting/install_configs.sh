#!/bin/bash
# install_configs.sh - Run with sudo on the server

if [ "$EUID" -ne 0 ]; then 
  echo "Please run with sudo"
  exit 1
fi

echo "Installing configuration files..."

mv /tmp/shairport-sync.conf /etc/shairport-sync.conf
mv /tmp/shairport.conf /etc/triggerhappy/triggers.d/shairport.conf
mv /tmp/override.conf /etc/systemd/system/triggerhappy.service.d/override.conf

systemctl daemon-reload
systemctl restart shairport-sync triggerhappy

echo "Configuration installed and services restarted!"
