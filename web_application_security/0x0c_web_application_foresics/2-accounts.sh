#!/bin/bash
grep 'Failed password for' auth.log | awk '{print $10} | sort | uniq -c | sort -nr | head -1 | awk '{print $2}'
