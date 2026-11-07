# 🌬️ UDM Fan Speed Script by DJ Mirano

A lightweight shell script that sets custom fan speeds on your UniFi Dream Machine Pro (UDM Pro).  
Perfect for reducing noise or optimizing cooling for your HDDs and CPU — starts immediately on install and survives reboots and firmware updates.

---

## 🚀 Features

- ✅ Sets CPU and HDD fan speeds to 70% and 80%
- ⚡ Starts immediately upon installation (no reboot required)
- 🔁 Runs automatically at every boot and restart via a `systemd` service
- 🛡️ Stored in `/data/` so it survives UniFi OS and Network updates
- ⚙️ Simple one-line install and uninstall via SSH

---

## 📦 Installation

1. SSH into your UDM Pro.
2. Run the following command:

```bash
curl -fsSL https://raw.githubusercontent.com/Miran20122/set-fan-speed-udm/main/install.sh | sh
```

---

## 📦 Uninstallation

1. SSH into your UDM Pro.
2. Run the following command:

```bash
curl -fsSL https://raw.githubusercontent.com/Miran20122/set-fan-speed-udm/main/uninstall.sh | sh
```
