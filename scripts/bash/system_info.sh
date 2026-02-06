#!/bin/bash

echo "===== SYSTEM INFORMATION ====="
echo "Hostname: $(hostname)"
echo "Current User: $(whoami)"
echo "Date: $(date)"
echo

echo "----- CPU Info -----"
lscpu 2>/dev/null || sysctl -n machdep.cpu.brand_string

echo
echo "----- Memory Info -----"
free -h 2>/dev/null || vm_stat

echo
echo "----- Disk Usage -----"
df -h

echo
echo "----- Uptime -----"
uptime
