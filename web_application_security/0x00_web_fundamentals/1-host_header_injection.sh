#!/bin/bash
curl -s -X POST "$2" _H "Host: $1" -H "Content-Type: application/x-www-form-urlencoded" --data "$3"
