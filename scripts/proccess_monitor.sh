#!/bin/bash

echo "Top 10 CPU-consuming processes:"
echo "--------------------------------"

ps aux --sort=-%cpu | head -11

echo ""
echo "Checking for high CPU usage (>80%)..."
echo "-------------------------------------"

high_cpu=$(ps aux --sort=-%cpu | awk '$3 > 80 {print $2, $11, $3}')

if [ -n "$high_cpu" ]; then
    echo "ALERT: High CPU usage detected!"
    echo "$high_cpu"
else
    echo "No process above 80% CPU."
fi
