### Day 4: Automation with Bash

#### **Task 1: Write a Script to Automate System Updates**

**Objective:** Create a script to automate the process of updating the system, including upgrading installed packages and cleaning up unnecessary files.

**Script:**

```bash
#!/bin/bash
# Script to automate system updates

# Update the package list
echo "Updating package list..."
sudo apt-get update -y

# Upgrade all installed packages
echo "Upgrading installed packages..."
sudo apt-get upgrade -y

# Perform a distribution upgrade
echo "Performing distribution upgrade..."
sudo apt-get dist-upgrade -y

# Clean up unnecessary packages and files
echo "Cleaning up unnecessary packages..."
sudo apt-get autoremove -y
sudo apt-get autoclean -y

echo "System update complete."
```

**Explanation:**

- **`sudo apt-get update`:** Updates the list of available packages and their versions.
- **`sudo apt-get upgrade`:** Installs the newest versions of all packages currently installed on the system.
- **`sudo apt-get dist-upgrade`:** Performs an upgrade that intelligently handles changing dependencies with new versions of packages.
- **`sudo apt-get autoremove`:** Removes packages that were automatically installed to satisfy dependencies for other packages and are no longer needed.
- **`sudo apt-get autoclean`:** Removes retrieved package files that are no longer in use.

**Outcome:** A script that automates the system update process, ensuring the system is always running with the latest security patches and features.

---

#### **Task 2: Schedule Tasks Using `cron` and `at`**

**Objective:** Learn how to schedule tasks to run at specific times using `cron` for recurring tasks and `at` for one-time tasks.

**Steps:**

1. **Using `cron` for Recurring Tasks:**

   - **Crontab Syntax:**
     ```
     * * * * * command_to_run
     ```
     - The five asterisks represent minute, hour, day of the month, month, and day of the week.
     - Example: Schedule a script to run every day at 2 AM:
       ```bash
       0 2 * * * /path/to/script.sh
       ```
   - **Editing the Crontab:**
     ```bash
     crontab -e
     ```
     Add the cron job to the file and save.

2. **Using `at` for One-Time Tasks:**

   - **Scheduling a Task with `at`:**

     ```bash
     echo "/path/to/script.sh" | at 2:00 AM
     ```

     This schedules the script to run at 2 AM the next day.

   - **Listing Scheduled `at` Jobs:**

     ```bash
     atq
     ```

   - **Removing a Scheduled `at` Job:**
     ```bash
     atrm <job_number>
     ```

**Outcome:** The ability to automate and schedule tasks using `cron` for regular tasks and `at` for one-time events, enhancing system automation capabilities.

---

#### **Task 3: Write a Backup Script for a Directory**

**Objective:** Create a script to back up a specified directory to a designated location.

**Script:**

```bash
#!/bin/bash
# Script to back up a directory

# Directory to back up
source_dir="/path/to/source_directory"
# Backup destination
backup_dir="/path/to/backup_directory"
# Create a timestamp
timestamp=$(date +"%Y%m%d_%H%M%S")
# Create a backup file name
backup_file="backup_$timestamp.tar.gz"

# Perform the backup using tar
tar -czf "$backup_dir/$backup_file" "$source_dir"

echo "Backup of $source_dir completed successfully."
echo "Backup saved as $backup_dir/$backup_file"
```

**Explanation:**

- **`source_dir`:** The directory you want to back up.
- **`backup_dir`:** The directory where the backup will be stored.
- **`tar -czf`:** Creates a compressed tarball (gzip) of the source directory.

**Outcome:** A reliable backup script that archives and compresses the specified directory, ensuring data is safely stored and recoverable.

---

#### **Task 4: Automate the Setup of a Development Environment**

**Objective:** Develop a script to automate the installation and configuration of essential tools for a development environment.

**Script:**

```bash
#!/bin/bash
# Script to automate development environment setup

# Update and upgrade the system
sudo apt-get update -y
sudo apt-get upgrade -y

# Install essential development tools
sudo apt-get install -y git vim curl build-essential

# Install programming languages (example: Python and Node.js)
sudo apt-get install -y python3 python3-pip nodejs npm

# Set up Git configuration
git config --global user.name "Your Name"
git config --global user.email "your.email@example.com"

# Create a directory structure for projects
mkdir -p ~/projects/{python,nodejs}

echo "Development environment setup complete."
```

**Explanation:**

- Installs essential tools and programming languages.
- Sets up Git with user configuration.
- Creates a directory structure for organizing projects.

**Outcome:** An automated setup script that quickly prepares a development environment, saving time and ensuring consistency across setups.

---

#### **Task 5: Write a Script to Monitor System Resource Usage**

**Objective:** Create a script to monitor and report on system resource usage, such as CPU, memory, and disk usage.

**Script:**

```bash
#!/bin/bash
# Script to monitor system resource usage

# Display CPU usage
echo "CPU Usage:"
top -bn1 | grep "Cpu(s)" | \
sed "s/.*, *\([0-9.]*\)%* id.*/\1/" | \
awk '{print 100 - $1"%"}'

# Display Memory usage
echo "Memory Usage:"
free -m | awk 'NR==2{printf "Memory Usage: %s/%sMB (%.2f%%)\n", $3,$2,$3*100/$2 }'

# Display Disk usage
echo "Disk Usage:"
df -h | grep -E '^/dev/root' | awk '{ print $5 " (" $1 ")" }'

# Display top 5 processes by memory usage
echo "Top 5 processes by memory usage:"
ps aux --sort=-%mem | awk 'NR<=5{printf "%-10s %-10s %-10s %-10s %-10s\n", $1, $2, $3, $4, $11}'
```

**Explanation:**

- **CPU Usage:** Uses `top` and `awk` to calculate CPU usage.
- **Memory Usage:** Uses `free` to display memory usage in MB and percentage.
- **Disk Usage:** Uses `df` to show disk usage.
- **Top Processes:** Lists the top 5 processes by memory usage.

**Outcome:** A script that provides real-time monitoring of system resources, useful for system administrators to track and manage system performance.

---
