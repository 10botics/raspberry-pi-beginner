#!/bin/bash

# Function to log messages with timestamp
log_message() {
    echo "[$(date '+%Y-%m-%d %H:%M:%S')] $1"
}

# Function to wait for internet connectivity
wait_for_internet() {
    local max_attempts=30
    local attempt=1
    local wait_time=10
    
    log_message "Checking for internet connectivity..."
    
    while [ $attempt -le $max_attempts ]; do
        log_message "Attempt $attempt/$max_attempts: Testing connectivity to github.com..."
        
        # Test DNS resolution and connectivity
        if nslookup github.com >/dev/null 2>&1 && ping -c 1 -W 5 github.com >/dev/null 2>&1; then
            log_message "SUCCESS: Internet connectivity confirmed"
            return 0
        fi
        
        log_message "No internet connectivity yet, waiting ${wait_time} seconds..."
        sleep $wait_time
        attempt=$((attempt + 1))
    done
    
    log_message "ERROR: Failed to establish internet connectivity after $((max_attempts * wait_time)) seconds"
    return 1
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
    if git pull --ff-only; then
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

# Wait for internet connectivity before proceeding
if ! wait_for_internet; then
    log_message "FATAL: Cannot proceed without internet connectivity"
    exit 1
fi

# Update each repository
update_repo "/home/pi/raspberry-pi-beginner"
update_repo "/home/pi/pi-led-racer"
update_repo "/home/pi/pi-squat-counter"

log_message "=== Notebook update script completed ==="

