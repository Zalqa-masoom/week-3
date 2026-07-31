#!/bin/bash
set -euo pipefail
usage() {
    echo "Usage: $0 [threshold] [partition_path]"
    echo "Example: $0 80 /"
    exit 0
}
if [[ "${1:-}" == "-h" || "${1:-}" == "--help" ]]; then
    usage
fi
if [ "$#" -ne 2 ]; then
    echo "Error: Invalid number of arguments." >&2
    echo "Usage: $0 [threshold] [partition_path]"
    echo "Example: $0 80 /"
    exit 1
fi
THRESHOLD=$1
PARTITION=$2
CURRENT_USAGE=$(df -h "$PARTITION" | awk 'NR==2 {print $5}' | sed 's/%//')
if ! [[ "$CURRENT_USAGE" =~ ^[0-9]+$ ]]; then
    echo "Error: Could not retrieve disk usage for partition '$PARTITION'." >&2
    exit 1
fi
if [ "$CURRENT_USAGE" -gt "$THRESHOLD" ]; then
    echo "WARNING: Disk usage on $PARTITION is at $CURRENT_USAGE%. Threshold is $THRESHOLD%."
else
    echo "Disk usage on $PARTITION is fine ($CURRENT_USAGE%)."
fi