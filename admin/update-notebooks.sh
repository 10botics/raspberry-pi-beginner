#!/bin/bash

# Function to log messages with timestamp
log_message() {
    echo "[$(date '+%Y-%m-%d %H:%M:%S')] $1"
}

# Function to update git repository
update_repo() {
    local repo_path="$1"
    local repo_name="$(basename "$repo_path")"
    
    log_message "Starting update for repository: $repo_name"
    
    if [ ! -d "$repo_path" ]; then
        log_message "WARNING: Directory $repo_path does not exist, skipping..."
        return 1
    fi
    
    log_message "Changing to directory: $repo_path"
    cd "$repo_path" || {
        log_message "ERROR: Failed to change to directory $repo_path"
        return 1
    }
    
    log_message "Checking git status for $repo_name..."
    git status --porcelain
    
    log_message "Pulling latest changes for $repo_name..."
    if git pull; then
        log_message "SUCCESS: $repo_name updated successfully"
    else
        log_message "ERROR: Failed to pull updates for $repo_name"
        return 1
    fi
    
    log_message "Completed update for $repo_name"
    echo "----------------------------------------"
}

# Start script execution
log_message "=== Starting notebook update script ==="
log_message "Running as user: $(whoami)"
log_message "Current working directory: $(pwd)"

# Update each repository
update_repo "/home/pi/raspberry-pi-beginner"
update_repo "/home/pi/pi-led-racer"
update_repo "/home/pi/pi-squat-counter"

log_message "=== Notebook update script completed ==="

