#!/bin/bash
grep "Accepted" auth.log | grep -oE "[0-9]+\.[0-9]+\.[0-9]+\.[0-9]+" | sort | uniq | head -3
