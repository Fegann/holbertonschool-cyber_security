#!/bin/bash
awk '{print $5}' logs.txt | sort | uniq -c | sort -nr
