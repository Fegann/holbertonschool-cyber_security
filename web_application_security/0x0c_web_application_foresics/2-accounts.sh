#!/bin/bash
tail -1000 auth.log | grep 'Failed password for' | awk '{print $10}' | sort | uniq -c | sort -nr | head -2 | awk '{print $2}'
