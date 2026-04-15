#!/bin/bash
grep 'Accepted' auth.log | awk '{print $11}' | sort | uniq -c | sort -nr | wc -l | awk '{print $1}'
