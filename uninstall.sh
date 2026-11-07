#!/bin/sh

echo "==============================================="
echo "  🧹 DJ Mirano's UDM Fan Speed Uninstaller"
echo "==============================================="
echo ""
echo "🔍 Removing fan speed service and files..."
echo ""

systemctl stop udm-fan-speed.service 2>/dev/null
systemctl disable udm-fan-speed.service 2>/dev/null
rm -f /etc/systemd/system/udm-fan-speed.service
rm -f /data/systemd/udm-fan-speed.service
systemctl daemon-reload

rm -f /data/on_boot.d/set-fan-speed.sh
rm -f /etc/persistent/on_boot.d/set-fan-speed.sh

crontab -l 2>/dev/null | grep -Fv "set-fan-speed.sh" | crontab -

for pwm in /sys/class/hwmon/hwmon*/pwm*_enable; do
  [ -w "$pwm" ] && echo 2 > "$pwm" 2>/dev/null
done

echo ""
echo "✅ Uninstallation complete!"
echo "🌀 Fan speed script removed and fans returned to automatic control."
echo "👑 Uninstalled with style by DJ Mirano - github.com/Miran20122"
