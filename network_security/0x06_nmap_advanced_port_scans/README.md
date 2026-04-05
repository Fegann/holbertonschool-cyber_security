🛰️ Advanced Port Scanning with Nmap

A practical guide and toolkit for performing advanced port scanning using Nmap (Network Mapper). This repository demonstrates real-world scanning techniques used in security assessments and network reconnaissance.

📌 Overview

Nmap is a powerful open-source tool for network discovery and security auditing. This project focuses on:

Advanced port scanning techniques
Service and version detection
OS fingerprinting
Stealth and evasion methods
Automation with scripts (NSE)
⚙️ Requirements
Nmap (v7.80+ recommended)
Linux / macOS / Windows
Root / Administrator privileges (for advanced scans)

Install Nmap:

# Ubuntu / Debian
sudo apt install nmap

# macOS (Homebrew)
brew install nmap

# Windows
https://nmap.org/download.html
🚀 Basic Usage
nmap <target>

Example:

nmap 192.168.1.1
🔍 Advanced Scanning Techniques
1. SYN Scan (Stealth Scan)
sudo nmap -sS <target>
Fast and stealthy
Requires root privileges
2. Full TCP Connect Scan
nmap -sT <target>
No root required
Less stealthy
3. Service Version Detection
nmap -sV <target>
Identifies service versions
4. OS Detection
sudo nmap -O <target>
Attempts to detect operating system
5. Aggressive Scan
sudo nmap -A <target>

Includes:

OS detection
Version detection
Script scanning
Traceroute
6. Scan Specific Ports
nmap -p 22,80,443 <target>

Or full range:

nmap -p- <target>
7. Fast Scan
nmap -F <target>
Scans top 100 ports
8. UDP Scan
sudo nmap -sU <target>
Slower but useful
🧠 Nmap Scripting Engine (NSE)

Run default scripts:

nmap -sC <target>

Run specific script:

nmap --script vuln <target>

Examples:

nmap --script=http-title <target>
nmap --script=ftp-anon <target>
🛡️ Evasion Techniques
Fragment Packets
nmap -f <target>
Decoy Scan
nmap -D RND:10 <target>
Spoof MAC Address
nmap --spoof-mac 0 <target>
📊 Output Options

Save results:

nmap -oN output.txt <target>
nmap -oX output.xml <target>
nmap -oA scan_results <target>
⚠️ Legal Disclaimer

This project is intended for educational and authorized security testing purposes only.

Do NOT scan networks without explicit permission.
