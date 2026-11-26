#!/bin/bash

# Author: Sourav
# System Information Report

echo "===================================="
echo "       SYSTEM INFORMATION REPORT"
echo "===================================="
echo "Name: Sourav"
echo "Date: $(date)"
echo ""

echo "CPU INFORMATION:"
if [[ "$OSTYPE" == "darwin"* ]]; then
    sysctl -n machdep.cpu.brand_string
    sysctl -n hw.ncpu
else
    lscpu | grep -E 'Model name|CPU\(s\)'
fi

echo ""
echo "MEMORY INFORMATION:"
if command -v free >/dev/null 2>&1; then
    free -h
else
    top -l 1 | grep PhysMem
fi

echo ""
echo "TOP 3 PROCESSES BY CPU:"
ps aux | sort -nrk 3 | head -n 3

echo ""
echo "===================================="
echo "Report generated successfully."
