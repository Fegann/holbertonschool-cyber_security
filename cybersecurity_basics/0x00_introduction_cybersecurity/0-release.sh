#!/bin/bash
grep -oP '^ID=\K.*' /etc/os-release | head -1 | sed 's/"//g;s/kali-rolling/Kali/g;s/ubuntu/Ubuntu/g;s/debian/Debian/g;s/centos/CentOS/g;s/rhel/RHEL/g;s/fedora/Fedora/g;s/[[:lower:]]/\U&/g'
