#!/bin/bash
tail -1000 auth.log | grep 'Failed password for' | awk '{print $9}' | sort | uniq -c | sort -nr | sed -n '3p' | awk '{print $2}'
