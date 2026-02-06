#!/bin/bash

# Class Lab Practice Commands

echo "Listing files:"
ls

echo
echo "Current directory:"
pwd

echo
echo "Disk usage:"
df -h

echo
echo "Memory usage:"
free -h 2>/dev/null || vm_stat

echo
echo "Processes:"
ps aux | head
