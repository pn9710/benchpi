#!/bin/bash
# BenchPi Bootstrap v0.1 – Initial setup for all-in-one Pi diagnostics toolkit

set -e

echo "🔧 Updating system..."
sudo apt update && sudo apt upgrade -y

echo "📦 Installing core diagnostic tools..."
sudo apt install -y \
  inxi lshw lscpu lsusb usbutils smartmontools \
  testdisk gparted gnome-disk-utility \
  memtester stress-ng lm-sensors fancontrol \
  htop iotop iftop sysstat parted hdparm badblocks \
  net-tools nmap iperf3 wireshark tcpdump \
  ddrescue dcfldd partclone \
  curl wget git unzip build-essential

echo "📱 Installing mobile device tools..."
sudo apt install -y \
  android-tools-adb android-tools-fastboot \
  libimobiledevice-utils ifuse gvfs-backends

echo "🧠 Installing BIOS flashing tools..."
sudo apt install -y flashrom

echo "🌐 Installing remote/web dashboard tools (optional)..."
sudo apt install -y cockpit
sudo systemctl enable --now cockpit.socket

echo "📊 Installing Netdata (real-time monitor)..."
bash <(curl -Ss https://my-netdata.io/kickstart.sh) || echo "⚠️ Netdata install skipped"

echo "🧰 Creating /benchpi/tools directory for custom scripts..."
mkdir -p ~/benchpi/tools

echo "✅ BenchPi Base Install Complete!"
echo "Next: (Optional) Add TUI or GUI launcher, PiKVM, or flashing scripts."
