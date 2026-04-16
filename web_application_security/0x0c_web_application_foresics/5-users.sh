#!/bin/bash
grep "new user" auth.log | awk '{print $7}' | sort | tr '\n' ',' | sed 's/,$//'
