#!/bin/bash
grep 'Accepted' | awk '{print $11}' | sort | uniq -c | sort -nr | wc -l | awk '{print $1}'
