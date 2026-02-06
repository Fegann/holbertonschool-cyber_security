#!/bin/bash
john --wordlist=/usr/share/wordlists/rockyou.txt --format=Raw-SHA256 "$1" && john --show --format=Raw-SHA256 "$1" | cut -d: -f2 | head -n -2 > 4-password.txt
