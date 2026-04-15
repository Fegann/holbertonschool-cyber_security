#!/bin/bash
tail -1000 auth.log | grep "Accepted" | grep -oE "[0-9]+\.[0-9]+\.[0-9]+\.[0-9]+" | sort | uniq | wc -l
