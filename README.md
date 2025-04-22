## **BenchPi - All-in-One Raspberry Pi Diagnostic Toolkit**

**BenchPi** is a custom-built toolkit designed to help diagnose broken PC parts, repair BIOS, recover data, and interact with mobile devices using your Raspberry Pi. It combines tools for system diagnostics, BIOS flashing, data recovery, remote control, and more in one handy package.

### **Features:**
- **PC Diagnostics:** Detect and test hardware (CPU, RAM, drives, network, etc.)
- **BIOS Repair & Update:** Flash BIOS directly through GPIO or USB
- **Data Recovery:** Recover data from damaged or corrupted disks
- **Mobile Device Access:** Manage Android and iOS devices via `adb` and `libimobiledevice`
- **Network Tools:** Monitor and troubleshoot networks with `nmap`, `iperf3`, `tcpdump`, etc.
- **PiKVM-like Functionality:** Remotely control PCs via Raspberry Pi

---

### **Getting Started**

#### **Prerequisites**
- **Raspberry Pi 4** (recommended for performance, but it works on other models as well)
- **Raspberry Pi OS Lite (64-bit)** installed on the Pi
- A stable internet connection for installing packages
- A computer or device to SSH into the Pi

#### **Installation Steps**

1. **Flash Raspberry Pi OS Lite 64-bit** onto your SD card.
2. **Enable SSH:**
   - After flashing the OS, create an empty file named `ssh` (no extension) in the boot directory of the SD card.
3. **Boot and SSH into the Raspberry Pi:**
   - Power up your Pi and find its IP address (via your router or use a network scanner).
   - SSH into the Pi using:
     ```bash
     ssh pi@<Pi_IP_Address>
     ```
   - Default password: `raspberry`

4. **Download and Install BenchPi:**
   Run the following commands to install all required diagnostic tools:
   ```bash
   wget https://github.com/pn9710/benchpi/raw/main/benchpi-bootstrap.sh
   chmod +x benchpi-bootstrap.sh
   ./benchpi-bootstrap.sh
   ```

   This will install:
   - Diagnostic tools (e.g., `inxi`, `lshw`, `smartctl`)
   - Mobile device tools (`adb`, `fastboot`, `libimobiledevice`)
   - Data recovery utilities (`testdisk`, `gparted`)
   - Network troubleshooting tools (`nmap`, `iperf3`)
   - BIOS flashing tools (`flashrom`)
   - PiKVM-like functionality (optional, for remote control)

---

### **Usage**

After installation, you can begin diagnosing or repairing devices connected to your Pi.

#### **PC Diagnostics:**
You can run diagnostic commands like:
```bash
inxi -Fxz
lshw
smartctl -a /dev/sda
```

#### **Data Recovery:**
To recover lost data from a damaged disk, you can use `testdisk` or `photorec`:
```bash
sudo testdisk /dev/sda
```

#### **BIOS Flashing:**
To flash a BIOS chip, connect your Raspberry Pi to the target device’s motherboard using GPIO (via `flashrom`) or a USB programmer. Be sure to back up your current BIOS before flashing!

#### **Mobile Device Management:**
To interact with Android or iOS devices:
- **Android**: 
  ```bash
  adb devices
  adb pull /path/to/file
  ```
- **iOS**:
  ```bash
  ideviceinfo
  ```

---

### **Contributing**

1. Fork the repository
2. Create a new branch (`git checkout -b feature-name`)
3. Make your changes
4. Commit your changes (`git commit -am 'Added new feature'`)
5. Push to the branch (`git push origin feature-name`)
6. Create a new Pull Request
---

Let me know if you’d like any tweaks or additions!
