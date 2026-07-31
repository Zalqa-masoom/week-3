# Week 3 Project
<br>
This repository contains the updated scripts and configuration files for Week 3.
<br>
## Updates & Additions<br>
* **Bash Scripts:** Added robust error handling using `set -euo pipefail` in shell scripts (such as `backup.sh`) to ensure strict error checking and safe execution.<br>
* **Docker Compose:** Added `docker-compose.yml` to manage multi-container Docker applications seamlessly alongside the existing `Dockerfile`.<br>
<br>
## Files Included<br>
## CI/CD Pipeline
* **GitHub Actions (`ci.yml`):** Configured automated testing and verification to check python dependencies and validate bash script syntax automatically on every push and pull request.<br>
* `backup.sh` - Automated backup script with strict error handling (`set -euo pipefail`).<br>
* `cleanup_tmp.sh` - Temporary file cleanup utility.<br>
* `disk_usage.sh` - Disk usage monitoring script.<br>
* `docker-compose.yml` - Configuration for multi-container orchestration.<br>
* `Dockerfile` - Container definition for the application.<br>
* `main.py` - Main application entry point.<br>
* `my_log_counter.sh` - Script to count and analyze log entries.<br>
* `my_log.txt` - Sample log data file.<br>
* `requirements.txt` - Python dependencies list.<br>
