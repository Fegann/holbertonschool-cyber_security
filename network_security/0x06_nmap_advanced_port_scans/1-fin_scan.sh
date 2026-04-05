#!/bin/bash
sudo nmap -T2 -sF -f -p 80-85 $1
