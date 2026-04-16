#!/bin/bash
grep "new user" auth.log | awk '{print $8}' 
