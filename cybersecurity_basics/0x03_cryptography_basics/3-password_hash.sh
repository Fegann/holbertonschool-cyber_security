#!/bin/bash
# Generate a random 16-character string using OpenSSL
random_value=$(openssl rand -base64 12 | tr -d '/+=' | cut -c1-16)

# Combine the password and the random string
combined_password="$1$random_value"

# Generate SHA-512 hash of the combined password and save it in 3_hash.txt
echo -n "$combined_password" | openssl dgst -sha512 > 3_hash.txt
