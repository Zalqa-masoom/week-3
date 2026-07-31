#!/bin/bash
set -euo pipefail
if [ "$#" -ne 2 ]; then
echo "Usage: $0 [log_file] [pattern]"
exit 1
fi
LOG_FILE=$1
PATTERN=$2
COUNT=$(grep -c "$PATTERN" "$LOG_FILE")
echo "THE PATTERN '$PATTERN' appered $COUNT time in $LOG_FILE."

