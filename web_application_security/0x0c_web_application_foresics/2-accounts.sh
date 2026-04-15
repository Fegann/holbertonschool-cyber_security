#!/bin/bash
tail -1000 auth.log | grep 'Failed|Accepted' | awk '{print $9}' | sort | uniq -c | sort -nr | head -1 | awk '{print $2}'
