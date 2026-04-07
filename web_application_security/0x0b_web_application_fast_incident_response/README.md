# Web Application Fast Incident Response

## Description
This project focuses on rapid incident response techniques for web applications. The primary goal is to quickly analyze server logs, identify malicious activities (such as Denial of Service attacks, brute-force attempts, or vulnerability scanning), and extract actionable intelligence to mitigate active threats.

Incident response is a critical component of web application security, requiring fast, scriptable, and reliable methods to parse large amounts of data under pressure.

## Learning Objectives
* Understand how to parse and analyze web server access logs (e.g., Apache, Nginx).
* Identify indicators of compromise (IoCs) and anomalous behavior.
* Use basic command-line tools (`awk`, `grep`, `sort`, `uniq`, etc.) for fast data extraction.
* Automate the identification of attacking IP addresses.

## Requirements
* **Allowed Editors:** `vi`, `vim`, `emacs`
* **Environment:** All scripts will be tested on Ubuntu 20.04 LTS.
* **Shell:** All Bash scripts must be executable and start with `#!/bin/bash`.
* All files should end with a new line.

## Files and Scripts

| File | Description |
|---|---|
| `0-attack_ip.sh` | A Bash script that extracts the IP address with the highest number of requests from a log file (`logs.txt`), typically used to identify the source of a DoS attack. |
| `logs.txt` | Sample server log file used for testing the incident response scripts. |

## Usage

### 0. Identify the Attacker's IP
To run the script that finds the IP address with the highest number of requests, ensure you have a `logs.txt` file in the same directory, make the script executable, and run it:

```bash
$chmod +x 0-attack_ip.sh$ ./0-attack_ip.sh
192.168.1.105
