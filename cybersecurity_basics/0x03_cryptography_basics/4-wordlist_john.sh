#!/bin/bash
john --wordlist=rockyou.txt --format=raw-sha256 "$1" && john --show "$1" > 4-password.txt
