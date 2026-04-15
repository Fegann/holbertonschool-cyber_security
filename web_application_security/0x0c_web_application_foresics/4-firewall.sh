#!/bin/bash
grep 'ufw allow' | sort | uniq | wc -l
