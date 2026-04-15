#!/bin/bash
grep "new user" auth.log | awk -F'[=,]' '{print $7}' | sort | tr '\n' ',' | sed 's/,$//'
