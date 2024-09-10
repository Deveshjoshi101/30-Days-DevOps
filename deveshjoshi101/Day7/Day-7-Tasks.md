### Day 7: Mini Project

### Day 7: Mini Project - Comprehensive System Maintenance Script

#### **Project Overview**

The goal of this mini-project is to create a comprehensive Bash script that automates several key system maintenance tasks: performing backups, checking disk usage, updating the system, and monitoring system health. The script will be well-documented with clear comments and usage instructions to ensure it is easy to understand and maintain.

#### **Script Breakdown**

1. **Script Structure:**

   - The script will be divided into functions, each responsible for a specific maintenance task.
   - A main menu will be implemented to allow users to choose which tasks to perform.

2. **Tasks Covered:**
   - **Backup:** Back up a specified directory.
   - **Disk Usage Check:** Check and report disk usage.
   - **System Update:** Update the system package manager and installed packages.
   - **System Health Monitoring:** Monitor CPU, memory, and disk health.

#### **Script Implementation**

```bash
#!/bin/bash

# Function to perform a backup
backup_directory() {
    src_dir="$1"
    backup_dir="$2"

    if [ ! -d "$src_dir" ]; then
        echo "Source directory does not exist."
        return 1
    fi

    if [ ! -d "$backup_dir" ]; then
        echo "Backup directory does not exist. Creating it now..."
        mkdir -p "$backup_dir"
    fi

    timestamp=$(date +"%Y%m%d_%H%M%S")
    tar -czf "$backup_dir/backup_$timestamp.tar.gz" -C "$src_dir" .

    echo "Backup of $src_dir completed and saved to $backup_dir."
}

# Function to check disk usage
check_disk_usage() {
    df -h | grep '^/dev/'
}

# Function to update the system
update_system() {
    echo "Updating package lists..."
    sudo apt-get update

    echo "Upgrading installed packages..."
    sudo apt-get upgrade -y

    echo "System update completed."
}

# Function to monitor system health
monitor_system_health() {
    echo "CPU Usage:"
    top -b -n1 | grep "Cpu(s)" | awk '{print $2 + $4 "% CPU usage"}'

    echo "Memory Usage:"
    free -h | grep Mem | awk '{print $3 "/" $2 " used (" $3/$2*100 "%)"}'

    echo "Disk Usage:"
    df -h | grep '^/dev/'
}

# Main menu
while true; do
    echo "System Maintenance Script"
    echo "1. Backup Directory"
    echo "2. Check Disk Usage"
    echo "3. Update System"
    echo "4. Monitor System Health"
    echo "5. Exit"
    echo -n "Enter your choice: "
    read choice

    case $choice in
        1)
            echo -n "Enter the directory to back up: "
            read src_dir
            echo -n "Enter the backup destination directory: "
            read backup_dir
            backup_directory "$src_dir" "$backup_dir"
            ;;
        2)
            check_disk_usage
            ;;
        3)
            update_system
            ;;
        4)
            monitor_system_health
            ;;
        5)
            echo "Exiting..."
            exit 0
            ;;
        *)
            echo "Invalid choice, please try again."
            ;;
    esac
    echo ""
done
```

#### **Usage Instructions**

1. **Backup Directory:**

   - The script will prompt for the source directory and the backup destination directory.
   - A compressed backup file will be created in the specified destination with a timestamp.

2. **Check Disk Usage:**

   - This option displays the disk usage of all mounted filesystems, focusing on primary partitions.

3. **Update System:**

   - The script will run the `apt-get update` and `apt-get upgrade` commands to update the system's package lists and installed packages.

4. **Monitor System Health:**

   - This option provides a summary of the CPU and memory usage, as well as the disk space usage.

5. **Exiting the Script:**
   - The script will loop back to the main menu after completing any task unless the user chooses to exit.
