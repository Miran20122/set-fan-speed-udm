# 🌬️ UDM Fan Speed Script by DJ Mirano

A lightweight shell script that sets custom fan speeds on your UniFi Dream Machine Pro (UDM Pro).  
Perfect for reducing noise or optimizing cooling for your HDDs and CPU — all with a simple auto-start setup that survives reboots and firmware updates.

---

## 🚀 Features

- ✅ Sets fan speeds of the CPU and HDD to 70% and 80%
- 🔁 Runs automatically at boot/reboot via `crontab`
- 🛡️ Persistent through system/firmware updates
- ⚙️ Simple to install and uninstall via SSH

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
