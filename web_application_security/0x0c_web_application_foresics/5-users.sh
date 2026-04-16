#!/bin/bash
grep "new user" log_fayli.log | cut -d '=' -f 2 | cut -d ',' -f 1 | sort -u | tr '\n' ',' | sed 's/,$/\n/'
