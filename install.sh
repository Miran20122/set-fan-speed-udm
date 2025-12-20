#!/bin/sh
# Auto-installer for DJ Mirano's UDM Fan Speed Script (crontab version)

echo "==============================================="
echo "  🌬️  DJ Mirano's UDM Fan Speed Installer"
echo "==============================================="
echo ""
echo "📦 Installing fan speed script..."
echo ""

# Create the persistent boot directory if it doesn't exist
mkdir -p /etc/persistent/on_boot.d/

# Download the fan speed script
curl -fsSL https://raw.githubusercontent.com/Miran20122/set-fan-speed-udm/main/set-fan-speed.sh -o /etc/persistent/on_boot.d/set-fan-speed.sh

# Make the script executable
chmod +x /etc/persistent/on_boot.d/set-fan-speed.sh

# Add the script to crontab if it's not already there
CRON_LINE="@reboot /etc/persistent/on_boot.d/set-fan-speed.sh"
(crontab -l 2>/dev/null | grep -Fv "$CRON_LINE" ; echo "$CRON_LINE") | crontab -

echo ""
echo "✅ Installation complete!"
echo "🔁 The fan speed script will now set the fan speeds automatically on boot or reboot."
echo "🛡️ This script is also persistent and survives system updates."
echo "👑 Made with style by DJ Mirano - github.com/Miran20122"

echo ""
echo "♻️  You need to reboot the system for it to activate"
