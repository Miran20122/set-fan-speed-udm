#!/bin/sh

echo "==============================================="
echo "  🌬️  DJ Mirano's UDM Fan Speed Installer"
echo "==============================================="
echo ""
echo "📦 Installing fan speed script..."
echo ""

mkdir -p /data/on_boot.d
mkdir -p /data/systemd

curl -fsSL https://raw.githubusercontent.com/Miran20122/set-fan-speed-udm/main/set-fan-speed.sh -o /data/on_boot.d/set-fan-speed.sh
chmod +x /data/on_boot.d/set-fan-speed.sh

cat << 'EOF' > /data/systemd/udm-fan-speed.service
[Unit]
Description=DJ Mirano UDM Fan Speed Service
After=network.target

[Service]
Type=oneshot
ExecStart=/data/on_boot.d/set-fan-speed.sh
RemainAfterExit=yes

[Install]
WantedBy=multi-user.target
EOF

ln -sf /data/systemd/udm-fan-speed.service /etc/systemd/system/udm-fan-speed.service
systemctl daemon-reload
systemctl enable udm-fan-speed.service

CRON_LINE="@reboot /data/on_boot.d/set-fan-speed.sh"
(crontab -l 2>/dev/null | grep -Fv "$CRON_LINE" ; echo "$CRON_LINE") | crontab -

echo ""
echo "🚀 Starting fan speed service..."
systemctl start udm-fan-speed.service

echo ""
echo "✅ Installation complete!"
echo "🔁 Fan speeds will now apply on every boot, restart, and update."
echo "👑 Made with style by DJ Mirano - github.com/Miran20122"
