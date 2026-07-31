#!/bin/bash
set -euo pipefail
usage() {
    echo "Usage: $0 [options]"
    echo "  -d, --days <days>  Specify file age threshold in days (default: 7)"
    echo "  -h, --help         Display this help message"
    exit 0
}
DAYS=7
while [[ "$#" -gt 0 ]]; do
    case $1 in
        -d|--days) DAYS="$2"; shift ;;
        -h|--help) usage ;;
        *) echo "Unknown parameter passed: $1"; echo "Use --help for usage information."; exit 1 ;;
    esac
    shift
done

TARGET_DIR="/tmp"
echo "Starting cleanup of $TARGET_DIR directory for files older than $DAYS days..."
if find "$TARGET_DIR" -type f -mtime +"$DAYS" -delete; then
    echo "Cleanup completed successfully!"
else
    echo "Error: Cleanup encountered an issue!" >&2
    exit 1
fi