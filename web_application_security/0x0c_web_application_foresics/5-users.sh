#!/bin/bash
grep "new user" auth.log | awk '{print $8}' | sort | sed 's//name=/'
