#!/bin/bash
# Extracts the IP address with the highest number of requests from logs.txt

awk '{print $7}' logs.txt | sort | uniq -c | sort -nr | head -n 1 | awk '{print $2}'

