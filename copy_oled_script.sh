#!/bin/bash

# Script to copy oled-hostname-ip.py to SD card mounted directories
# Source file
SOURCE_FILE="/home/jonathantse/Dropbox/d7951/projects/raspberry-pi-beginner/admin/oled-hostname-ip.py"

# Target directories
TARGET_DIRS=(
    "/media/jonathantse/rootfs/home/pi/raspberry-pi-beginner/admin"
    "/media/jonathantse/rootfs1/home/pi/raspberry-pi-beginner/admin"
    "/media/jonathantse/rootfs2/home/pi/raspberry-pi-beginner/admin"
)

# Mount points to unmount
MOUNT_POINTS=(
    "/media/jonathantse/rootfs"
    "/media/jonathantse/rootfs1"
    "/media/jonathantse/rootfs2"
)

# Check if source file exists
if [ ! -f "$SOURCE_FILE" ]; then
    echo "Error: Source file not found: $SOURCE_FILE"
    exit 1
fi

# Copy to each target directory
for target_dir in "${TARGET_DIRS[@]}"; do
    echo "Copying to: $target_dir"
    
    # Create target directory if it doesn't exist
    if [ ! -d "$target_dir" ]; then
        echo "Creating directory: $target_dir"
        mkdir -p "$target_dir"
    fi
    
    # Copy the file
    if cp "$SOURCE_FILE" "$target_dir/"; then
        echo "Successfully copied to: $target_dir"
    else
        echo "Error: Failed to copy to: $target_dir"
    fi
    echo "---"
done

echo "Copy operation completed!"

# Unmount all partitions
echo "Unmounting SD card partitions..."
for mount_point in "${MOUNT_POINTS[@]}"; do
    if mountpoint -q "$mount_point"; then
        echo "Unmounting: $mount_point"
        if sudo umount "$mount_point"; then
            echo "Successfully unmounted: $mount_point"
        else
            echo "Error: Failed to unmount: $mount_point"
        fi
    else
        echo "Not mounted: $mount_point"
    fi
done

echo "All operations completed! SD card is now safe to remove." 