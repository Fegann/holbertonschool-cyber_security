#!/bin/bash

# Parametr yoxlaması: Əgər parametr daxil edilməyibsə, çıxış ver
if [ -z "$1" ]; then
    echo "Usage: $0 <key_name>"
    exit 1
fi

# Parametrləri al
KEY_NAME="$1"

# RSA açar cütünü yaradın (4096 bitlik ölçü ilə)
ssh-keygen -t rsa -b 4096 -f "$KEY_NAME" -N "" > /dev/null 2>&1

# Çıxış məlumatı
echo "Your identification has been saved in $KEY_NAME"
echo "Your public key has been saved in $KEY_NAME.pub"
