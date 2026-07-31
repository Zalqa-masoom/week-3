#!/bin/bash
set -euo pipefail
usage() {
    echo "Usage: $0 [options]"
    echo "  -d, --dir <path>   Specify the directory to back up (default: current directory)"
    echo "  -h, --help         Display this help message"
    exit 0
}
TARGET_DIR="."
while [[ "$#" -gt 0 ]]; do
    case $1 in
        -d|--dir) TARGET_DIR="$2"; shift ;;
        -h|--help) usage ;;
        *) echo "Unknown parameter passed: $1"; echo "Use --help for usage information."; exit 1 ;;
    esac
    shift
done
BACKUP_DIR="my_backups"
mkdir -p "$BACKUP_DIR"
now=$(date +"%Y-%m-%d_%H-%M-%S")
BACKUP_FILE="$BACKUP_DIR/backup_$now.tar.gz"
echo "Creating backup of '$TARGET_DIR'..."
if tar -czf "$BACKUP_FILE" "$TARGET_DIR"; then
    echo "Done! Backup successfully created at $BACKUP_FILE."
else
    echo "Error: Backup failed!" >&2
    exit 1
fi