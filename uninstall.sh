echo "==============================================="
echo "  🧹 DJ Mirano's UDM Fan Speed Uninstaller"
echo "==============================================="
echo ""
echo "🔍 Removing fan speed script and crontab entry..."
echo ""

# Remove the fan speed script
rm -f /etc/persistent/on_boot.d/set-fan-speed.sh

# Remove crontab entry
CRON_LINE="@reboot /etc/persistent/on_boot.d/set-fan-speed.sh"
crontab -l 2>/dev/null | grep -Fv "$CRON_LINE" | crontab -

echo ""
echo "✅ Uninstallation complete!"
echo "🌀 Fan speed script has been removed and will no longer run at boot."
echo "👑 Uninstalled with style by DJ Mirano - github.com/Miran20122"

echo ""
echo "♻️  Rebooting system in 3 seconds..."
sleep 3
reboot
