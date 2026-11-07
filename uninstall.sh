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

echo 2 > /sys/class/hwmon/hwmon0/device/pwm1_enable 2>/dev/null
echo 2 > /sys/class/hwmon/hwmon0/device/pwm2_enable 2>/dev/null
systemctl restart ubnt-fan-speed 2>/dev/null || systemctl restart ubnt-thermal 2>/dev/null || true

echo ""
echo "✅ Uninstallation complete!"
echo "🌀 Fan speed script removed and fans returned to automatic control."
echo "👑 Uninstalled with style by DJ Mirano - github.com/Miran20122"
