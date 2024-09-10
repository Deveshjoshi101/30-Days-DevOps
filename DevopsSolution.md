### Day 1: Introduction to Bash Scripting

#### **Task 1: Set up a Linux Environment**

**Objective:** Set up a Linux environment, either using Ubuntu in VirtualBox or the Windows Subsystem for Linux (WSL).

**Steps:**

1. **VirtualBox Installation:**

   - **Download VirtualBox:** Go to the [official VirtualBox website](https://www.virtualbox.org/) and download the latest version for your operating system.
   - **Install VirtualBox:** Follow the installation instructions to install VirtualBox on your machine.
   - **Download Ubuntu ISO:** Visit the [Ubuntu website](https://ubuntu.com/download/desktop) and download the Ubuntu Desktop ISO file.
   - **Create a New Virtual Machine:**
     - Open VirtualBox and click on "New" to create a new virtual machine.
     - Name the VM (e.g., "Ubuntu VM") and select the type and version as "Linux" and "Ubuntu (64-bit)," respectively.
     - Allocate RAM (at least 2 GB) and create a virtual hard disk (20 GB recommended).
   - **Install Ubuntu:**

     - Start the VM and select the Ubuntu ISO as the startup disk.
     - Follow the on-screen instructions to install Ubuntu on the VM.
     - Once installed, reboot the VM and complete the setup.

   - **Windows Subsystem for Linux (WSL) Installation:**
     - **Enable WSL:**
       - Open PowerShell as an administrator and run the following command:
         ```bash
         wsl --install
         ```
     - **Install Ubuntu:**
       - After enabling WSL, open the Microsoft Store and search for "Ubuntu."
       - Install your preferred version of Ubuntu (e.g., Ubuntu 22.04 LTS).
       - Launch Ubuntu from the Start menu and complete the initial setup.

**Outcome:** A fully functional Linux environment (either in VirtualBox or WSL) is set up and ready for use.

---

#### **Task 2: Learn Basic Bash Commands**

**Objective:** Learn and practice basic Bash commands.

**Key Commands:**

1. **`ls` (List Directory Contents):**

   - Lists files and directories in the current working directory.
     ```bash
     ls
     ```

2. **`cd` (Change Directory):**

   - Changes the current directory to the specified path.
     ```bash
     cd /path/to/directory
     ```

3. **`echo` (Display a Line of Text):**

   - Prints the specified text to the terminal.
     ```bash
     echo "Hello, World!"
     ```

4. **`cat` (Concatenate and Display Files):**

   - Displays the contents of a file.
     ```bash
     cat filename.txt
     ```

5. **`pwd` (Print Working Directory):**

   - Displays the current working directory.
     ```bash
     pwd
     ```

6. **`mkdir` (Make Directory):**

   - Creates a new directory.
     ```bash
     mkdir new_directory
     ```

7. **`rm` (Remove Files or Directories):**

   - Deletes files or directories.
     ```bash
     rm filename.txt
     ```

8. **`touch` (Create an Empty File):**
   - Creates an empty file.
     ```bash
     touch newfile.txt
     ```

**Outcome:** A good understanding of basic Bash commands, enabling efficient navigation and manipulation of the file system.

---

#### **Task 3: Write a Simple Script to Automate File Creation and Deletion**

**Objective:** Write a Bash script that automates the creation and deletion of files.

**Script:**

```bash
#!/bin/bash
# Script to create and delete files

# Create 5 files with a loop
for i in {1..5}; do
    touch "file_$i.txt"
    echo "Created file_$i.txt"
done

# Wait for 5 seconds before deletion
sleep 5

# Delete the created files
for i in {1..5}; do
    rm "file_$i.txt"
    echo "Deleted file_$i.txt"
done
```

**Explanation:**

- The script uses a `for` loop to create 5 files named `file_1.txt` to `file_5.txt` using the `touch` command.
- The `echo` command is used to display a message confirming the creation of each file.
- The script pauses for 5 seconds using the `sleep` command.
- Another `for` loop is used to delete the created files using the `rm` command.

**Outcome:** A Bash script that automates the creation and deletion of files, demonstrating basic scripting capabilities.

---

#### **Task 4: Use Conditional Statements (if, else, elif) in a Script**

**Objective:** Write a script using conditional statements to make decisions based on user input.

**Script:**

```bash
#!/bin/bash
# Script to check if a file exists and delete it

read -p "Enter the filename to delete: " filename

if [ -e "$filename" ]; then
    rm "$filename"
    echo "File $filename deleted successfully."
else
    echo "File $filename does not exist."
fi
```

**Explanation:**

- The script prompts the user to enter a filename using `read`.
- The `if` statement checks if the file exists using the `-e` flag.
- If the file exists, it is deleted using the `rm` command, and a success message is displayed.
- If the file does not exist, an error message is displayed.

**Outcome:** A Bash script that uses conditional statements to check for file existence and performs actions based on the result.

---

#### **Task 5: Read and Process User Input in a Script**

**Objective:** Create a script that reads and processes user input.

**Script:**

```bash
#!/bin/bash
# Script to take user input and perform operations

echo "Please enter your name:"
read name

echo "Hello, $name! What would you like to do?"
echo "1. Create a file"
echo "2. Delete a file"
echo "3. Exit"
read -p "Enter your choice (1/2/3): " choice

case $choice in
    1)
        read -p "Enter the filename to create: " filename
        touch "$filename"
        echo "File $filename created."
        ;;
    2)
        read -p "Enter the filename to delete: " filename
        if [ -e "$filename" ]; then
            rm "$filename"
            echo "File $filename deleted."
        else
            echo "File $filename does not exist."
        fi
        ;;
    3)
        echo "Exiting the script. Goodbye!"
        ;;
    *)
        echo "Invalid choice. Please run the script again."
        ;;
esac
```

**Explanation:**

- The script starts by greeting the user and asking for their name.
- The `case` statement is used to handle the user's choice of actions (creating or deleting a file, or exiting).
- Depending on the choice, the script either creates a new file, deletes an existing file, or exits.

**Outcome:** A user-interactive Bash script that processes input to perform different actions.

---

### Day 2: Working with Files and Directories

#### **Task 1: Create, Copy, Move, and Delete Files and Directories Using Bash**

**Objective:** Perform basic file and directory operations using Bash commands.

**Steps:**

1. **Creating Files and Directories:**

   - **Create a File:**

     ```bash
     touch example.txt
     ```

     This command creates an empty file named `example.txt`.

   - **Create a Directory:**
     ```bash
     mkdir example_dir
     ```
     This command creates a directory named `example_dir`.

2. **Copying Files and Directories:**

   - **Copy a File:**

     ```bash
     cp example.txt example_copy.txt
     ```

     This command copies `example.txt` to `example_copy.txt`.

   - **Copy a Directory (Recursively):**
     ```bash
     cp -r example_dir example_dir_copy
     ```
     The `-r` flag enables recursive copying, which is necessary for directories.

3. **Moving Files and Directories:**

   - **Move a File:**

     ```bash
     mv example_copy.txt example_dir/
     ```

     This command moves `example_copy.txt` into the `example_dir` directory.

   - **Move and Rename a File:**
     ```bash
     mv example.txt renamed_example.txt
     ```
     This command moves and renames `example.txt` to `renamed_example.txt`.

4. **Deleting Files and Directories:**

   - **Delete a File:**

     ```bash
     rm renamed_example.txt
     ```

     This command deletes the file `renamed_example.txt`.

   - **Delete a Directory (Recursively):**
     ```bash
     rm -r example_dir
     ```
     The `-r` flag is used to delete a directory and its contents.

**Outcome:** The ability to create, copy, move, and delete files and directories using basic Bash commands.

---

#### **Task 2: Write a Script to Batch Rename Files Based on a Pattern**

**Objective:** Create a Bash script that renames multiple files according to a specified pattern.

**Script:**

```bash
#!/bin/bash
# Script to batch rename files with a specified prefix

# Check if the correct number of arguments is provided
if [ $# -ne 2 ]; then
    echo "Usage: $0 <directory> <prefix>"
    exit 1
fi

directory=$1
prefix=$2
counter=1

# Iterate over all files in the directory
for file in "$directory"/*; do
    # Check if it's a file
    if [ -f "$file" ]; then
        # Get the base name and extension separately
        base_name=$(basename "$file")
        extension="${base_name##*.}"

        # Check if the file has an extension
        if [ "$base_name" == "$extension" ]; then
            # No extension
            new_name="${prefix}_${counter}"
        else
            # Has extension
            new_name="${prefix}_${counter}.${extension}"
        fi

        # Rename the file
        mv "$file" "$directory/$new_name"
        echo "Renamed $file to $new_name"
        ((counter++))
    fi
done
```

**Explanation:**

- The script takes two arguments: a directory path and a prefix for the new filenames.
- It iterates over each file in the specified directory, renaming it to the pattern `<prefix>_<counter>.<extension>`.
- The `counter` variable ensures that each file gets a unique name.

**Usage Example:**

```bash
./rename_files.sh /path/to/directory newname
```

This will rename all files in `/path/to/directory` to `newname_1.extension`, `newname_2.extension`, and so on.

**Outcome:** A script capable of batch renaming files based on a user-defined pattern, making it easier to organize large numbers of files.

---

#### **Task 3: Use Loops (for, while) to Iterate Over Files in a Directory**

**Objective:** Write Bash scripts that use loops to process files within a directory.

**Script 1: Using `for` Loop:**

```bash
#!/bin/bash
# Script to list all files in a directory

directory=$1

for file in "$directory"/*; do
    if [ -f "$file" ]; then
        echo "File: $file"
    fi
done
```

**Script 2: Using `while` Loop:**

```bash
#!/bin/bash
# Script to process files using a while loop

directory=$1
file_list=$(ls "$directory")
counter=1

while [ $counter -le $(echo "$file_list" | wc -l) ]; do
    file=$(echo "$file_list" | sed -n "${counter}p")
    echo "Processing file: $file"
    ((counter++))
done
```

**Explanation:**

- **For Loop Script:** Iterates over all files in the specified directory and prints their names.
- **While Loop Script:** Uses a `while` loop to iterate through a list of files generated by the `ls` command.

**Outcome:** Understanding of how to use loops in Bash to process multiple files, which is crucial for automation tasks.

---

#### **Task 4: Implement Error Handling in Your Scripts**

**Objective:** Enhance scripts with error handling to manage unexpected situations.

**Script:**

```bash
#!/bin/bash
# Script with error handling

file_to_delete=$1

if [ ! -e "$file_to_delete" ]; then
    echo "Error: File $file_to_delete does not exist."
    exit 1
fi

if rm "$file_to_delete"; then
    echo "File $file_to_delete deleted successfully."
else
    echo "Error: Could not delete $file_to_delete."
    exit 1
fi
```

**Explanation:**

- The script checks whether the file exists before attempting to delete it.
- If the file doesn’t exist, an error message is displayed, and the script exits with a status of `1`.
- If the `rm` command fails, another error message is displayed.

**Outcome:** A script that includes basic error handling, making it more robust and user-friendly by providing clear feedback on failures.

---

#### **Task 5: Learn About File Permissions and Modify Them Using `chmod`**

**Objective:** Understand Linux file permissions and how to modify them using the `chmod` command.

**Understanding File Permissions:**

- **File Permissions Format:** File permissions are displayed in a format like `-rwxr-xr--`, where:
  - `r` (read), `w` (write), `x` (execute) are the permission types.
  - The first character indicates the file type (`-` for regular files, `d` for directories).
  - The next three characters represent the owner's permissions, the next three represent the group's permissions, and the final three represent others' permissions.

**Modifying File Permissions:**

- **Change Permissions Using Symbolic Mode:**

  ```bash
  chmod u+x filename.sh
  ```

  This adds execute permission (`x`) for the user (`u`).

- **Change Permissions Using Numeric Mode:**
  ```bash
  chmod 755 filename.sh
  ```
  This sets permissions to `rwxr-xr-x`, meaning the owner can read, write, and execute, while the group and others can only read and execute.

**Example:**

- **Give Full Permissions to the Owner, Read/Execute to Group, and Read-Only to Others:**
  ```bash
  chmod 754 example.txt
  ```
  Results in `rwxr-xr--`.

## **Outcome:** A solid understanding of how to view and modify file permissions, ensuring proper access control for scripts and files.

### Day 3: Text Processing in Bash

#### **Task 1: Learn and Practice Using `grep`, `sed`, and `awk`**

**Objective:** Understand the basic usage of `grep`, `sed`, and `awk` for text processing in Bash.

**Key Commands:**

1. **`grep` (Global Regular Expression Print):**

   - **Basic Usage:**

     ```bash
     grep "pattern" filename
     ```

     Searches for "pattern" in the specified file and prints matching lines.

   - **Case-Insensitive Search:**

     ```bash
     grep -i "pattern" filename
     ```

   - **Search Recursively in Directories:**
     ```bash
     grep -r "pattern" /path/to/directory
     ```

2. **`sed` (Stream Editor):**

   - **Basic Search and Replace:**

     ```bash
     sed 's/oldtext/newtext/g' filename
     ```

     Replaces "oldtext" with "newtext" in the specified file.

   - **Delete Lines Matching a Pattern:**

     ```bash
     sed '/pattern/d' filename
     ```

   - **In-Place Editing (Edit the File Directly):**
     ```bash
     sed -i 's/oldtext/newtext/g' filename
     ```

3. **`awk` (Pattern Scanning and Processing Language):**

   - **Print Specific Columns:**

     ```bash
     awk '{print $1, $3}' filename
     ```

     Prints the first and third columns from the file.

   - **Pattern Matching and Action:**

     ```bash
     awk '/pattern/ {print $0}' filename
     ```

     Prints lines containing "pattern."

   - **Sum Values in a Column:**
     ```bash
     awk '{sum += $2} END {print sum}' filename
     ```
     Sums up all the values in the second column.

**Outcome:** A foundational understanding of `grep`, `sed`, and `awk`, enabling powerful text processing and manipulation in Bash.

---

#### **Task 2: Write a Script to Search and Replace Text in Files**

**Objective:** Create a Bash script to automate text search and replacement in multiple files.

**Script:**

```bash
#!/bin/bash
# Script to search and replace text in files

if [ $# -ne 3 ]; then
    echo "Usage: $0 <search_text> <replace_text> <directory>"
    exit 1
fi

search_text=$1
replace_text=$2
directory=$3

# Find and replace text in all files within the specified directory
for file in "$directory"/*; do
    if [ -f "$file" ]; then
        sed -i "s/$search_text/$replace_text/g" "$file"
        echo "Replaced '$search_text' with '$replace_text' in $file"
    fi
done
```

**Explanation:**

- The script takes three arguments: the text to search for, the replacement text, and the directory to process.
- It iterates over all files in the specified directory, using `sed` to search and replace the text in each file.
- The `-i` flag in `sed` ensures that the changes are made in place.

**Usage Example:**

```bash
./replace_text.sh "foo" "bar" /path/to/directory
```

This command replaces all occurrences of "foo" with "bar" in all files within `/path/to/directory`.

**Outcome:** A versatile script for batch text replacement across multiple files, streamlining editing tasks.

---

#### **Task 3: Use `awk` to Analyze and Format a Text File**

**Objective:** Use `awk` to process and format data in a text file.

**Example Data File (`data.txt`):**

```
John,30,Engineer
Jane,25,Designer
Doe,45,Manager
```

**Script:**

```bash
#!/bin/bash
# Script to format and summarize data using awk

file="data.txt"

# Print the formatted data
awk -F, '{printf "Name: %s, Age: %d, Occupation: %s\n", $1, $2, $3}' "$file"

# Calculate and print the average age
awk -F, '{sum += $2; count++} END {print "Average Age: " sum/count}' "$file"
```

**Explanation:**

- The `-F,` option sets the field separator to a comma.
- The first `awk` command formats the output, printing each line with labels ("Name," "Age," "Occupation").
- The second `awk` command calculates the average age by summing the values in the second column and dividing by the number of entries.

**Output Example:**

```
Name: John, Age: 30, Occupation: Engineer
Name: Jane, Age: 25, Occupation: Designer
Name: Doe, Age: 45, Occupation: Manager
Average Age: 33.3333
```

**Outcome:** Proficiency in using `awk` to analyze and format text data, which is essential for data processing tasks in Bash.

---

#### **Task 4: Practice Sorting and Filtering Text Data Using `sort` and `uniq`**

**Objective:** Learn to sort and filter text data using `sort` and `uniq`.

**Steps:**

1. **Sort a File:**

   ```bash
   sort filename.txt
   ```

   Sorts the lines in `filename.txt` in ascending order.

2. **Sort in Descending Order:**

   ```bash
   sort -r filename.txt
   ```

3. **Remove Duplicate Lines:**

   ```bash
   sort filename.txt | uniq
   ```

4. **Count and Display Duplicate Lines:**

   ```bash
   sort filename.txt | uniq -c
   ```

5. **Sort by a Specific Field (Column):**
   ```bash
   sort -t, -k2 filename.txt
   ```
   Sorts by the second field (column) using a comma as the delimiter.

**Outcome:** Mastery of sorting and filtering text data, allowing for efficient organization and analysis of text files.

---

#### **Task 5: Write a Script to Summarize Data from a Log File**

**Objective:** Develop a Bash script that summarizes key information from a log file.

**Example Log File (`logfile.log`):**

```
2024-08-25 10:00:00 INFO User logged in
2024-08-25 10:05:12 ERROR Failed to connect to database
2024-08-25 10:10:35 INFO Data processing started
2024-08-25 10:15:42 WARN Low disk space
2024-08-25 10:20:00 INFO User logged out
```

**Script:**

```bash
#!/bin/bash
# Script to summarize log file data

logfile="logfile.log"

# Count the number of each log level
echo "Log Level Summary:"
awk '{print $3}' "$logfile" | sort | uniq -c

# Extract and print the number of ERROR and WARN logs
echo "Error and Warning Logs:"
grep -E "ERROR|WARN" "$logfile"

# Count the number of log entries per hour
echo "Log Entries per Hour:"
awk '{print substr($2, 1, 2)}' "$logfile" | sort | uniq -c
```

**Explanation:**

- The first `awk` command extracts the log level (INFO, ERROR, WARN) and summarizes the count for each.
- The `grep` command filters and displays ERROR and WARN logs.
- The final `awk` command counts log entries by the hour, providing a summary of activity over time.

**Output Example:**

```
Log Level Summary:
3 INFO
1 ERROR
1 WARN

Error and Warning Logs:
2024-08-25 10:05:12 ERROR Failed to connect to database
2024-08-25 10:15:42 WARN Low disk space

Log Entries per Hour:
5 10
```

**Outcome:** A practical script to summarize and analyze log files, essential for monitoring and debugging in system administration.

---

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

### Day 5: Advanced Bash Scripting

#### **Task 1: Learn About Functions in Bash and Write Reusable Code**

**Objective:** Understand the concept of functions in Bash and create reusable code segments.

**Key Concepts:**

1. **Defining a Function:**

   ```bash
   function_name() {
       # Code to execute
   }
   ```

2. **Calling a Function:**

   - Functions can be called by simply using their name:
     ```bash
     function_name
     ```

3. **Returning Values:**
   - Functions can return values using the `return` keyword (limited to numeric values) or by echoing the value:
     ```bash
     add_numbers() {
         result=$(($1 + $2))
         echo $result
     }
     sum=$(add_numbers 5 3)
     ```

**Example Script:**

```bash
#!/bin/bash
# Script demonstrating the use of functions

# Function to check if a directory exists
check_directory() {
    if [ -d "$1" ]; then
        echo "Directory $1 exists."
    else
        echo "Directory $1 does not exist."
    fi
}

# Function to calculate factorial
factorial() {
    if [ $1 -le 1 ]; then
        echo 1
    else
        prev=$(factorial $(($1 - 1)))
        echo $(($1 * $prev))
    fi
}

# Call functions
check_directory "/home"
echo "Factorial of 5: $(factorial 5)"
```

**Outcome:** Proficiency in creating and using functions in Bash, allowing for more modular and reusable code.

---

#### **Task 2: Write a Script to Manage User Accounts**

**Objective:** Develop a script to create and delete user accounts on a Linux system.

**Script:**

```bash
#!/bin/bash
# Script to manage user accounts

# Function to create a user
create_user() {
    if id "$1" &>/dev/null; then
        echo "User $1 already exists."
    else
        sudo useradd "$1"
        echo "User $1 created."
    fi
}

# Function to delete a user
delete_user() {
    if id "$1" &>/dev/null; then
        sudo userdel "$1"
        echo "User $1 deleted."
    else
        echo "User $1 does not exist."
    fi
}

# Main script logic
echo "User Management Script"
echo "1. Create User"
echo "2. Delete User"
echo -n "Choose an option: "
read option

echo -n "Enter username: "
read username

case $option in
    1) create_user "$username" ;;
    2) delete_user "$username" ;;
    *) echo "Invalid option" ;;
esac
```

**Explanation:**

- The script includes functions to create and delete users.
- Uses conditional statements to check if a user exists before creating or deleting.

**Outcome:** A user-friendly script to manage user accounts, automating the process of adding and removing users.

---

#### **Task 3: Explore and Use Bash Arrays**

**Objective:** Learn how to work with arrays in Bash for storing and manipulating multiple values.

**Key Concepts:**

1. **Defining an Array:**

   ```bash
   array_name=(value1 value2 value3)
   ```

2. **Accessing Array Elements:**

   - Access elements using index numbers:
     ```bash
     echo ${array_name[0]}
     ```

3. **Looping Through an Array:**
   - Use a `for` loop to iterate over array elements:
     ```bash
     for element in "${array_name[@]}"; do
         echo $element
     done
     ```

**Example Script:**

```bash
#!/bin/bash
# Script demonstrating the use of arrays

# Define an array of colors
colors=("red" "green" "blue" "yellow")

# Print all colors
echo "All colors: ${colors[@]}"

# Print the first color
echo "First color: ${colors[0]}"

# Add a new color to the array
colors+=("purple")
echo "Colors after adding purple: ${colors[@]}"

# Loop through the array
for color in "${colors[@]}"; do
    echo "Color: $color"
done
```

**Outcome:** Understanding of Bash arrays, enabling storage and manipulation of multiple related values within scripts.

---

#### **Task 4: Write a Script to Check the Status of a Service**

**Objective:** Create a script to check if a specific service is running and report its status.

**Script:**

```bash
#!/bin/bash
# Script to check the status of a service

service_name="$1"

if systemctl is-active --quiet "$service_name"; then
    echo "The service $service_name is running."
else
    echo "The service $service_name is not running."
fi
```

**Explanation:**

- The script uses `systemctl is-active` to check the status of a service.
- It takes the service name as an argument and outputs whether it is running or not.

**Usage Example:**

```bash
./check_service.sh apache2
```

**Outcome:** A practical script to monitor the status of system services, crucial for maintaining server health.

---

#### **Task 5: Implement a Simple Menu-Driven Interface in a Script**

**Objective:** Build a script that provides a menu-driven interface, allowing users to choose from various options.

**Script:**

```bash
#!/bin/bash
# Menu-driven interface example

while true; do
    echo "Main Menu:"
    echo "1. Display Date and Time"
    echo "2. List Files in Current Directory"
    echo "3. Check Disk Usage"
    echo "4. Exit"
    echo -n "Enter your choice: "
    read choice

    case $choice in
        1) echo "Date and Time: $(date)" ;;
        2) echo "Files in $(pwd):" && ls ;;
        3) echo "Disk Usage:" && df -h ;;
        4) echo "Exiting..." && exit 0 ;;
        *) echo "Invalid choice, please try again." ;;
    esac
    echo ""
done
```

**Explanation:**

- The script presents a menu with options for displaying the date and time, listing files, checking disk usage, and exiting.
- The `while true` loop ensures that the menu reappears after each selection until the user chooses to exit.

**Outcome:** A versatile script with a user-friendly interface, demonstrating how to create interactive Bash scripts for various administrative tasks.

---

### Conclusion:

This report covers advanced Bash scripting topics, including functions, user account management, arrays, service status checking, and menu-driven interfaces. Mastery of these skills enables the creation of powerful and efficient scripts, streamlining system administration and automation tasks.

### Day 6: Networking in Bash

#### **Task 1: Learn Basic Networking Commands (ping, netstat, ifconfig)**

**Objective:** Understand and practice basic networking commands in Bash to troubleshoot and monitor network issues.

**Key Commands:**

1. **`ping`:** Checks the network connectivity to a host.

   ```bash
   ping -c 4 google.com
   ```

   - **`-c 4`**: Sends 4 packets.

2. **`netstat`:** Displays network connections, routing tables, and interface statistics.

   ```bash
   netstat -tuln
   ```

   - **`-tuln`**: Shows TCP and UDP listening ports in numerical form.

3. **`ifconfig`:** Configures and displays network interfaces.
   ```bash
   ifconfig
   ```
   - Displays IP address, netmask, and other network settings of interfaces.

**Outcome:** Proficiency with basic networking commands, essential for diagnosing and troubleshooting network-related issues in a Linux environment.

---

#### **Task 2: Write a Script to Monitor Network Connectivity**

**Objective:** Create a script to monitor the connectivity to a specific host or server by continuously pinging it.

**Script:**

```bash
#!/bin/bash
# Script to monitor network connectivity

host="google.com"
log_file="network_status.log"

while true; do
    if ping -c 1 $host &>/dev/null; then
        echo "$(date): $host is reachable." >> $log_file
    else
        echo "$(date): $host is not reachable." >> $log_file
    fi
    sleep 60
done
```

**Explanation:**

- The script continuously pings the specified host (`google.com` in this case) every 60 seconds.
- Logs the connectivity status with a timestamp into `network_status.log`.

**Outcome:** A simple network monitoring script that logs the reachability of a specified host, useful for tracking connectivity issues over time.

---

#### **Task 3: Automate the Process of Checking Open Ports**

**Objective:** Develop a script to automate the process of checking which ports are open on a system.

**Script:**

```bash
#!/bin/bash
# Script to check open ports

echo "Open ports on $(hostname):"
sudo netstat -tuln | grep LISTEN
```

**Explanation:**

- Uses `netstat` with `grep` to filter and display only the ports that are currently listening for incoming connections.

**Outcome:** A quick and automated way to check open ports on a system, helping to identify and secure unnecessary services.

---

#### **Task 4: Write a Script to Fetch Data from a Web Page Using `curl`**

**Objective:** Use `curl` to fetch and display data from a specific web page.

**Script:**

```bash
#!/bin/bash
# Script to fetch data from a web page

url="https://www.example.com"
output_file="webpage_content.html"

curl -o $output_file $url

echo "Data fetched from $url and saved to $output_file."
```

**Explanation:**

- **`curl -o`**: Saves the fetched data to a specified file (`webpage_content.html`).
- Fetches the content of `https://www.example.com` and saves it locally.

**Outcome:** A practical script to retrieve and save web page content, useful for automating tasks like downloading data or monitoring website changes.

---

#### **Task 5: Schedule a Script to Periodically Check a Website’s Status**

**Objective:** Write a script to check if a website is up and schedule it to run periodically using `cron`.

**Script:**

```bash
#!/bin/bash
# Script to check website status

url="https://www.example.com"
log_file="website_status.log"

status_code=$(curl -o /dev/null -s -w "%{http_code}\n" $url)

if [ $status_code -eq 200 ]; then
    echo "$(date): $url is up. Status code: $status_code" >> $log_file
else
    echo "$(date): $url is down. Status code: $status_code" >> $log_file
fi
```

**Scheduling with `cron`:**

1. Open the crontab editor:
   ```bash
   crontab -e
   ```
2. Add a cron job to run the script every 10 minutes:
   ```bash
   */10 * * * * /path/to/script.sh
   ```

**Explanation:**

- The script checks the HTTP status code of the specified URL.
- Logs whether the website is up or down, based on the status code (200 indicates the website is up).

**Outcome:** A scheduled task that periodically checks and logs the status of a website, useful for monitoring website availability.

---

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

### Day 8: Linux File System and Structure

#### **Task 1: Understand the Linux Directory Structure**

**Objective:** Learn the hierarchy and purpose of different directories in the Linux filesystem.

**Key Directories:**

- **`/`:** The root directory, the top-level directory of the filesystem.
- **`/bin`:** Essential command binaries (e.g., `ls`, `cp`).
- **`/boot`:** Bootloader files, including the kernel.
- **`/dev`:** Device files representing hardware components (e.g., `/dev/sda`).
- **`/etc`:** System configuration files.
- **`/home`:** User home directories.
- **`/lib`:** Essential shared libraries for binaries in `/bin` and `/sbin`.
- **`/mnt`:** Temporary mount points for filesystems.
- **`/opt`:** Optional software packages.
- **`/proc`:** Virtual filesystem providing process and system information.
- **`/root`:** Home directory for the root user.
- **`/sbin`:** System binaries, primarily for root user.
- **`/tmp`:** Temporary files.
- **`/usr`:** Secondary hierarchy for user data; contains binaries, libraries, and documentation.
- **`/var`:** Variable files like logs, databases, and spool files.

**Outcome:** Familiarity with the purpose and typical content of each directory in the Linux filesystem, critical for system navigation and management.

---

#### **Task 2: Learn About Mounting and Unmounting File Systems**

**Objective:** Understand how to mount and unmount filesystems in Linux, which is essential for accessing different storage devices.

**Mounting a Filesystem:**

```bash
sudo mount /dev/sdX1 /mnt
```

- **`/dev/sdX1`:** Replace with the appropriate device identifier.
- **`/mnt`:** The directory where the filesystem will be mounted.

**Unmounting a Filesystem:**

```bash
sudo umount /mnt
```

- Ensures safe removal of the storage device.

**Outcome:** Ability to mount and unmount filesystems, allowing access to external drives, partitions, and network shares.

---

#### **Task 3: Explore and Practice with `df`, `du`, and `fdisk` Commands**

**Objective:** Gain proficiency in disk management and usage analysis tools.

1. **`df`:** Displays disk space usage.
   ```bash
   df -h
   ```
   - **`-h`:** Human-readable format, showing sizes in KB, MB, GB, etc.
2. **`du`:** Estimates file and directory space usage.
   ```bash
   du -sh /path/to/directory
   ```
   - **`-s`:** Summary of total space used.
   - **`-h`:** Human-readable format.
3. **`fdisk`:** Partition table manipulator.
   ```bash
   sudo fdisk -l
   ```
   - Lists all partitions on the system.

**Outcome:** Ability to monitor disk usage and manage partitions, crucial for maintaining system health and performance.

---

#### **Task 4: Create and Manage Partitions Using `parted` or `gparted`**

**Objective:** Learn to create, resize, and manage partitions using partitioning tools.

**Using `parted`:**

1. Start `parted` on a specific device:
   ```bash
   sudo parted /dev/sdX
   ```
2. Create a new partition:
   ```bash
   mkpart primary ext4 1MiB 100%
   ```
   - Creates a primary partition with an ext4 filesystem.

**Using `gparted`:**

- **GParted** is a graphical tool with a user-friendly interface for managing partitions.
- Perform operations like creating, resizing, deleting, and moving partitions visually.

**Outcome:** Competence in creating and managing disk partitions, enabling efficient use of disk space and preparation for system installation or multi-boot setups.

---

#### **Task 5: Learn About File System Permissions and Ownership**

**Objective:** Understand and practice setting file permissions and ownership in Linux.

**File Permissions:**

- Permissions are displayed as `rwx` for the owner, group, and others.
- Use `chmod` to change permissions.
  ```bash
  chmod 755 filename
  ```
  - **`7`**: Owner has read, write, execute.
  - **`5`**: Group and others have read and execute.

**File Ownership:**

- Change file ownership with `chown`.
  ```bash
  sudo chown user:group filename
  ```
  - Changes the owner and group of the file.

**Outcome:** Mastery of file permissions and ownership, ensuring proper security and access control in a multi-user environment.

---

### Day 9: Linux Users and Permissions

#### **Task 1: Learn About User and Group Management**

**Objective:** Understand the basics of managing users and groups in Linux.

**Key Concepts:**

- **Users:** Individual accounts that represent people or services.
- **Groups:** Collections of users that share the same permissions.
- **Important Files:**
  - **`/etc/passwd`:** Contains user account information.
  - **`/etc/shadow`:** Stores password information in a secure format.
  - **`/etc/group`:** Defines the groups on the system.

**Commands:**

- **View all users:**
  ```bash
  cat /etc/passwd
  ```
- **View all groups:**
  ```bash
  cat /etc/group
  ```

**Outcome:** Understanding of how users and groups are structured and managed in Linux, which is foundational for user account management.

---

#### **Task 2: Practice Creating, Deleting, and Modifying User Accounts**

**Objective:** Get hands-on experience with user account management.

**Commands:**

1. **Create a User:**

   ```bash
   sudo useradd -m username
   ```

   - **`-m`:** Creates a home directory for the user.

2. **Set a Password for the User:**

   ```bash
   sudo passwd username
   ```

3. **Delete a User:**

   ```bash
   sudo userdel -r username
   ```

   - **`-r`:** Removes the user's home directory and mail spool.

4. **Modify a User:**
   - **Change Username:**
     ```bash
     sudo usermod -l newname oldname
     ```
   - **Change User's Home Directory:**
     ```bash
     sudo usermod -d /new/home/dir -m username
     ```

**Outcome:** Ability to create, delete, and modify user accounts, which is essential for system administration and managing user access.

---

#### **Task 3: Learn About and Modify User Privileges (e.g., `sudo`)**

**Objective:** Understand and configure user privileges, particularly the `sudo` command.

**Key Concepts:**

- **`sudo`:** Allows a permitted user to execute a command as the superuser or another user.
- **`/etc/sudoers`:** The configuration file that controls the behavior of `sudo`.

**Commands:**

1. **Add a User to the `sudo` Group:**

   ```bash
   sudo usermod -aG sudo username
   ```

   - **`-aG`:** Adds the user to the specified group(s).

2. **Edit `sudoers` File:**
   - Use `visudo` to safely edit the `/etc/sudoers` file:
     ```bash
     sudo visudo
     ```
   - Example entry to allow a user to run all commands:
     ```bash
     username ALL=(ALL:ALL) ALL
     ```

**Outcome:** Understanding how to grant and manage user privileges, ensuring that users have the appropriate level of access for their roles.

---

#### **Task 4: Understand and Configure File Permissions Using `chmod` and `chown`**

**Objective:** Master file permissions and ownership management.

**Commands:**

1. **Change File Permissions with `chmod`:**

   ```bash
   chmod 755 filename
   ```

   - **`7`**: Owner has read, write, execute.
   - **`5`**: Group and others have read and execute.

2. **Change File Ownership with `chown`:**
   ```bash
   sudo chown user:group filename
   ```

**Outcome:** Ability to control file access through permissions and ownership, critical for maintaining system security and proper user access.

---

#### **Task 5: Write a Script to Manage Users and Permissions**

**Objective:** Automate user and permission management through a Bash script.

**Script Implementation:**

```bash
#!/bin/bash

# Function to create a user
create_user() {
    echo -n "Enter username to create: "
    read username
    sudo useradd -m "$username"
    sudo passwd "$username"
    echo "User $username created successfully."
}

# Function to delete a user
delete_user() {
    echo -n "Enter username to delete: "
    read username
    sudo userdel -r "$username"
    echo "User $username deleted successfully."
}

# Function to modify a user's privileges
modify_privileges() {
    echo -n "Enter username to modify: "
    read username
    sudo usermod -aG sudo "$username"
    echo "User $username has been granted sudo privileges."
}

# Function to change file permissions
change_permissions() {
    echo -n "Enter file name: "
    read filename
    echo -n "Enter permissions (e.g., 755): "
    read permissions
    chmod "$permissions" "$filename"
    echo "Permissions for $filename changed to $permissions."
}

# Main menu
while true; do
    echo "User and Permission Management Script"
    echo "1. Create User"
    echo "2. Delete User"
    echo "3. Modify User Privileges"
    echo "4. Change File Permissions"
    echo "5. Exit"
    echo -n "Enter your choice: "
    read choice

    case $choice in
        1) create_user ;;
        2) delete_user ;;
        3) modify_privileges ;;
        4) change_permissions ;;
        5) exit 0 ;;
        *) echo "Invalid choice, please try again." ;;
    esac
    echo ""
done
```

**Outcome:** A reusable Bash script that automates common user and permission management tasks, improving efficiency and reducing the likelihood of errors.

---

### Day 10: Linux Processes and Jobs

#### **Task 1: Learn About Linux Processes and How to Manage Them**

**Objective:** Understand what processes are in Linux, how they work, and how to manage them.

**Key Concepts:**

- **Process:** A running instance of a program.
- **PID (Process ID):** A unique identifier for each process.
- **Parent and Child Processes:** A process can spawn other processes, known as child processes.

**Commands for Managing Processes:**

- **List Running Processes:**
  ```bash
  ps aux
  ```
  - `a` for all users, `u` for user-oriented format, `x` for processes without a controlling terminal.
- **Terminate a Process:**

  ```bash
  kill PID
  ```

  - Replace `PID` with the process ID you want to terminate.

- **Force Terminate a Process:**

  ```bash
  kill -9 PID
  ```

  - Forcefully terminates a process.

- **Start a Process in the Background:**

  ```bash
  command &
  ```

- **Bring a Background Process to the Foreground:**
  ```bash
  fg
  ```

**Outcome:** Understanding of what processes are, how they are managed, and how to control them using basic commands.

---

#### **Task 2: Practice Using `ps`, `top`, and `htop` to Monitor Processes**

**Objective:** Gain experience with tools to monitor system processes.

**Commands:**

1. **`ps`:** View active processes.

   ```bash
   ps aux
   ```

   - Displays detailed information about all running processes.

2. **`top`:** Real-time process monitoring.

   ```bash
   top
   ```

   - Press `q` to exit.

3. **`htop`:** Enhanced interactive process viewer.
   ```bash
   sudo apt-get install htop
   htop
   ```
   - Offers a more user-friendly interface than `top`.

**Outcome:** Ability to monitor and analyze system processes in real-time, helping with system performance and troubleshooting.

---

#### **Task 3: Explore Job Scheduling with `cron` and `at`**

**Objective:** Learn how to schedule tasks to run at specific times using `cron` and `at`.

**Using `cron`:**

- **Edit `cron` jobs:**
  ```bash
  crontab -e
  ```
  - Example of a cron job that runs a script every day at 2 AM:
    ```bash
    0 2 * * * /path/to/script.sh
    ```

**Using `at`:**

- **Schedule a one-time job:**

  ```bash
  at 5:00 PM
  ```

  - Enter the command to run, followed by `Ctrl+D` to save.

- **List scheduled `at` jobs:**

  ```bash
  atq
  ```

- **Remove a scheduled `at` job:**
  ```bash
  atrm job_number
  ```

**Outcome:** Understanding of how to automate tasks using `cron` for repetitive tasks and `at` for one-time jobs.

---

#### **Task 4: Write a Script to Monitor and Kill Processes Automatically**

**Objective:** Create a script that automatically monitors and terminates processes based on certain criteria.

**Script Implementation:**

```bash
#!/bin/bash

# Define the process name or part of the name
PROCESS_NAME="example_process"

# Set the CPU usage threshold (in %)
CPU_THRESHOLD=80

# Monitor and kill processes exceeding the CPU threshold
while true; do
    ps -eo pid,%cpu,comm --sort=-%cpu | grep "$PROCESS_NAME" | while read -r pid cpu command; do
        if (( $(echo "$cpu > $CPU_THRESHOLD" | bc -l) )); then
            echo "Process $command (PID: $pid) is using $cpu% CPU. Killing it."
            kill -9 "$pid"
        fi
    done
    sleep 10
done
```

- **Explanation:**
  - The script monitors processes matching `PROCESS_NAME`.
  - If a process exceeds the `CPU_THRESHOLD`, it is terminated.
  - The script checks every 10 seconds.

**Outcome:** A practical tool to automatically manage resource-hogging processes, improving system stability.

---

#### **Task 5: Learn About Runlevels and How to Manage Services**

**Objective:** Understand Linux runlevels and how to manage services across these levels.

**Key Concepts:**

- **Runlevels:** Different states of the system, each with a specific purpose (e.g., single-user mode, multi-user mode).

  - Runlevels 0-6:
    - **0:** Halt
    - **1:** Single-user mode
    - **2-5:** Multi-user modes (2 is typically default)
    - **6:** Reboot

- **Systemd:** Modern systems use `systemd` instead of traditional runlevels.
  - **Targets:** The `systemd` equivalent of runlevels.

**Commands:**

1. **Check Current Runlevel:**

   ```bash
   runlevel
   ```

2. **Change Runlevel (using `telinit`):**

   ```bash
   sudo telinit 3
   ```

   - Changes to runlevel 3 (multi-user without GUI).

3. **List All Services:**

   ```bash
   systemctl list-units --type=service
   ```

4. **Start/Stop a Service:**
   ```bash
   sudo systemctl start service_name
   sudo systemctl stop service_name
   ```

**Outcome:** Understanding of how to manage system states and services, enabling more effective control over the system's behavior and resource allocation.

---

### Day 11: Package Management in Linux

#### **Task 1: Learn About Package Managers (e.g., `apt`, `yum`, `dnf`)**

**Objective:** Understand the role of package managers in Linux and how they handle software installation and management.

**Key Concepts:**

- **Package Manager:** A tool that automates the process of installing, updating, configuring, and removing software packages.
- **Types of Package Managers:**
  - **`apt` (Advanced Package Tool):** Used in Debian-based distributions (e.g., Ubuntu).
  - **`yum` (Yellowdog Updater Modified):** Used in older Red Hat-based distributions (e.g., CentOS 7).
  - **`dnf` (Dandified YUM):** The successor to `yum`, used in newer Red Hat-based distributions (e.g., CentOS 8, Fedora).

**Basic Commands:**

- **`apt`:**
  - Update package list: `sudo apt update`
  - Install a package: `sudo apt install package_name`
  - Remove a package: `sudo apt remove package_name`
  - Upgrade all packages: `sudo apt upgrade`
- **`yum`:**

  - Update package list: `sudo yum check-update`
  - Install a package: `sudo yum install package_name`
  - Remove a package: `sudo yum remove package_name`
  - Upgrade all packages: `sudo yum update`

- **`dnf`:**
  - Update package list: `sudo dnf check-update`
  - Install a package: `sudo dnf install package_name`
  - Remove a package: `sudo dnf remove package_name`
  - Upgrade all packages: `sudo dnf upgrade`

**Outcome:** Understanding of how different package managers work and how to perform common package management tasks.

---

#### **Task 2: Practice Installing, Updating, and Removing Packages**

**Objective:** Gain hands-on experience with managing packages using different package managers.

**Commands:**

1. **Install a Package:**

   ```bash
   sudo apt install vim    # For Debian-based systems
   sudo yum install vim    # For older Red Hat-based systems
   sudo dnf install vim    # For newer Red Hat-based systems
   ```

2. **Update a Package:**

   ```bash
   sudo apt update && sudo apt upgrade vim    # Debian-based
   sudo yum update vim    # Older Red Hat-based
   sudo dnf update vim    # Newer Red Hat-based
   ```

3. **Remove a Package:**
   ```bash
   sudo apt remove vim    # Debian-based
   sudo yum remove vim    # Older Red Hat-based
   sudo dnf remove vim    # Newer Red Hat-based
   ```

**Outcome:** Ability to perform basic package management tasks, ensuring that you can install, update, and remove software as needed.

---

#### **Task 3: Explore and Configure Package Repositories**

**Objective:** Understand how to add and manage software repositories to access additional software.

**Key Concepts:**

- **Package Repository:** A collection of software packages available for installation.

**For `apt`:**

1. **Add a Repository:**

   ```bash
   sudo add-apt-repository ppa:repository_name
   sudo apt update
   ```

2. **Remove a Repository:**
   ```bash
   sudo add-apt-repository --remove ppa:repository_name
   sudo apt update
   ```

**For `yum` or `dnf`:**

1. **Add a Repository:**

   - Create a new `.repo` file in `/etc/yum.repos.d/` with repository details.

   ```bash
   sudo nano /etc/yum.repos.d/myrepo.repo
   ```

   - Example `.repo` file:
     ```ini
     [myrepo]
     name=My Repository
     baseurl=http://my.repo.url/path/
     enabled=1
     gpgcheck=1
     ```

2. **Remove a Repository:**
   - Delete the corresponding `.repo` file from `/etc/yum.repos.d/`.

**Outcome:** Ability to manage package repositories, providing access to a wider range of software.

---

#### **Task 4: Write a Script to Automate Package Updates**

**Objective:** Create a script that automates the process of updating installed packages.

**Script Implementation:**

```bash
#!/bin/bash

# Update package lists
echo "Updating package lists..."
sudo apt update   # For Debian-based systems
# sudo yum check-update   # For older Red Hat-based systems
# sudo dnf check-update   # For newer Red Hat-based systems

# Upgrade all packages
echo "Upgrading packages..."
sudo apt upgrade -y   # For Debian-based systems
# sudo yum update -y   # For older Red Hat-based systems
# sudo dnf upgrade -y   # For newer Red Hat-based systems

echo "Packages updated successfully."
```

- **Explanation:**
  - Updates the package list and upgrades all installed packages.
  - Adjust the script to use `yum` or `dnf` depending on the system.

**Outcome:** Automation of package updates to ensure that systems remain up-to-date with the latest software versions.

---

#### **Task 5: Learn About and Use Snap and Flatpak Packages**

**Objective:** Explore alternative package formats and management systems.

**Snap Packages:**

- **Install Snap:**

  ```bash
  sudo apt install snapd   # For Debian-based systems
  ```

- **Install a Snap Package:**
  ```bash
  sudo snap install package_name
  ```

**Flatpak Packages:**

- **Install Flatpak:**

  ```bash
  sudo apt install flatpak   # For Debian-based systems
  ```

- **Install a Flatpak Package:**
  ```bash
  flatpak install flathub package_name
  ```

**Outcome:** Understanding and using Snap and Flatpak packages, which provide an alternative method of managing applications across different Linux distributions.

---

### Day 12: Linux Networking Basics

#### **Task 1: Learn About IP Addressing and Subnetting**

**Objective:** Understand the fundamentals of IP addressing and subnetting to effectively manage and configure network settings.

**Key Concepts:**

- **IP Address:** A unique identifier for a device on a network.

  - **IPv4 Address:** Consists of four octets (e.g., `192.168.1.1`).
  - **IPv6 Address:** Consists of eight groups of four hexadecimal digits (e.g., `2001:db8::ff00:42:8329`).

- **Subnetting:** Dividing an IP address space into smaller, manageable subnets.
  - **Subnet Mask:** Defines the network and host portions of an IP address (e.g., `255.255.255.0`).
  - **CIDR Notation:** Provides a shorthand for subnet masks (e.g., `192.168.1.0/24`).

**Calculations:**

- **Subnet Calculation:** Determine the number of subnets and hosts per subnet based on the subnet mask.
- **Network Address:** The first address in a subnet.
- **Broadcast Address:** The last address in a subnet, used for broadcasting messages.

**Outcome:** Ability to understand and calculate IP addresses and subnet configurations, essential for network design and management.

---

#### **Task 2: Configure Network Interfaces Using `ifconfig` or `ip`**

**Objective:** Learn how to configure network interfaces using traditional (`ifconfig`) and modern (`ip`) tools.

**Using `ifconfig`:**

1. **View Network Interfaces:**

   ```bash
   ifconfig
   ```

2. **Assign an IP Address:**

   ```bash
   sudo ifconfig eth0 192.168.1.100 netmask 255.255.255.0
   ```

3. **Bring Interface Up/Down:**
   ```bash
   sudo ifconfig eth0 up
   sudo ifconfig eth0 down
   ```

**Using `ip`:**

1. **View Network Interfaces:**

   ```bash
   ip addr show
   ```

2. **Assign an IP Address:**

   ```bash
   sudo ip addr add 192.168.1.100/24 dev eth0
   ```

3. **Bring Interface Up/Down:**
   ```bash
   sudo ip link set eth0 up
   sudo ip link set eth0 down
   ```

**Outcome:** Proficiency in configuring network interfaces using both traditional and modern tools.

---

#### **Task 3: Practice Using Networking Tools Like `ping`, `traceroute`, and `netstat`**

**Objective:** Gain practical experience with common networking tools to diagnose and troubleshoot network issues.

**Commands:**

1. **`ping`:** Test connectivity to a remote host.

   ```bash
   ping google.com
   ```

   - Press `Ctrl+C` to stop the ping process.

2. **`traceroute`:** Trace the path packets take to a remote host.

   ```bash
   traceroute google.com
   ```

3. **`netstat`:** Display network connections, routing tables, and interface statistics.
   ```bash
   netstat -tuln    # Show listening ports
   netstat -r       # Show routing table
   ```

**Outcome:** Ability to use networking tools to diagnose network connectivity and performance issues.

---

#### **Task 4: Set Up and Configure a Basic Firewall Using `ufw` or `iptables`**

**Objective:** Learn to configure a firewall to control network traffic and enhance system security.

**Using `ufw` (Uncomplicated Firewall):**

1. **Enable UFW:**

   ```bash
   sudo ufw enable
   ```

2. **Allow/deny Specific Ports:**

   ```bash
   sudo ufw allow 22/tcp     # Allow SSH
   sudo ufw deny 80/tcp      # Deny HTTP
   ```

3. **Check Firewall Status:**
   ```bash
   sudo ufw status
   ```

**Using `iptables`:**

1. **View Existing Rules:**

   ```bash
   sudo iptables -L
   ```

2. **Add Rules:**

   ```bash
   sudo iptables -A INPUT -p tcp --dport 22 -j ACCEPT    # Allow SSH
   sudo iptables -A INPUT -p tcp --dport 80 -j DROP      # Deny HTTP
   ```

3. **Save and Restore Rules:**
   - **Save Rules:**
     ```bash
     sudo iptables-save > /etc/iptables/rules.v4
     ```
   - **Restore Rules:**
     ```bash
     sudo iptables-restore < /etc/iptables/rules.v4
     ```

**Outcome:** Ability to set up and configure basic firewall rules to manage and secure network traffic.

---

#### **Task 5: Write a Script to Automate Network Configuration**

**Objective:** Create a script to automate network interface configuration and management tasks.

**Script Implementation:**

```bash
#!/bin/bash

# Define network interface and IP address
INTERFACE="eth0"
IP_ADDRESS="192.168.1.100/24"
GATEWAY="192.168.1.1"

# Configure the network interface
echo "Configuring network interface $INTERFACE..."

# Assign IP address
sudo ip addr add $IP_ADDRESS dev $INTERFACE

# Bring the interface up
sudo ip link set $INTERFACE up

# Set the default gateway
sudo ip route add default via $GATEWAY

echo "Network configuration applied successfully."
```

- **Explanation:**
  - Assigns an IP address and brings up the network interface.
  - Sets the default gateway for routing traffic.

**Outcome:** Automation of network configuration tasks, simplifying network setup and management.

---

### Day 13: Shell Scripting for Linux Administration

#### **Task 1: Write a Script to Automate User Account Creation**

**Objective:** Create a script that simplifies the process of adding new user accounts on a Linux system.

**Script Implementation:**

```bash
#!/bin/bash

# Check if sufficient arguments are provided
if [ "$#" -ne 2 ]; then
    echo "Usage: $0 username password"
    exit 1
fi

USERNAME=$1
PASSWORD=$2

# Create the user with the specified username
sudo useradd -m $USERNAME

# Set the user's password
echo "$USERNAME:$PASSWORD" | sudo chpasswd

# Provide feedback
echo "User $USERNAME created and password set."
```

- **Explanation:**
  - The script takes a username and password as arguments.
  - Creates a new user and sets the provided password.
  - Includes basic error checking to ensure the correct number of arguments is provided.

**Outcome:** Automation of user account creation, saving time and reducing manual errors.

---

#### **Task 2: Automate the Setup of a Basic LAMP/LEMP Stack**

**Objective:** Create a script to install and configure a LAMP (Linux, Apache, MySQL, PHP) or LEMP (Linux, Nginx, MySQL/MariaDB, PHP) stack.

**LAMP Script Implementation:**

```bash
#!/bin/bash

# Update package list
sudo apt update

# Install Apache
sudo apt install -y apache2

# Install MySQL
sudo apt install -y mysql-server
sudo mysql_secure_installation

# Install PHP
sudo apt install -y php libapache2-mod-php php-mysql

# Restart Apache to apply changes
sudo systemctl restart apache2

# Provide feedback
echo "LAMP stack installed and configured."
```

**LEMP Script Implementation:**

```bash
#!/bin/bash

# Update package list
sudo apt update

# Install Nginx
sudo apt install -y nginx

# Install MySQL
sudo apt install -y mysql-server
sudo mysql_secure_installation

# Install PHP and necessary modules
sudo apt install -y php-fpm php-mysql

# Configure Nginx to use PHP
sudo tee /etc/nginx/sites-available/default <<EOF
server {
    listen 80;
    root /var/www/html;
    index index.php index.html index.htm;

    server_name your_domain;

    location / {
        try_files \$uri \$uri/ =404;
    }

    location ~ \.php$ {
        include snippets/fastcgi-php.conf;
        fastcgi_pass unix:/var/run/php/php7.4-fpm.sock;
        fastcgi_param SCRIPT_FILENAME \$document_root\$fastcgi_script_name;
        include fastcgi_params;
    }
}
EOF

# Restart Nginx and PHP-FPM to apply changes
sudo systemctl restart nginx
sudo systemctl restart php7.4-fpm

# Provide feedback
echo "LEMP stack installed and configured."
```

- **Explanation:**
  - The LAMP script installs Apache, MySQL, and PHP, then restarts Apache.
  - The LEMP script installs Nginx, MySQL, and PHP-FPM, configures Nginx to use PHP, and restarts the services.

**Outcome:** Automation of the LAMP/LEMP stack setup, streamlining the installation and configuration process.

---

#### **Task 3: Write a Script to Monitor Disk Space and Send Alerts**

**Objective:** Create a script that checks disk space usage and sends alerts when usage exceeds a specified threshold.

**Script Implementation:**

```bash
#!/bin/bash

# Define threshold (e.g., 80%)
THRESHOLD=80

# Get the current disk usage percentage
USAGE=$(df / | grep / | awk '{ print $5 }' | sed 's/%//g')

# Check if usage exceeds the threshold
if [ "$USAGE" -gt "$THRESHOLD" ]; then
    # Send an alert (using mail command, configure for your mail server)
    echo "Disk usage is at ${USAGE}% on $(hostname)" | mail -s "Disk Usage Alert" user@example.com
fi
```

- **Explanation:**
  - The script calculates the disk usage percentage.
  - Sends an email alert if usage exceeds the defined threshold.
  - Requires configuration of a mail server or mail utility.

**Outcome:** Automated monitoring and alerting for disk space usage, ensuring timely notifications of potential issues.

---

#### **Task 4: Automate the Process of System Updates and Upgrades**

**Objective:** Create a script that automates the process of updating and upgrading the system packages.

**Script Implementation:**

```bash
#!/bin/bash

# Update package list
sudo apt update

# Upgrade all installed packages
sudo apt upgrade -y

# Clean up obsolete packages
sudo apt autoremove -y

# Provide feedback
echo "System updates and upgrades completed."
```

- **Explanation:**
  - The script updates the package list, upgrades all installed packages, and removes obsolete packages.
  - Ensures the system is up-to-date with the latest patches and software versions.

**Outcome:** Automation of system updates and upgrades, maintaining system security and performance.

---

#### **Task 5: Write a Script to Manage and Archive Log Files**

**Objective:** Create a script that manages and archives log files to prevent them from consuming too much disk space.

**Script Implementation:**

```bash
#!/bin/bash

# Define log directory and archive directory
LOG_DIR="/var/log"
ARCHIVE_DIR="/var/log/archive"
DATE=$(date +%F)

# Create archive directory if it doesn't exist
mkdir -p $ARCHIVE_DIR

# Archive old log files
for LOG_FILE in $(ls $LOG_DIR/*.log); do
    tar -czf $ARCHIVE_DIR/$(basename $LOG_FILE)-$DATE.tar.gz $LOG_FILE
    > $LOG_FILE
done

# Provide feedback
echo "Log files archived and rotated."
```

- **Explanation:**
  - Archives all `.log` files in the specified log directory.
  - Compresses logs into `.tar.gz` files and clears the original log files.
  - Creates an archive directory if it does not exist.

**Outcome:** Automated management and archiving of log files, preventing disk space issues due to excessive log accumulation.

---

### Day 14: Mini Project - Complete Linux Server Setup and Automation

**Project Objective:** Set up a Linux server with a complete LAMP/LEMP stack, configure basic security settings including a firewall and SSH keys, and write scripts to automate routine maintenance tasks. Document the entire process with clear instructions.

---

#### **1. Server Setup**

##### **1.1. Prepare the Server**

- **Choose a Linux Distribution:** Use Ubuntu Server 20.04 LTS or later for this example.
- **Access the Server:** Use SSH to access your server.

  ```bash
  ssh username@server_ip
  ```

##### **1.2. Update System Packages**

- Update and upgrade existing packages:

  ```bash
  sudo apt update
  sudo apt upgrade -y
  ```

---

#### **2. Install LAMP/LEMP Stack**

##### **2.1. LAMP Stack Installation**

- **Install Apache:**

  ```bash
  sudo apt install -y apache2
  ```

- **Install MySQL:**

  ```bash
  sudo apt install -y mysql-server
  sudo mysql_secure_installation
  ```

- **Install PHP:**

  ```bash
  sudo apt install -y php libapache2-mod-php php-mysql
  ```

- **Restart Apache:**

  ```bash
  sudo systemctl restart apache2
  ```

**Verify Apache and PHP Installation:**

- Create a PHP info file to test:

  ```bash
  echo "<?php phpinfo(); ?>" | sudo tee /var/www/html/info.php
  ```

- Access `http://your_server_ip/info.php` in a browser to verify.

##### **2.2. LEMP Stack Installation**

- **Install Nginx:**

  ```bash
  sudo apt install -y nginx
  ```

- **Install MySQL:**

  ```bash
  sudo apt install -y mysql-server
  sudo mysql_secure_installation
  ```

- **Install PHP and PHP-FPM:**

  ```bash
  sudo apt install -y php-fpm php-mysql
  ```

- **Configure Nginx to Use PHP:**

  ```bash
  sudo tee /etc/nginx/sites-available/default <<EOF
  server {
      listen 80;
      root /var/www/html;
      index index.php index.html index.htm;

      server_name your_domain;

      location / {
          try_files \$uri \$uri/ =404;
      }

      location ~ \.php$ {
          include snippets/fastcgi-php.conf;
          fastcgi_pass unix:/var/run/php/php7.4-fpm.sock;
          fastcgi_param SCRIPT_FILENAME \$document_root\$fastcgi_script_name;
          include fastcgi_params;
      }
  }
  EOF
  ```

- **Restart Nginx and PHP-FPM:**

  ```bash
  sudo systemctl restart nginx
  sudo systemctl restart php7.4-fpm
  ```

**Verify Nginx and PHP Installation:**

- Create a PHP info file to test:

  ```bash
  echo "<?php phpinfo(); ?>" | sudo tee /var/www/html/info.php
  ```

- Access `http://your_server_ip/info.php` in a browser to verify.

---

#### **3. Configure Basic Security Settings**

##### **3.1. Set Up Firewall with `ufw`**

- **Install UFW (Uncomplicated Firewall):**

  ```bash
  sudo apt install -y ufw
  ```

- **Allow SSH and HTTP/HTTPS Traffic:**

  ```bash
  sudo ufw allow OpenSSH
  sudo ufw allow 'Apache Full'   # Use 'Nginx Full' for LEMP
  ```

- **Enable UFW:**

  ```bash
  sudo ufw enable
  ```

- **Check Status:**

  ```bash
  sudo ufw status
  ```

##### **3.2. Configure SSH Key Authentication**

- **Generate SSH Key Pair (on local machine):**

  ```bash
  ssh-keygen -t rsa -b 4096
  ```

- **Copy Public Key to Server:**

  ```bash
  ssh-copy-id username@server_ip
  ```

- **Disable Password Authentication (on server):**

  Edit `/etc/ssh/sshd_config`:

  ```bash
  PasswordAuthentication no
  ```

  Restart SSH service:

  ```bash
  sudo systemctl restart ssh
  ```

---

#### **4. Write Scripts to Automate Routine Maintenance**

##### **4.1. System Updates and Upgrades Script**

**Script:**

```bash
#!/bin/bash

# Update package list
sudo apt update

# Upgrade all installed packages
sudo apt upgrade -y

# Clean up obsolete packages
sudo apt autoremove -y

# Provide feedback
echo "System updates and upgrades completed."
```

- **Save the script as `update_system.sh` and make it executable:**

  ```bash
  chmod +x update_system.sh
  ```

##### **4.2. Disk Space Monitoring and Alerts Script**

**Script:**

```bash
#!/bin/bash

# Define threshold (e.g., 80%)
THRESHOLD=80

# Get the current disk usage percentage
USAGE=$(df / | grep / | awk '{ print $5 }' | sed 's/%//g')

# Check if usage exceeds the threshold
if [ "$USAGE" -gt "$THRESHOLD" ]; then
    # Send an alert (using mail command, configure for your mail server)
    echo "Disk usage is at ${USAGE}% on $(hostname)" | mail -s "Disk Usage Alert" user@example.com
fi
```

- **Save the script as `monitor_disk.sh` and make it executable:**

  ```bash
  chmod +x monitor_disk.sh
  ```

##### **4.3. Log Management and Archiving Script**

**Script:**

```bash
#!/bin/bash

# Define log directory and archive directory
LOG_DIR="/var/log"
ARCHIVE_DIR="/var/log/archive"
DATE=$(date +%F)

# Create archive directory if it doesn't exist
mkdir -p $ARCHIVE_DIR

# Archive old log files
for LOG_FILE in $(ls $LOG_DIR/*.log); do
    tar -czf $ARCHIVE_DIR/$(basename $LOG_FILE)-$DATE.tar.gz $LOG_FILE
    > $LOG_FILE
done

# Provide feedback
echo "Log files archived and rotated."
```

- **Save the script as `manage_logs.sh` and make it executable:**

  ```bash
  chmod +x manage_logs.sh
  ```

##### **4.4. User Account Creation Script**

**Script:**

```bash
#!/bin/bash

# Check if sufficient arguments are provided
if [ "$#" -ne 2 ]; then
    echo "Usage: $0 username password"
    exit 1
fi

USERNAME=$1
PASSWORD=$2

# Create the user with the specified username
sudo useradd -m $USERNAME

# Set the user's password
echo "$USERNAME:$PASSWORD" | sudo chpasswd

# Provide feedback
echo "User $USERNAME created and password set."
```

- **Save the script as `create_user.sh` and make it executable:**

  ```bash
  chmod +x create_user.sh
  ```

---

### **Documentation**

- **Document the Entire Process:**

  - Provide clear instructions on each step, including server preparation, LAMP/LEMP stack installation, security configuration, and script usage.
  - Include explanations of each script and how to schedule them using `cron` if needed.
  - Ensure all steps are detailed with potential issues and solutions.

- **Example Documentation Format:**

  - **Introduction:** Brief overview of the project.
  - **Prerequisites:** List required tools and access.
  - **Setup Instructions:** Detailed steps for LAMP/LEMP setup, security configuration, and script creation.
  - **Scripts:** Description, usage, and how to run each script.
  - **Troubleshooting:** Common issues and solutions.
  - **Conclusion:** Summary of the setup and automation.

---

### Day 15: Introduction to Docker

**Objective:** Learn the basics of Docker and containerization, install Docker, and practice basic Docker commands and container management.

---

#### **1. Learn About Docker and Containerization Concepts**

**Docker Overview:**

- **Docker** is an open-source platform that automates the deployment, scaling, and management of applications using containerization.
- **Containers** encapsulate an application and its dependencies into a single package that can run consistently across various environments.

**Key Concepts:**

- **Container:** A lightweight, standalone, executable package of software that includes everything needed to run an application (code, runtime, system tools, libraries, and settings).
- **Image:** A read-only template used to create containers. It includes the application code, libraries, dependencies, and other files needed to run the application.
- **Docker Engine:** The runtime that manages containers and images on your system.
- **Docker Hub:** A cloud-based registry service for sharing and managing Docker images.

**Benefits of Containerization:**

- **Consistency:** Ensures the application runs the same in development, testing, and production environments.
- **Isolation:** Provides isolated environments for applications, preventing conflicts between them.
- **Portability:** Enables applications to run on any system that has Docker installed.

---

#### **2. Install Docker on Your System**

**For Ubuntu/Debian:**

1. **Update Package Index:**

   ```bash
   sudo apt update
   ```

2. **Install Required Packages:**

   ```bash
   sudo apt install -y apt-transport-https ca-certificates curl software-properties-common
   ```

3. **Add Docker’s Official GPG Key:**

   ```bash
   curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
   ```

4. **Add Docker Repository:**

   ```bash
   sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
   ```

5. **Update Package Index Again:**

   ```bash
   sudo apt update
   ```

6. **Install Docker CE (Community Edition):**

   ```bash
   sudo apt install -y docker-ce
   ```

7. **Verify Docker Installation:**

   ```bash
   sudo systemctl status docker
   ```

**For other distributions or operating systems:**

- Follow the installation instructions from the [official Docker documentation](https://docs.docker.com/get-docker/).

---

#### **3. Pull and Run a Basic Docker Container (e.g., Nginx)**

**Pull the Nginx Image:**

```bash
sudo docker pull nginx
```

**Run the Nginx Container:**

```bash
sudo docker run -d -p 80:80 nginx
```

- **Explanation:**
  - `-d` runs the container in detached mode.
  - `-p 80:80` maps port 80 on the host to port 80 in the container.

**Verify the Container is Running:**

- Open a web browser and navigate to `http://localhost`. You should see the default Nginx welcome page.

---

#### **4. Learn About Docker Images and How to Manage Them**

**List Docker Images:**

```bash
sudo docker images
```

**Remove a Docker Image:**

```bash
sudo docker rmi <image_id>
```

- **Note:** You need to stop any running containers using the image before removing it.

**View Detailed Information About an Image:**

```bash
sudo docker inspect <image_id>
```

**Tag an Image (for versioning or renaming):**

```bash
sudo docker tag <image_id> <repository>:<tag>
```

---

#### **5. Explore and Practice Using Docker Commands**

**Basic Docker Commands:**

- **Run a Container:**

  ```bash
  sudo docker run [OPTIONS] <image>
  ```

- **List Running Containers:**

  ```bash
  sudo docker ps
  ```

- **List All Containers (including stopped ones):**

  ```bash
  sudo docker ps -a
  ```

- **Stop a Running Container:**

  ```bash
  sudo docker stop <container_id>
  ```

- **Remove a Container:**

  ```bash
  sudo docker rm <container_id>
  ```

- **View Container Logs:**

  ```bash
  sudo docker logs <container_id>
  ```

---

### **Practice Exercises**

1. **Install Docker on your local machine and verify the installation.**
2. **Pull and run different Docker images (e.g., `hello-world`, `alpine`).**
3. **Experiment with basic Docker commands to manage containers and images.**
4. **Create and run a Docker container that runs a simple web server (e.g., `nginx`, `httpd`).**

---

### **Documentation**

**Document the Following:**

- **Installation Steps:** Detail the installation process for Docker on your system.
- **Basic Docker Commands:** List and describe the Docker commands used and their purpose.
- **Container Management:** Describe how to pull, run, stop, and remove containers.
- **Image Management:** Explain how to manage Docker images, including listing, tagging, and removing images.

---

### Day 16: Working with Docker Containers

**Objective:** Learn how to create and use Dockerfiles, build and run custom Docker images, manage Docker containers, use Docker volumes for data persistence, and network multiple containers together.

---

#### **1. Learn About and Create Dockerfiles**

**Dockerfile Overview:**

- **Dockerfile** is a text file that contains a set of instructions for building a Docker image. It defines the base image, environment variables, file additions, and commands to run within the container.

**Basic Dockerfile Example:**

```Dockerfile
# Use an official base image
FROM ubuntu:20.04

# Set environment variables
ENV DEBIAN_FRONTEND=noninteractive

# Install packages
RUN apt-get update && apt-get install -y \
    nginx \
    curl

# Add files to the image
COPY index.html /var/www/html/index.html

# Expose ports
EXPOSE 80

# Command to run the application
CMD ["nginx", "-g", "daemon off;"]
```

**Explanation:**

- `FROM` specifies the base image.
- `RUN` executes commands during image build.
- `COPY` copies files from the host to the container.
- `EXPOSE` indicates the port the container will listen on.
- `CMD` sets the default command to run when the container starts.

**Create a Dockerfile:**

1. Create a directory for your Dockerfile and other necessary files:

   ```bash
   mkdir my-docker-app
   cd my-docker-app
   ```

2. Create and edit a `Dockerfile` using a text editor.

   ```bash
   nano Dockerfile
   ```

3. Add the content of your Dockerfile (see example above).

4. Create an `index.html` file if needed.

   ```html
   <html>
     <body>
       <h1>Hello, Docker!</h1>
     </body>
   </html>
   ```

---

#### **2. Build and Run a Custom Docker Image**

**Build the Docker Image:**

```bash
sudo docker build -t my-custom-image .
```

- `-t` tags the image with a name (`my-custom-image`).

**Run the Docker Image:**

```bash
sudo docker run -d -p 8080:80 my-custom-image
```

- `-d` runs the container in detached mode.
- `-p 8080:80` maps port 80 in the container to port 8080 on the host.

**Verify the Container:**

- Open a web browser and navigate to `http://localhost:8080`. You should see the content served by the Nginx container.

---

#### **3. Practice Managing Containers**

**Start a Stopped Container:**

```bash
sudo docker start <container_id>
```

**Stop a Running Container:**

```bash
sudo docker stop <container_id>
```

**Restart a Container:**

```bash
sudo docker restart <container_id>
```

**List Running Containers:**

```bash
sudo docker ps
```

**List All Containers:**

```bash
sudo docker ps -a
```

**Remove a Container:**

```bash
sudo docker rm <container_id>
```

**Example Workflow:**

1. **Run a container:**

   ```bash
   sudo docker run -d --name my-container nginx
   ```

2. **Stop the container:**

   ```bash
   sudo docker stop my-container
   ```

3. **Restart the container:**

   ```bash
   sudo docker restart my-container
   ```

4. **Remove the container:**

   ```bash
   sudo docker rm my-container
   ```

---

#### **4. Use Docker Volumes to Persist Data**

**Create a Docker Volume:**

```bash
sudo docker volume create my-volume
```

**Run a Container with a Volume:**

```bash
sudo docker run -d -v my-volume:/data --name my-data-container ubuntu
```

**Access the Volume Data:**

- Execute a shell in the container:

  ```bash
  sudo docker exec -it my-data-container /bin/bash
  ```

- Navigate to the `/data` directory inside the container and check the files.

**Remove a Docker Volume:**

```bash
sudo docker volume rm my-volume
```

**Example Workflow:**

1. **Create a volume:**

   ```bash
   sudo docker volume create my-volume
   ```

2. **Run a container with the volume:**

   ```bash
   sudo docker run -d -v my-volume:/data --name my-data-container ubuntu
   ```

3. **Inspect the volume:**

   ```bash
   sudo docker volume inspect my-volume
   ```

---

#### **5. Network Multiple Containers Together**

**Create a Docker Network:**

```bash
sudo docker network create my-network
```

**Run Multiple Containers on the Same Network:**

1. **Run the first container:**

   ```bash
   sudo docker run -d --name web --network my-network nginx
   ```

2. **Run the second container (e.g., a simple app):**

   ```bash
   sudo docker run -d --name app --network my-network alpine sleep 3600
   ```

**Verify Network Communication:**

1. **Access a shell in the `app` container:**

   ```bash
   sudo docker exec -it app /bin/sh
   ```

2. **Ping the `web` container from `app`:**

   ```sh
   ping web
   ```

**Remove Docker Network:**

```bash
sudo docker network rm my-network
```

**Example Workflow:**

1. **Create a network:**

   ```bash
   sudo docker network create my-network
   ```

2. **Run containers on the network:**

   ```bash
   sudo docker run -d --name web --network my-network nginx
   sudo docker run -d --name app --network my-network alpine sleep 3600
   ```

3. **Verify network connectivity between containers:**

   ```bash
   sudo docker exec -it app /bin/sh
   ping web
   ```

---

### **Documentation**

**Document the Following:**

- **Dockerfile Creation:**

  - Include the Dockerfile content and explain each instruction.
  - Describe how to build and run the custom Docker image.

- **Container Management:**

  - Provide commands and examples for starting, stopping, restarting, and removing containers.

- **Docker Volumes:**

  - Explain the use of volumes for persisting data, creating, and managing volumes.

- **Networking Containers:**
  - Detail the creation of Docker networks and how to run containers on the same network to enable communication.

---

### Day 17: Docker Compose

**Objective:** Understand Docker Compose, write a `docker-compose.yml` file to define and manage multi-container applications, and practice using Docker Compose commands.

---

#### **1. Learn About Docker Compose and Its Use Cases**

**Docker Compose Overview:**

- **Docker Compose** is a tool for defining and running multi-container Docker applications. It allows you to manage multiple containers as a single service, defining their configurations in a `docker-compose.yml` file.

**Use Cases:**

- **Multi-Container Applications:** Simplify the management of applications that require multiple services (e.g., a web server and a database).
- **Development Environments:** Set up isolated and reproducible development environments.
- **Testing and Deployment:** Easily manage and test complex application stacks.

**Key Concepts:**

- **Service:** A definition of a container and its configuration, including the image, ports, volumes, and environment variables.
- **Network:** Defines how services communicate with each other.
- **Volume:** Used to persist data and share files between containers.

---

#### **2. Write a `docker-compose.yml` File to Define a Multi-Container Application**

**Basic Example:**

Create a `docker-compose.yml` file to define a simple application with a web server and a database.

```yaml
version: "3.8"

services:
  web:
    image: nginx
    ports:
      - "8080:80"
    volumes:
      - ./html:/usr/share/nginx/html
    networks:
      - webnet

  db:
    image: postgres
    environment:
      POSTGRES_USER: user
      POSTGRES_PASSWORD: password
    networks:
      - webnet

networks:
  webnet:
```

**Explanation:**

- `version`: Specifies the Compose file version.
- `services`: Defines the containers for the application.
  - `web`: A service running an Nginx container.
  - `db`: A service running a PostgreSQL container.
- `networks`: Defines a custom network for the services to communicate.

**Steps:**

1. **Create a Directory for Your Compose Project:**

   ```bash
   mkdir my-compose-app
   cd my-compose-app
   ```

2. **Create the `docker-compose.yml` File:**

   ```bash
   nano docker-compose.yml
   ```

3. **Add the Content from the Example Above and Save the File.**

4. **Create an `html` Directory and Add a Basic `index.html` File:**

   ```bash
   mkdir html
   echo "<h1>Hello from Docker Compose!</h1>" > html/index.html
   ```

---

#### **3. Practice Managing Services with Docker Compose**

**Start Services:**

```bash
sudo docker-compose up
```

- By default, this will start services in the foreground. Add `-d` to run in detached mode.

**Stop Services:**

```bash
sudo docker-compose down
```

**Restart Services:**

```bash
sudo docker-compose restart
```

**View Service Status:**

```bash
sudo docker-compose ps
```

**Example Workflow:**

1. **Start the application:**

   ```bash
   sudo docker-compose up -d
   ```

2. **Verify services are running:**

   ```bash
   sudo docker-compose ps
   ```

3. **Access the web service in a browser at `http://localhost:8080`.**

4. **Stop and remove the services:**

   ```bash
   sudo docker-compose down
   ```

---

#### **4. Use Docker Compose to Set Up a Development Environment**

**Example Development Environment:**

Create a `docker-compose.yml` file for a Node.js application with MongoDB.

```yaml
version: "3.8"

services:
  web:
    image: node:14
    working_dir: /app
    volumes:
      - ./app:/app
    ports:
      - "3000:3000"
    command: "npm start"
    depends_on:
      - mongo

  mongo:
    image: mongo
    volumes:
      - mongo-data:/data/db

volumes:
  mongo-data:
```

**Steps:**

1. **Create a Directory for the Node.js Application:**

   ```bash
   mkdir my-node-app
   cd my-node-app
   ```

2. **Create the `docker-compose.yml` File:**

   ```bash
   nano docker-compose.yml
   ```

3. **Create an `app` Directory and Add Your Node.js Application Files:**

   - Example `package.json` and `index.js`.

4. **Run the Development Environment:**

   ```bash
   sudo docker-compose up -d
   ```

5. **Access the Node.js Application at `http://localhost:3000`.**

---

#### **5. Explore Docker Compose Commands**

**Start Services in Detached Mode:**

```bash
sudo docker-compose up -d
```

**Stop and Remove Containers, Networks, and Volumes:**

```bash
sudo docker-compose down
```

**View Logs of Services:**

```bash
sudo docker-compose logs
```

**View Logs of a Specific Service:**

```bash
sudo docker-compose logs <service_name>
```

**Example Workflow:**

1. **Start the services and run in detached mode:**

   ```bash
   sudo docker-compose up -d
   ```

2. **View the logs to check for errors or status updates:**

   ```bash
   sudo docker-compose logs
   ```

3. **Stop and remove the containers:**

   ```bash
   sudo docker-compose down
   ```

---

### **Documentation**

**Document the Following:**

- **Docker Compose Overview:**

  - Explain Docker Compose and its use cases.

- **`docker-compose.yml` File:**

  - Include examples of `docker-compose.yml` files and explain the configuration.

- **Managing Services:**

  - Describe the commands to start, stop, restart, and view services.

- **Development Environment Setup:**

  - Provide an example of using Docker Compose to set up a development environment.

- **Docker Compose Commands:**
  - List and explain the commands for managing and interacting with services.

---

### Day 18: Docker Networking

**Objective:** Understand Docker networking concepts, create and manage Docker networks, connect containers across multiple networks, practice using different types of networks, and explore Docker networking tools.

---

#### **1. Learn About Docker Networking Concepts**

**Docker Networking Overview:**

- **Docker Networking** allows containers to communicate with each other and with external networks.
- **Networking Types:**
  - **Bridge Network:** Default network driver for Docker containers, providing isolation and communication within the same host.
  - **Host Network:** Shares the host’s network stack with the container, bypassing Docker’s network isolation.
  - **Overlay Network:** Used for multi-host networking, allowing containers on different Docker hosts to communicate.
  - **Macvlan Network:** Allows containers to have their own MAC address, useful for integrating with legacy applications or network appliances.
  - **None Network:** Disables all networking for the container.

**Key Concepts:**

- **Network Drivers:** Determine how containers connect to each other and to the outside world.
- **IP Addressing:** Containers can get IP addresses from the network they are connected to.
- **Port Mapping:** Maps container ports to host ports to expose services.

---

#### **2. Create and Manage Docker Networks**

**Create a Bridge Network:**

```bash
sudo docker network create my-bridge-network
```

**List Docker Networks:**

```bash
sudo docker network ls
```

**Inspect a Docker Network:**

```bash
sudo docker network inspect my-bridge-network
```

**Remove a Docker Network:**

```bash
sudo docker network rm my-bridge-network
```

**Example Workflow:**

1. **Create a network:**

   ```bash
   sudo docker network create my-bridge-network
   ```

2. **List networks:**

   ```bash
   sudo docker network ls
   ```

3. **Inspect the created network:**

   ```bash
   sudo docker network inspect my-bridge-network
   ```

4. **Remove the network:**

   ```bash
   sudo docker network rm my-bridge-network
   ```

---

#### **3. Connect Containers Across Multiple Networks**

**Example:**

1. **Create Two Networks:**

   ```bash
   sudo docker network create network1
   sudo docker network create network2
   ```

2. **Run Two Containers and Connect Each to Both Networks:**

   ```bash
   sudo docker run -d --name container1 --network network1 --network network2 nginx
   sudo docker run -d --name container2 --network network1 --network network2 alpine sleep 3600
   ```

3. **Verify Connectivity:**

   - **Access the Shell of `container2`:**

     ```bash
     sudo docker exec -it container2 /bin/sh
     ```

   - **Ping `container1` from `container2`:**

     ```sh
     ping container1
     ```

**Example Workflow:**

1. **Create multiple networks:**

   ```bash
   sudo docker network create network1
   sudo docker network create network2
   ```

2. **Run containers connected to multiple networks:**

   ```bash
   sudo docker run -d --name container1 --network network1 --network network2 nginx
   sudo docker run -d --name container2 --network network1 --network network2 alpine sleep 3600
   ```

3. **Verify connectivity between containers:**

   ```bash
   sudo docker exec -it container2 /bin/sh
   ping container1
   ```

---

#### **4. Practice Using Bridge and Overlay Networks**

**Create a Bridge Network:**

```bash
sudo docker network create --driver bridge my-bridge
```

**Create an Overlay Network:**

- Ensure you have Docker Swarm mode enabled to use overlay networks:

  ```bash
  sudo docker swarm init
  ```

- Create the overlay network:

  ```bash
  sudo docker network create --driver overlay my-overlay
  ```

**Example Workflow:**

1. **Create a bridge network:**

   ```bash
   sudo docker network create --driver bridge my-bridge
   ```

2. **Run a container on the bridge network:**

   ```bash
   sudo docker run -d --name bridge-container --network my-bridge nginx
   ```

3. **Create an overlay network:**

   ```bash
   sudo docker network create --driver overlay my-overlay
   ```

4. **Create a service using the overlay network:**

   ```bash
   sudo docker service create --name overlay-service --network my-overlay nginx
   ```

---

#### **5. Explore Docker Networking Tools**

**List Docker Networks:**

```bash
sudo docker network ls
```

- Displays a list of all Docker networks on the system.

**Inspect a Docker Network:**

```bash
sudo docker network inspect <network_name>
```

- Provides detailed information about a specific network, including connected containers and network configuration.

**Inspect a Container’s Network Configuration:**

```bash
sudo docker inspect <container_name> --format='{{json .NetworkSettings.Networks}}'
```

**Example Workflow:**

1. **List all networks:**

   ```bash
   sudo docker network ls
   ```

2. **Inspect a specific network:**

   ```bash
   sudo docker network inspect my-bridge
   ```

3. **Inspect a container’s network configuration:**

   ```bash
   sudo docker inspect container1 --format='{{json .NetworkSettings.Networks}}'
   ```

---

### **Documentation**

**Document the Following:**

- **Docker Networking Concepts:**

  - Explain the different types of Docker networks and their use cases.

- **Network Management:**

  - Include commands for creating, listing, inspecting, and removing Docker networks.

- **Connecting Containers:**

  - Provide examples of connecting containers across multiple networks.

- **Network Types:**

  - Document bridge and overlay networks with examples.

- **Networking Tools:**
  - List Docker networking commands and their usage.

---

### Day 19: Docker Security

**Objective:** Learn best practices for securing Docker containers, explore Docker security features, implement image security scanning, configure Docker secrets, and use Docker Bench for Security.

---

#### **1. Learn About Best Practices for Securing Docker Containers**

**Best Practices for Docker Security:**

1. **Use Official Images:**

   - Prefer official or trusted images from Docker Hub or verified repositories.

2. **Minimize Container Privileges:**

   - Avoid running containers as the root user. Use non-root users wherever possible.

3. **Limit Container Capabilities:**

   - Restrict container capabilities with the `--cap-drop` and `--cap-add` options.

4. **Keep Images and Containers Up-to-Date:**

   - Regularly update your base images and rebuild your containers to include the latest security patches.

5. **Use Read-Only Filesystems:**

   - Run containers with a read-only filesystem where possible to minimize the impact of potential exploits.

6. **Limit Network Exposure:**

   - Use Docker networks to isolate containers and limit exposure of sensitive services.

7. **Monitor and Log Container Activity:**

   - Implement logging and monitoring solutions to keep track of container activity.

8. **Scan Images for Vulnerabilities:**
   - Use tools to scan your Docker images for known vulnerabilities.

---

#### **2. Explore Docker Security Features**

**User Namespaces:**

- **User namespaces** map container user IDs to different host user IDs to provide an additional layer of isolation.

**Enable User Namespaces:**

1. Edit Docker daemon configuration:

   ```bash
   sudo nano /etc/docker/daemon.json
   ```

2. Add the following configuration:

   ```json
   {
     "userns-remap": "default"
   }
   ```

3. Restart Docker:

   ```bash
   sudo systemctl restart docker
   ```

**SELinux:**

- **SELinux (Security-Enhanced Linux)** provides an additional security layer by enforcing security policies on processes and files.

**Enable SELinux:**

- Ensure SELinux is installed and set to enforcing mode:

  ```bash
  sudo setenforce 1
  ```

- Docker supports SELinux labels. You can add labels to your Docker containers and volumes:

  ```bash
  sudo docker run -it --security-opt label:type:container_runtime_t nginx
  ```

---

#### **3. Implement Security Scanning for Docker Images**

**Using Docker Scan:**

- Docker provides built-in image scanning via `docker scan`, which uses Snyk to identify vulnerabilities.

**Scan an Image:**

```bash
sudo docker scan <image_name>
```

**Using Third-Party Tools:**

- **Trivy:** A comprehensive open-source vulnerability scanner.

**Install Trivy:**

```bash
sudo apt-get install trivy
```

**Scan an Image with Trivy:**

```bash
trivy image <image_name>
```

**Example Workflow:**

1. **Scan an image with Docker Scan:**

   ```bash
   sudo docker scan nginx
   ```

2. **Scan an image with Trivy:**

   ```bash
   trivy image nginx
   ```

---

#### **4. Configure and Use Docker Secrets**

**Docker Secrets Overview:**

- **Docker Secrets** provides a way to securely manage sensitive data, such as passwords and tokens, in Docker Swarm mode.

**Create a Secret:**

1. **Create a secret from a file:**

   ```bash
   echo "my-secret-password" | docker secret create my_secret -
   ```

2. **Create a secret from a string:**

   ```bash
   docker secret create my_secret <<< "my-secret-password"
   ```

**Use Secrets in a Service:**

1. **Deploy a service using secrets:**

   ```bash
   docker service create --name my_service --secret my_secret nginx
   ```

2. **Access the secret in the container:**

   Secrets are mounted in `/run/secrets/` inside the container.

   ```bash
   cat /run/secrets/my_secret
   ```

**Example Workflow:**

1. **Create a secret:**

   ```bash
   echo "supersecret" | docker secret create my_secret -
   ```

2. **Deploy a service with the secret:**

   ```bash
   docker service create --name my_service --secret my_secret nginx
   ```

3. **Inspect the secret inside the container:**

   ```bash
   docker exec -it $(docker ps -q -f name=my_service) cat /run/secrets/my_secret
   ```

---

#### **5. Learn About Docker Bench for Security and Run It on Your Containers**

**Docker Bench for Security Overview:**

- **Docker Bench for Security** is a script that checks for common best practices and security configurations for Docker installations.

**Install Docker Bench for Security:**

1. **Clone the repository:**

   ```bash
   git clone https://github.com/docker/docker-bench-security.git
   cd docker-bench-security
   ```

2. **Run the script:**

   ```bash
   sudo sh docker-bench-security.sh
   ```

**Example Workflow:**

1. **Clone the Docker Bench for Security repository:**

   ```bash
   git clone https://github.com/docker/docker-bench-security.git
   ```

2. **Navigate to the directory:**

   ```bash
   cd docker-bench-security
   ```

3. **Run the security checks:**

   ```bash
   sudo sh docker-bench-security.sh
   ```

4. **Review the report for recommendations and potential issues.**

---

### **Documentation**

**Document the Following:**

- **Docker Security Best Practices:**

  - List and explain best practices for securing Docker containers.

- **Security Features:**

  - Describe Docker security features such as user namespaces and SELinux.

- **Image Security Scanning:**

  - Include instructions for using `docker scan` and Trivy for vulnerability scanning.

- **Docker Secrets:**

  - Provide steps for creating and using Docker secrets.

- **Docker Bench for Security:**
  - Explain how to install and run Docker Bench for Security, and how to interpret the results.

### Day 20: Mini Project - Deploy a Multi-Tier Web Application Using Docker Compose

**Objective:** Deploy a multi-tier web application using Docker Compose, ensuring the application is secure, persistent, and scalable. Document the entire process and include security best practices.

---

#### **Project Overview**

For this mini-project, you will deploy a multi-tier web application using Docker Compose. The application will consist of:

1. **Frontend:** A web interface (e.g., Nginx).
2. **Backend:** An application server (e.g., Node.js).
3. **Database:** A persistent data store (e.g., PostgreSQL).

You will ensure the deployment is secure, the data is persistent, and the application can scale.

---

#### **1. Setup the Project Structure**

**Create a Project Directory:**

```bash
mkdir multi-tier-app
cd multi-tier-app
```

**Create a `docker-compose.yml` File:**

```yaml
version: "3.8"

services:
  frontend:
    image: nginx:latest
    container_name: frontend
    ports:
      - "80:80"
    networks:
      - app-network

  backend:
    image: node:14
    container_name: backend
    volumes:
      - ./backend:/usr/src/app
    working_dir: /usr/src/app
    command: ["npm", "start"]
    networks:
      - app-network
    environment:
      - DATABASE_URL=postgres://user:password@db:5432/mydb

  db:
    image: postgres:13
    container_name: db
    volumes:
      - db-data:/var/lib/postgresql/data
    networks:
      - app-network
    environment:
      - POSTGRES_USER=user
      - POSTGRES_PASSWORD=password
      - POSTGRES_DB=mydb

networks:
  app-network:
    driver: bridge

volumes:
  db-data:
```

**Directory Structure:**

```
multi-tier-app/
├── docker-compose.yml
└── backend/
    └── (Your Node.js application files)
```

---

#### **2. Implement Security Best Practices**

**1. Use Non-Root Users:**

Update your Dockerfiles to use non-root users where possible.

**2. Secrets Management:**

Store sensitive data (e.g., database credentials) securely. Use Docker secrets in Swarm mode or environment variables in Compose files for simplicity.

**3. Network Isolation:**

Ensure your containers are on a private network, and avoid exposing unnecessary ports.

**4. Regularly Update Images:**

Use official and up-to-date images for better security.

**5. Limit Container Capabilities:**

Minimize container privileges with appropriate Docker options.

---

#### **3. Deploy and Test the Application**

**1. Start the Docker Compose Application:**

```bash
docker-compose up -d
```

**2. Verify the Deployment:**

- **Check the Status of Containers:**

  ```bash
  docker-compose ps
  ```

- **Inspect Logs:**

  ```bash
  docker-compose logs
  ```

- **Access the Frontend:**
  - Open a browser and go to `http://localhost` to ensure the frontend is working.

**3. Scaling the Application:**

**Scale Backend Service:**

```bash
docker-compose up -d --scale backend=3
```

**Verify the Scaled Services:**

```bash
docker-compose ps
```

---

#### **4. Implement Persistence and Scalability**

**Data Persistence:**

- **Database Data:** Ensure database data persists by using Docker volumes (`db-data` in the `docker-compose.yml` file).

**Scaling Services:**

- **Scale Frontend and Backend:** Use Docker Compose's scaling features to handle more traffic or processing.

---

#### **5. Document the Process**

**Documentation:**

1. **Project Structure:**

   - Describe the directory structure and purpose of each component in the `docker-compose.yml`.

2. **Security Best Practices:**

   - Document the security measures implemented (e.g., non-root users, secrets management).

3. **Deployment Steps:**

   - Provide clear instructions on how to start, stop, and manage the Docker Compose setup.

4. **Testing and Verification:**

   - Explain how to verify that the application is running correctly and how to test its functionality.

5. **Scaling:**
   - Describe how to scale the services and the expected behavior.

---

### **Example Documentation**

**1. Project Structure:**

- **`docker-compose.yml`:** Defines services for frontend, backend, and database with networks and volumes.
- **`backend/`:** Contains the Node.js application files.

**2. Security Best Practices:**

- **Non-Root Users:** Use non-root users in Dockerfiles.
- **Secrets Management:** Use environment variables for credentials.
- **Network Isolation:** All services are on a private `app-network`.
- **Regular Updates:** Use latest official images.
- **Container Capabilities:** Limit privileges using Docker options.

**3. Deployment Steps:**

1. **Start the Application:**

   ```bash
   docker-compose up -d
   ```

2. **Verify the Deployment:**

   ```bash
   docker-compose ps
   docker-compose logs
   ```

3. **Access Frontend:**
   - Visit `http://localhost` in a browser.

**4. Scaling:**

- **Scale Backend Service:**

  ```bash
  docker-compose up -d --scale backend=3
  ```

- **Verify Scaled Services:**

  ```bash
  docker-compose ps
  ```

---

### Day 21: Introduction to Ansible

**Objective:** Learn about Ansible and its architecture, install Ansible, write a simple playbook, configure inventory files, and execute Ansible commands and playbooks.

---

#### **1. Learn About Ansible and Its Architecture**

**Ansible Overview:**

- **Ansible** is an open-source automation tool used for configuration management, application deployment, and task automation.

**Architecture:**

- **Control Node:** The machine where Ansible is installed and from which commands and playbooks are executed.
- **Managed Nodes:** The target machines that Ansible manages and configures.
- **Modules:** Built-in or custom scripts executed on managed nodes to perform tasks (e.g., installing packages, copying files).
- **Playbooks:** YAML files that define the tasks to be executed on managed nodes.
- **Inventory:** A file that lists the managed nodes and their details.
- **Roles:** A way to organize playbooks into reusable components.

**Components:**

- **Playbook:** Defines the set of tasks to be executed on the managed nodes.
- **Inventory File:** Lists the hosts and groups of hosts.
- **Configuration File:** Defines Ansible settings and parameters.

---

#### **2. Install Ansible on Your System**

**On Ubuntu/Debian:**

1. **Update the package list:**

   ```bash
   sudo apt update
   ```

2. **Install Ansible:**

   ```bash
   sudo apt install ansible
   ```

**On CentOS/RHEL:**

1. **Install EPEL repository:**

   ```bash
   sudo yum install epel-release
   ```

2. **Install Ansible:**

   ```bash
   sudo yum install ansible
   ```

**Verify Installation:**

```bash
ansible --version
```

---

#### **3. Write a Simple Playbook to Install a Package on a Remote Server**

**Create a Directory for Your Playbooks:**

```bash
mkdir ~/ansible-playbooks
cd ~/ansible-playbooks
```

**Create a Playbook File (`install_package.yml`):**

```yaml
---
- name: Install a package on remote servers
  hosts: all
  become: yes
  tasks:
    - name: Install the `htop` package
      apt:
        name: htop
        state: present
```

**Explanation:**

- `name:` Describes the playbook.
- `hosts:` Defines the target hosts.
- `become:` Elevates privileges to run tasks as a superuser.
- `tasks:` Lists the tasks to be executed.
- `apt:` Module used to manage packages (use `yum` for RHEL/CentOS).

---

#### **4. Learn About Inventory Files and Configure Them**

**Default Inventory File Location:**

- `/etc/ansible/hosts`

**Create a Custom Inventory File (`inventory.ini`):**

```ini
[webservers]
webserver1 ansible_host=192.168.1.10
webserver2 ansible_host=192.168.1.11

[dbservers]
dbserver1 ansible_host=192.168.1.20
```

**Explanation:**

- `[webservers]` and `[dbservers]` are groups of hosts.
- `ansible_host` specifies the IP address or hostname of the managed node.

**Specify Inventory File When Running Playbooks:**

```bash
ansible-playbook -i inventory.ini install_package.yml
```

---

#### **5. Execute Ansible Commands and Playbooks**

**Ping All Hosts:**

```bash
ansible all -i inventory.ini -m ping
```

**Run a Playbook:**

```bash
ansible-playbook -i inventory.ini install_package.yml
```

**Explanation:**

- `ansible all` runs commands on all hosts defined in the inventory.
- `-i inventory.ini` specifies the inventory file.
- `-m ping` uses the `ping` module to check connectivity.
- `ansible-playbook` executes the specified playbook.

---

### **Example Workflow**

1. **Install Ansible:**

   ```bash
   sudo apt update
   sudo apt install ansible
   ```

2. **Create a Playbook:**

   ```yaml
   ---
   - name: Install a package on remote servers
     hosts: all
     become: yes
     tasks:
       - name: Install the `htop` package
         apt:
           name: htop
           state: present
   ```

3. **Configure Inventory File:**

   ```ini
   [webservers]
   webserver1 ansible_host=192.168.1.10
   webserver2 ansible_host=192.168.1.11

   [dbservers]
   dbserver1 ansible_host=192.168.1.20
   ```

4. **Run Commands and Playbooks:**

   - **Ping Hosts:**

     ```bash
     ansible all -i inventory.ini -m ping
     ```

   - **Execute Playbook:**

     ```bash
     ansible-playbook -i inventory.ini install_package.yml
     ```

---

### **Documentation**

**Document the Following:**

- **Ansible Architecture:**
  - Overview of Ansible components and architecture.
- **Installation Instructions:**
  - Steps for installing Ansible on different systems.
- **Simple Playbook:**
  - Example playbook for installing a package.
- **Inventory File:**
  - Explanation and example of an inventory file.
- **Execution Commands:**
  - Commands for running Ansible playbooks and tasks.

---

### Day 22: Advanced Ansible Usage

**Objective:** Explore advanced Ansible features, including roles, variables, templates, Ansible Vault, and Ansible Galaxy. Write a playbook to set up a web server and utilize roles and templates for enhanced automation.

---

#### **1. Learn About Roles in Ansible and Create a Role**

**Roles Overview:**

- **Roles** are a way to organize playbooks into reusable components. They allow you to group related tasks, handlers, variables, and templates.

**Create a Role:**

1. **Generate Role Structure:**

   ```bash
   ansible-galaxy init my_role
   ```

   This command creates a directory structure for the role:

   ```
   my_role/
   ├── defaults/
   │   └── main.yml
   ├── files/
   ├── handlers/
   │   └── main.yml
   ├── meta/
   │   └── main.yml
   ├── tasks/
   │   └── main.yml
   ├── templates/
   └── vars/
       └── main.yml
   ```

2. **Edit Role Files:**

   **`tasks/main.yml`:** Define the tasks for the role.

   ```yaml
   ---
   - name: Install nginx
     apt:
       name: nginx
       state: present

   - name: Start nginx
     service:
       name: nginx
       state: started
       enabled: yes
   ```

   **`defaults/main.yml`:** Define default variables for the role.

   ```yaml
   ---
   nginx_port: 80
   ```

3. **Use the Role in a Playbook:**

   **`site.yml`:**

   ```yaml
   ---
   - name: Configure web server
     hosts: webservers
     become: yes
     roles:
       - my_role
   ```

---

#### **2. Use Variables and Templates in Your Playbooks**

**Variables:**

- Variables allow you to manage dynamic content in playbooks and roles.

**Define Variables:**

**`vars/main.yml`:**

```yaml
---
nginx_port: 80
```

**Use Variables in a Playbook:**

**`tasks/main.yml`:**

```yaml
---
- name: Install nginx
  apt:
    name: nginx
    state: present

- name: Configure nginx
  template:
    src: nginx.conf.j2
    dest: /etc/nginx/nginx.conf
```

**Templates:**

- Templates allow you to dynamically generate configuration files.

**Create a Template (`nginx.conf.j2`):**

```nginx
server {
    listen {{ nginx_port }};
    server_name localhost;

    location / {
        proxy_pass http://localhost:8080;
    }
}
```

**Use the Template in a Playbook:**

```yaml
- name: Configure nginx
  template:
    src: nginx.conf.j2
    dest: /etc/nginx/nginx.conf
```

---

#### **3. Implement Ansible Vault to Manage Sensitive Data**

**Ansible Vault Overview:**

- **Ansible Vault** allows you to encrypt sensitive data such as passwords and secret keys within Ansible projects.

**Create an Encrypted File:**

```bash
ansible-vault create secrets.yml
```

**Edit the File to Add Secrets:**

```yaml
db_password: secret_password
```

**Encrypt an Existing File:**

```bash
ansible-vault encrypt vars.yml
```

**Use Encrypted Variables in Playbooks:**

**`site.yml`:**

```yaml
---
- name: Configure web server
  hosts: webservers
  become: yes
  vars_files:
    - secrets.yml
  roles:
    - my_role
```

**Run Playbook with Vault Password:**

```bash
ansible-playbook site.yml --ask-vault-pass
```

---

#### **4. Write a Playbook to Set Up a Web Server**

**Create a Playbook (`setup_web_server.yml`):**

```yaml
---
- name: Set up web server
  hosts: webservers
  become: yes
  vars_files:
    - secrets.yml
  roles:
    - my_role
  tasks:
    - name: Ensure nginx is installed
      apt:
        name: nginx
        state: present

    - name: Configure nginx
      template:
        src: nginx.conf.j2
        dest: /etc/nginx/nginx.conf

    - name: Start nginx
      service:
        name: nginx
        state: started
        enabled: yes
```

**Explanation:**

- This playbook installs and configures Nginx on web servers using a role and template.

---

#### **5. Learn About and Use Ansible Galaxy to Share Roles**

**Ansible Galaxy Overview:**

- **Ansible Galaxy** is a repository for sharing and discovering Ansible roles.

**Search for Roles:**

```bash
ansible-galaxy search nginx
```

**Install a Role from Galaxy:**

```bash
ansible-galaxy install geerlingguy.nginx
```

**Include the Role in Your Playbook:**

**`site.yml`:**

```yaml
---
- name: Configure web server
  hosts: webservers
  become: yes
  roles:
    - geerlingguy.nginx
```

**Update Galaxy Roles:**

```bash
ansible-galaxy install -r requirements.yml
```

**`requirements.yml`:**

```yaml
- src: geerlingguy.nginx
```

---

### **Example Workflow**

1. **Create a Role:**

   ```bash
   ansible-galaxy init my_role
   ```

2. **Edit Role Files:**

   - **`tasks/main.yml`:**

     ```yaml
     - name: Install nginx
       apt:
         name: nginx
         state: present
     ```

   - **`defaults/main.yml`:**

     ```yaml
     nginx_port: 80
     ```

   - **`templates/nginx.conf.j2`:**

     ```nginx
     server {
         listen {{ nginx_port }};
         server_name localhost;

         location / {
             proxy_pass http://localhost:8080;
         }
     }
     ```

3. **Use Variables and Templates:**

   ```yaml
   - name: Configure nginx
     template:
       src: nginx.conf.j2
       dest: /etc/nginx/nginx.conf
   ```

4. **Implement Ansible Vault:**

   ```bash
   ansible-vault create secrets.yml
   ```

5. **Write and Execute Playbook:**

   ```yaml
   - name: Set up web server
     hosts: webservers
     become: yes
     roles:
       - my_role
   ```

   ```bash
   ansible-playbook setup_web_server.yml --ask-vault-pass
   ```

6. **Use Ansible Galaxy:**

   ```bash
   ansible-galaxy install geerlingguy.nginx
   ```

   **`site.yml`:**

   ```yaml
   - name: Configure web server
     hosts: webservers
     become: yes
     roles:
       - geerlingguy.nginx
   ```

---

### **Documentation**

**Document the Following:**

- **Roles:**

  - Overview of roles and their structure.
  - Example role with tasks and variables.

- **Variables and Templates:**

  - How to define and use variables.
  - Example template file and its usage.

- **Ansible Vault:**

  - How to create and use encrypted files.
  - Example usage of Vault in playbooks.

- **Web Server Playbook:**

  - Example playbook for setting up a web server.
  - Role and task definitions.

- **Ansible Galaxy:**
  - How to search, install, and use roles from Ansible Galaxy.

---

### Day 23: Jenkins Basics

**Objective:** Understand Jenkins and CI/CD concepts, set up Jenkins, create a basic pipeline job, explore Jenkins plugins, and integrate Jenkins with a version control system.

---

#### **1. Learn About Jenkins and CI/CD Concepts**

**Jenkins Overview:**

- **Jenkins** is an open-source automation server used to automate various stages of the software development lifecycle, including build, test, and deployment.

**CI/CD Concepts:**

- **Continuous Integration (CI):** The practice of automatically building and testing code changes in a shared repository.
- **Continuous Deployment (CD):** The practice of automatically deploying code changes to production environments.

**Key Jenkins Features:**

- **Pipeline as Code:** Define your build and deployment processes as code using Jenkinsfile.
- **Plugins:** Extend Jenkins functionality with various plugins.

**Resources to Learn CI/CD:**

- [Jenkins Official Documentation](https://www.jenkins.io/doc/)
- [CI/CD Overview](https://www.redhat.com/en/topics/devops/what-is-ci-cd)

---

#### **2. Install Jenkins and Set It Up on Your System**

**Install Jenkins:**

**On Ubuntu:**

1. **Update Package List and Install Dependencies:**

   ```bash
   sudo apt update
   sudo apt install openjdk-11-jdk
   ```

2. **Add Jenkins Repository and Key:**

   ```bash
   wget -q -O - https://pkg.jenkins.io/debian/jenkins.io.key | sudo apt-key add -
   sudo sh -c 'echo deb http://pkg.jenkins.io/debian-stable binary > /etc/apt/sources.list.d/jenkins.list'
   ```

3. **Install Jenkins:**

   ```bash
   sudo apt update
   sudo apt install jenkins
   ```

4. **Start and Enable Jenkins Service:**

   ```bash
   sudo systemctl start jenkins
   sudo systemctl enable jenkins
   ```

5. **Access Jenkins Web Interface:**

   - Open your browser and go to `http://localhost:8080`.

6. **Unlock Jenkins:**

   - Get the initial admin password from `/var/lib/jenkins/secrets/initialAdminPassword`:

     ```bash
     sudo cat /var/lib/jenkins/secrets/initialAdminPassword
     ```

   - Enter this password in the web interface to unlock Jenkins.

**Initial Setup Wizard:**

- Follow the on-screen instructions to install suggested plugins and create the first admin user.

---

#### **3. Create a Simple Pipeline Job in Jenkins**

**Create a Pipeline Job:**

1. **Log in to Jenkins Dashboard.**

2. **Create a New Job:**

   - Click on "New Item".
   - Enter a name for your job.
   - Select "Pipeline" and click "OK".

3. **Configure the Pipeline Job:**

   - **Pipeline Script:**

     ```groovy
     pipeline {
         agent any
         stages {
             stage('Build') {
                 steps {
                     echo 'Building...'
                 }
             }
             stage('Test') {
                 steps {
                     echo 'Testing...'
                 }
             }
             stage('Deploy') {
                 steps {
                     echo 'Deploying...'
                 }
             }
         }
     }
     ```

   - **Save and Build:**
     - Click "Save" and then "Build Now" to run the pipeline.

---

#### **4. Learn About Jenkins Plugins and Install Essential Ones**

**Jenkins Plugins:**

- **Plugins** extend Jenkins functionality, such as integrating with version control systems, build tools, and notification systems.

**Install Plugins:**

1. **Go to "Manage Jenkins" > "Manage Plugins".**

2. **Explore Available Plugins:**

   - **Popular Plugins:** Git, GitHub Integration, Pipeline, Blue Ocean, etc.

3. **Install Plugins:**
   - Select the plugins you want and click "Install without restart" or "Download now and install after restart".

**Essential Plugins:**

- **Git Plugin:** Integrates Jenkins with Git repositories.
- **Pipeline Plugin:** Enables Jenkins Pipeline features.
- **Blue Ocean Plugin:** Provides a modern UI for Jenkins Pipelines.

---

#### **5. Integrate Jenkins with Version Control (e.g., Git)**

**Integrate Git with Jenkins:**

1. **Configure Git Plugin:**

   - Ensure the Git plugin is installed.

2. **Create a Pipeline Job with Git Integration:**

   - **Pipeline Script Example:**

     ```groovy
     pipeline {
         agent any
         stages {
             stage('Checkout') {
                 steps {
                     git url: 'https://github.com/your-repository.git', branch: 'main'
                 }
             }
             stage('Build') {
                 steps {
                     echo 'Building...'
                 }
             }
             stage('Test') {
                 steps {
                     echo 'Testing...'
                 }
             }
             stage('Deploy') {
                 steps {
                     echo 'Deploying...'
                 }
             }
         }
     }
     ```

3. **Add Git Repository URL in Job Configuration:**

   - Go to the Pipeline job configuration.
   - Under "Pipeline", specify your Git repository URL and branch.

4. **Trigger Builds:**
   - **Manual Trigger:** Click "Build Now".
   - **Automated Trigger:** Configure webhooks in your Git repository to trigger builds on code changes.

---

### **Documentation**

**Document the Following:**

- **Jenkins Overview:**
  - Description of Jenkins and CI/CD concepts.
- **Installation and Setup:**

  - Installation steps for Jenkins on your system.
  - Access and initial setup instructions.

- **Pipeline Job Creation:**

  - Steps to create and configure a simple pipeline job.
  - Example Jenkinsfile.

- **Plugins:**

  - Overview of essential plugins.
  - Instructions for installing and configuring plugins.

- **Version Control Integration:**
  - How to integrate Jenkins with Git.
  - Example pipeline script for Git integration.

---

### Day 24: Advanced Jenkins

**Objective:** Explore advanced Jenkins features including pipeline syntax, automated testing, notifications, deployment, and distributed builds.

---

#### **1. Explore Jenkins Pipeline Syntax and Write a Jenkinsfile**

**Jenkins Pipeline Syntax:**

- **Declarative Pipeline:**

  - A more structured and readable way to define your pipeline.
  - Example Jenkinsfile:

    ```groovy
    pipeline {
        agent any
        environment {
            MY_ENV_VAR = 'value'
        }
        stages {
            stage('Checkout') {
                steps {
                    git url: 'https://github.com/your-repository.git', branch: 'main'
                }
            }
            stage('Build') {
                steps {
                    echo 'Building...'
                    sh './build-script.sh'
                }
            }
            stage('Test') {
                steps {
                    echo 'Testing...'
                    sh './test-script.sh'
                }
            }
            stage('Deploy') {
                steps {
                    echo 'Deploying...'
                    sh './deploy-script.sh'
                }
            }
        }
        post {
            always {
                echo 'Cleaning up...'
                cleanWs()
            }
        }
    }
    ```

- **Scripted Pipeline:**

  - Provides more flexibility but requires more complex Groovy scripting.
  - Example Jenkinsfile:

    ```groovy
    node {
        stage('Checkout') {
            checkout scm
        }
        stage('Build') {
            sh './build-script.sh'
        }
        stage('Test') {
            sh './test-script.sh'
        }
        stage('Deploy') {
            sh './deploy-script.sh'
        }
        cleanWs()
    }
    ```

**Resources:**

- [Pipeline Syntax](https://www.jenkins.io/doc/book/pipeline/syntax/)
- [Jenkins Pipeline Examples](https://www.jenkins.io/doc/book/pipeline/examples/)

---

#### **2. Set Up Automated Testing in a Jenkins Pipeline**

**Automated Testing Setup:**

- **Add Testing Stage:**

  ```groovy
  stage('Test') {
      steps {
          echo 'Running tests...'
          sh './run-tests.sh'
      }
  }
  ```

- **JUnit Integration:**

  ```groovy
  stage('Test') {
      steps {
          echo 'Running tests...'
          sh './run-tests.sh'
          junit '**/test-results/*.xml'
      }
  }
  ```

- **Test Reports:**
  - Ensure that your test results are in a format supported by Jenkins (e.g., JUnit XML).
  - Configure the `junit` step to publish test results.

**Resources:**

- [JUnit Plugin](https://plugins.jenkins.io/junit/)
- [Test Reports in Jenkins](https://www.jenkins.io/doc/book/pipeline/jenkinsfile/#test-results)

---

#### **3. Implement Notifications and Alerts in Jenkins**

**Notification Methods:**

- **Email Notifications:**

  - **Install Email Extension Plugin:**
    - Go to "Manage Jenkins" > "Manage Plugins" > "Available" > Search for "Email Extension Plugin".
  - **Configure SMTP Server:**
    - Go to "Manage Jenkins" > "Configure System" > "Extended E-mail Notification".
  - **Add Email Notifications to Jenkinsfile:**

    ```groovy
    post {
        success {
            mail to: 'user@example.com',
                 subject: "Successful Build: ${env.JOB_NAME} ${env.BUILD_NUMBER}",
                 body: "Good news! Build ${env.BUILD_NUMBER} was successful."
        }
        failure {
            mail to: 'user@example.com',
                 subject: "Failed Build: ${env.JOB_NAME} ${env.BUILD_NUMBER}",
                 body: "Sorry, build ${env.BUILD_NUMBER} failed. Please check Jenkins for details."
        }
    }
    ```

- **Slack Notifications:**

  - **Install Slack Notification Plugin:**
    - Go to "Manage Jenkins" > "Manage Plugins" > "Available" > Search for "Slack Notification Plugin".
  - **Configure Slack Integration:**
    - Go to "Manage Jenkins" > "Configure System" > "Slack Notifications".
  - **Add Slack Notifications to Jenkinsfile:**

    ```groovy
    post {
        success {
            slackSend(channel: '#builds', message: "Build ${env.BUILD_NUMBER} succeeded!")
        }
        failure {
            slackSend(channel: '#builds', message: "Build ${env.BUILD_NUMBER} failed.")
        }
    }
    ```

**Resources:**

- [Email Extension Plugin](https://plugins.jenkins.io/email-ext/)
- [Slack Notification Plugin](https://plugins.jenkins.io/slack/)

---

#### **4. Use Jenkins to Deploy an Application to a Server**

**Deployment Example:**

- **Deploying with SSH:**

  - **Install SSH Pipeline Steps Plugin:**
    - Go to "Manage Jenkins" > "Manage Plugins" > "Available" > Search for "SSH Pipeline Steps Plugin".
  - **Jenkinsfile Example:**

    ```groovy
    stage('Deploy') {
        steps {
            sshPublisher(publishers: [sshPublisherDesc(configName: 'my-server',
                transfers: [sshTransfer(sourceFiles: '**/target/*.jar', removePrefix: false, remoteDirectory: '/path/to/remote/dir')])])
        }
    }
    ```

- **Deploying with Docker:**

  ```groovy
  stage('Deploy') {
      steps {
          script {
              docker.build("my-app", ".")
              docker.withRegistry('https://registry.example.com', 'docker-credentials-id') {
                  docker.image("my-app").push("latest")
              }
          }
      }
  }
  ```

**Resources:**

- [SSH Pipeline Steps Plugin](https://plugins.jenkins.io/publish-over-ssh/)
- [Docker Pipeline Plugin](https://plugins.jenkins.io/docker-workflow/)

---

#### **5. Learn About Jenkins Agents and Distributed Builds**

**Jenkins Agents:**

- **Overview:**

  - Jenkins agents (or nodes) run build jobs on remote machines. This helps distribute the load and allows for parallel execution.

- **Set Up a Jenkins Agent:**

  - **Configure the Master:**

    - Go to "Manage Jenkins" > "Manage Nodes and Clouds" > "New Node".
    - Create a new node with the necessary details (e.g., SSH connection details).

  - **Agent Configuration:**
    - **On the Agent Machine:** Install the Jenkins agent (or use the Java Web Start method).
    - **Connect the Agent:** Ensure the agent connects to the Jenkins master and is online.

- **Example Use in Jenkinsfile:**

  ```groovy
  pipeline {
      agent {
          node {
              label 'my-agent-label'
          }
      }
      stages {
          stage('Build') {
              steps {
                  echo 'Building on agent...'
              }
          }
      }
  }
  ```

**Resources:**

- [Managing Jenkins Agents](https://www.jenkins.io/doc/book/managing/nodes/)
- [Distributed Builds](https://www.jenkins.io/doc/book/using/agent/)

---

### **Documentation**

**Document the Following:**

- **Jenkins Pipeline Syntax:**

  - Example Jenkinsfiles (Declarative and Scripted).
  - Explanation of syntax and usage.

- **Automated Testing:**

  - How to integrate testing stages.
  - Example configurations and test reporting.

- **Notifications and Alerts:**

  - Setting up email and Slack notifications.
  - Example notification configurations in Jenkinsfile.

- **Application Deployment:**

  - Deployment methods and Jenkinsfile examples.
  - Instructions for setting up SSH or Docker deployments.

- **Jenkins Agents:**
  - Setting up and configuring Jenkins agents.
  - Example usage in Jenkinsfile.

---

### Day 25: Introduction to Kubernetes

**Objective:** Get familiar with Kubernetes architecture, set up a local cluster using Minikube, deploy a simple application, and learn to use kubectl commands and Kubernetes services.

---

#### **1. Learn About Kubernetes Architecture and Key Concepts**

**Key Concepts:**

- **Cluster:**

  - A Kubernetes cluster consists of a set of nodes that run containerized applications.

- **Nodes:**

  - **Master Node (Control Plane):** Manages the Kubernetes cluster, including scheduling, scaling, and managing the overall cluster state.
  - **Worker Nodes:** Run the containerized applications. They include components like the Kubelet, Kube-Proxy, and container runtime.

- **Pods:**

  - The smallest deployable units in Kubernetes, encapsulating one or more containers.

- **Services:**

  - Define a logical set of Pods and a policy by which to access them. Services enable communication between Pods and external applications.

- **Deployments:**

  - Manage the deployment and scaling of Pods. They provide updates and rollbacks for applications.

- **Namespaces:**
  - Provide a way to divide cluster resources between multiple users or teams.

**Resources:**

- [Kubernetes Architecture Overview](https://kubernetes.io/docs/concepts/overview/components/)
- [Kubernetes Concepts](https://kubernetes.io/docs/concepts/)

---

#### **2. Set Up a Local Kubernetes Cluster Using Minikube**

**Steps to Set Up Minikube:**

1. **Install Minikube:**

   - **Linux/Mac:**
     ```sh
     curl -LO https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64
     sudo install minikube-linux-amd64 /usr/local/bin/minikube
     ```
   - **Windows:**
     - Download the Minikube executable from the [Minikube releases page](https://github.com/kubernetes/minikube/releases) and add it to your PATH.

2. **Start Minikube:**

   ```sh
   minikube start
   ```

3. **Verify the Minikube Cluster:**
   ```sh
   kubectl cluster-info
   ```

**Resources:**

- [Minikube Documentation](https://minikube.sigs.k8s.io/docs/)
- [Kubernetes CLI Reference](https://kubernetes.io/docs/reference/kubectl/overview/)

---

#### **3. Deploy a Simple Application on Kubernetes**

**Example Deployment:**

1. **Create a Deployment YAML File:**

   `nginx-deployment.yaml`

   ```yaml
   apiVersion: apps/v1
   kind: Deployment
   metadata:
     name: nginx-deployment
   spec:
     replicas: 2
     selector:
       matchLabels:
         app: nginx
     template:
       metadata:
         labels:
           app: nginx
       spec:
         containers:
           - name: nginx
             image: nginx:latest
             ports:
               - containerPort: 80
   ```

2. **Apply the Deployment:**

   ```sh
   kubectl apply -f nginx-deployment.yaml
   ```

3. **Verify the Deployment:**
   ```sh
   kubectl get deployments
   kubectl get pods
   ```

**Resources:**

- [Kubernetes Deployments](https://kubernetes.io/docs/concepts/workloads/controllers/deployment/)
- [Sample Deployment YAML](https://kubernetes.io/docs/concepts/workloads/controllers/deployment/#creating-a-deployment)

---

#### **4. Learn About and Use kubectl Commands**

**Basic kubectl Commands:**

- **Get Cluster Information:**

  ```sh
  kubectl cluster-info
  ```

- **List All Pods:**

  ```sh
  kubectl get pods
  ```

- **Describe a Pod:**

  ```sh
  kubectl describe pod <pod-name>
  ```

- **View Logs for a Pod:**

  ```sh
  kubectl logs <pod-name>
  ```

- **Delete a Pod:**

  ```sh
  kubectl delete pod <pod-name>
  ```

- **Scale a Deployment:**
  ```sh
  kubectl scale deployment <deployment-name> --replicas=<number>
  ```

**Resources:**

- [kubectl Cheat Sheet](https://kubernetes.io/docs/reference/kubectl/cheatsheet/)
- [kubectl Commands Overview](https://kubernetes.io/docs/reference/generated/kubectl/kubectl-commands)

---

#### **5. Explore Kubernetes Services and Expose Your Application**

**Creating a Service to Expose the Application:**

1. **Create a Service YAML File:**

   `nginx-service.yaml`

   ```yaml
   apiVersion: v1
   kind: Service
   metadata:
     name: nginx-service
   spec:
     selector:
       app: nginx
     ports:
       - protocol: TCP
         port: 80
         targetPort: 80
     type: LoadBalancer
   ```

2. **Apply the Service:**

   ```sh
   kubectl apply -f nginx-service.yaml
   ```

3. **Verify the Service:**

   ```sh
   kubectl get services
   ```

4. **Access the Service:**
   - **Using Minikube:**
     ```sh
     minikube service nginx-service
     ```

**Resources:**

- [Kubernetes Services](https://kubernetes.io/docs/concepts/services-networking/service/)
- [Service Types](https://kubernetes.io/docs/concepts/services-networking/service/#publishing-services-service-types)

---

### **Documentation**

**Document the Following:**

- **Kubernetes Architecture:**

  - Overview of cluster components and key concepts.

- **Minikube Setup:**

  - Steps for installation and starting Minikube.

- **Deployment:**

  - Example YAML for deploying a simple application and commands to manage it.

- **kubectl Commands:**

  - Commonly used commands and their purposes.

- **Services:**
  - How to expose applications using Kubernetes Services and accessing them via Minikube.

---

### Day 26: Advanced Kubernetes

**Objective:** Explore advanced Kubernetes features such as Deployments, StatefulSets, persistent storage, ConfigMaps and Secrets, Ingress resources, and scaling applications.

---

#### **1. Learn About and Create Kubernetes Deployments and StatefulSets**

**Deployments:**

- **Purpose:** Manage stateless applications. Ensure that the desired number of pod replicas are running and handle updates and rollbacks.

**Example Deployment YAML:**

```yaml
apiVersion: apps/v1
kind: Deployment
metadata:
  name: my-deployment
spec:
  replicas: 3
  selector:
    matchLabels:
      app: my-app
  template:
    metadata:
      labels:
        app: my-app
    spec:
      containers:
        - name: my-container
          image: nginx:latest
          ports:
            - containerPort: 80
```

**StatefulSets:**

- **Purpose:** Manage stateful applications with stable, unique network identifiers and persistent storage.

**Example StatefulSet YAML:**

```yaml
apiVersion: apps/v1
kind: StatefulSet
metadata:
  name: my-statefulset
spec:
  serviceName: "my-service"
  replicas: 3
  selector:
    matchLabels:
      app: my-app
  template:
    metadata:
      labels:
        app: my-app
    spec:
      containers:
        - name: my-container
          image: nginx:latest
          ports:
            - containerPort: 80
  volumeClaimTemplates:
    - metadata:
        name: my-persistent-storage
      spec:
        accessModes: ["ReadWriteOnce"]
        resources:
          requests:
            storage: 1Gi
```

**Resources:**

- [Kubernetes Deployments](https://kubernetes.io/docs/concepts/workloads/controllers/deployment/)
- [Kubernetes StatefulSets](https://kubernetes.io/docs/concepts/workloads/controllers/statefulset/)

---

#### **2. Implement Persistent Storage Using Persistent Volumes (PVs) and Persistent Volume Claims (PVCs)**

**Persistent Volumes (PVs):**

- **Purpose:** Provide a way to manage storage resources in the cluster.

**Example PV YAML:**

```yaml
apiVersion: v1
kind: PersistentVolume
metadata:
  name: my-pv
spec:
  capacity:
    storage: 5Gi
  accessModes:
    - ReadWriteOnce
  hostPath:
    path: /mnt/data
```

**Persistent Volume Claims (PVCs):**

- **Purpose:** Request storage resources from the cluster.

**Example PVC YAML:**

```yaml
apiVersion: v1
kind: PersistentVolumeClaim
metadata:
  name: my-pvc
spec:
  accessModes:
    - ReadWriteOnce
  resources:
    requests:
      storage: 1Gi
```

**Resources:**

- [Kubernetes Persistent Volumes](https://kubernetes.io/docs/concepts/storage/persistent-volumes/)
- [Kubernetes Persistent Volume Claims](https://kubernetes.io/docs/concepts/storage/persistent-volumes/#persistentvolumeclaims)

---

#### **3. Set Up and Manage ConfigMaps and Secrets**

**ConfigMaps:**

- **Purpose:** Store configuration data in key-value pairs.

**Example ConfigMap YAML:**

```yaml
apiVersion: v1
kind: ConfigMap
metadata:
  name: my-config
data:
  config.properties: |
    key1=value1
    key2=value2
```

**Secrets:**

- **Purpose:** Store sensitive data like passwords or tokens.

**Example Secret YAML:**

```yaml
apiVersion: v1
kind: Secret
metadata:
  name: my-secret
type: Opaque
data:
  username: dXNlcg== # base64 encoded "user"
  password: cGFzc3dvcmQ= # base64 encoded "password"
```

**Resources:**

- [Kubernetes ConfigMaps](https://kubernetes.io/docs/concepts/configuration/configmap/)
- [Kubernetes Secrets](https://kubernetes.io/docs/concepts/configuration/secret/)

---

#### **4. Explore Kubernetes Ingress and Create an Ingress Resource**

**Ingress:**

- **Purpose:** Manage external access to services in the cluster, typically HTTP.

**Example Ingress YAML:**

```yaml
apiVersion: networking.k8s.io/v1
kind: Ingress
metadata:
  name: my-ingress
spec:
  rules:
    - host: my-app.local
      http:
        paths:
          - path: /
            pathType: Prefix
            backend:
              service:
                name: my-service
                port:
                  number: 80
```

**Resources:**

- [Kubernetes Ingress](https://kubernetes.io/docs/concepts/services-networking/ingress/)
- [Ingress Controllers](https://kubernetes.io/docs/concepts/services-networking/ingress-controllers/)

---

#### **5. Practice Scaling Applications Using Kubernetes**

**Scaling Deployments:**

- **Purpose:** Adjust the number of replicas for your application.

**Commands:**

- **Scale Up:**

  ```sh
  kubectl scale deployment my-deployment --replicas=5
  ```

- **Scale Down:**
  ```sh
  kubectl scale deployment my-deployment --replicas=2
  ```

**Resources:**

- [Scaling Applications](https://kubernetes.io/docs/concepts/workloads/controllers/deployment/#scaling-a-deployment)

---

### **Documentation**

**Document the Following:**

- **Deployments and StatefulSets:**

  - Definitions, YAML examples, and use cases.

- **Persistent Storage:**

  - PVs and PVCs definitions, YAML examples, and their role in Kubernetes.

- **ConfigMaps and Secrets:**

  - Definitions, YAML examples, and how to use them in applications.

- **Ingress:**

  - Definition, YAML example, and use cases for managing external access.

- **Scaling Applications:**
  - Methods for scaling applications and the impact on resource management.

---

### Day 27: Kubernetes Security

**Objective:** Understand and implement Kubernetes security best practices, including Role-Based Access Control (RBAC), Network Policies, container image security, and Pod Security Policies.

---

#### **1. Learn About Kubernetes Security Best Practices**

**Key Areas of Focus:**

- **Role-Based Access Control (RBAC):** Control access to Kubernetes resources based on user roles.
- **Network Policies:** Define rules for pod-to-pod communication.
- **Container Image Security:** Ensure images are free of vulnerabilities.
- **Pod Security Policies:** Enforce security standards for pods.

**Resources:**

- [Kubernetes Security Best Practices](https://kubernetes.io/docs/concepts/security/overview/)
- [Kubernetes RBAC](https://kubernetes.io/docs/reference/access-authn-authz/rbac/)
- [Network Policies](https://kubernetes.io/docs/concepts/services-networking/network-policies/)
- [Pod Security Policies](https://kubernetes.io/docs/concepts/security/pod-security-policy/)

---

#### **2. Implement Role-Based Access Control (RBAC) in Your Cluster**

**RBAC Components:**

- **Roles:** Define a set of permissions.
- **RoleBindings:** Bind roles to users or groups.
- **ClusterRoles and ClusterRoleBindings:** Define permissions across the entire cluster.

**Example Role YAML:**

```yaml
apiVersion: rbac.authorization.k8s.io/v1
kind: Role
metadata:
  name: my-role
  namespace: default
rules:
  - apiGroups: [""]
    resources: ["pods"]
    verbs: ["get", "list", "watch"]
```

**Example RoleBinding YAML:**

```yaml
apiVersion: rbac.authorization.k8s.io/v1
kind: RoleBinding
metadata:
  name: my-rolebinding
  namespace: default
subjects:
  - kind: User
    name: my-user
    apiGroup: rbac.authorization.k8s.io
roleRef:
  kind: Role
  name: my-role
  apiGroup: rbac.authorization.k8s.io
```

**Resources:**

- [RBAC Overview](https://kubernetes.io/docs/reference/access-authn-authz/rbac/)
- [Creating and Managing RBAC Roles](https://kubernetes.io/docs/reference/access-authn-authz/rbac/#role-based-access-control)

---

#### **3. Use Network Policies to Secure Pod Communication**

**Network Policies:**

- **Purpose:** Control the communication between pods and between pods and services.

**Example Network Policy YAML:**

```yaml
apiVersion: networking.k8s.io/v1
kind: NetworkPolicy
metadata:
  name: my-network-policy
  namespace: default
spec:
  podSelector:
    matchLabels:
      app: my-app
  ingress:
    - from:
        - podSelector:
            matchLabels:
              app: allowed-app
```

**Resources:**

- [Network Policies Overview](https://kubernetes.io/docs/concepts/services-networking/network-policies/)
- [Network Policy Examples](https://kubernetes.io/docs/concepts/services-networking/network-policies/#examples)

---

#### **4. Scan and Secure Container Images Before Deploying to Kubernetes**

**Container Image Security:**

- **Scanning Tools:** Use tools like Trivy, Clair, or Anchore to scan images for vulnerabilities.
- **Best Practices:** Use minimal base images, regularly update images, and avoid running containers as root.

**Example Scanning Command (Trivy):**

```sh
trivy image my-image:latest
```

**Resources:**

- [Trivy](https://github.com/aquasecurity/trivy)
- [Clair](https://github.com/quay/clair)
- [Anchore](https://anchore.com/)

---

#### **5. Explore and Use Kubernetes Pod Security Policies**

**Pod Security Policies:**

- **Purpose:** Enforce security standards for pods (note: Pod Security Policies are deprecated in Kubernetes 1.21 and are planned for removal in 1.25).

**Example Pod Security Policy YAML:**

```yaml
apiVersion: policy/v1beta1
kind: PodSecurityPolicy
metadata:
  name: my-psp
spec:
  privileged: false
  volumes:
    - "configMap"
    - "emptyDir"
    - "projected"
    - "secret"
    - "downwardAPI"
  allowedCapabilities:
    - "NET_ADMIN"
    - "SYS_TIME"
```

**Resources:**

- [Pod Security Policies](https://kubernetes.io/docs/concepts/security/pod-security-policy/)
- [Pod Security Standards](https://kubernetes.io/docs/concepts/security/pod-security-standards/)

---

### **Documentation**

**Document the Following:**

- **RBAC:**

  - Definitions, YAML examples for Roles and RoleBindings, and use cases.

- **Network Policies:**

  - Definitions, YAML examples, and use cases for controlling pod communication.

- **Container Image Security:**

  - Tools and methods for scanning images and best practices for secure images.

- **Pod Security Policies:**
  - Definitions, YAML examples, and alternatives if using newer Kubernetes versions.

---

### Day 28: CI/CD with Jenkins and Kubernetes

**Objective:** Integrate Jenkins with Kubernetes to automate deployments, write pipelines to handle Docker images, monitor Kubernetes clusters, implement advanced deployment strategies, and use Helm for application management.

---

#### **1. Integrate Jenkins with Kubernetes for Automated Deployments**

**Steps to Integrate:**

- **Install Jenkins Kubernetes Plugin:** This plugin allows Jenkins to dynamically provision Kubernetes agents (pods) to execute build jobs.

**Installation:**

1. Go to Jenkins Dashboard → Manage Jenkins → Manage Plugins.
2. Search for "Kubernetes" and install the "Kubernetes" plugin.
3. Restart Jenkins.

**Configure Kubernetes Cloud:**

1. Go to Jenkins Dashboard → Manage Jenkins → Manage Nodes and Clouds → Configure Clouds → Add a new cloud → Kubernetes.
2. Configure the Kubernetes cluster URL and Jenkins credentials.
3. Set up pod templates for Jenkins agents.

**Resources:**

- [Jenkins Kubernetes Plugin](https://plugins.jenkins.io/kubernetes/)
- [Configuring Kubernetes Cloud](https://plugins.jenkins.io/kubernetes/#configuring-the-plugin)

---

#### **2. Write a Jenkins Pipeline That Builds, Tests, and Deploys a Docker Image to Kubernetes**

**Pipeline Example:**

```groovy
pipeline {
    agent any
    stages {
        stage('Build') {
            steps {
                script {
                    docker.build('my-app')
                }
            }
        }
        stage('Test') {
            steps {
                script {
                    docker.image('my-app').inside {
                        sh 'pytest'
                    }
                }
            }
        }
        stage('Deploy') {
            steps {
                script {
                    docker.withRegistry('https://index.docker.io/v1/', 'dockerhub-credentials') {
                        docker.image('my-app').push('latest')
                    }
                }
                kubernetesDeploy(
                    configs: 'kubernetes/deployment.yaml',
                    kubeconfigId: 'kubeconfig'
                )
            }
        }
    }
}
```

**Resources:**

- [Jenkins Pipeline Syntax](https://www.jenkins.io/doc/book/pipeline/syntax/)
- [Kubernetes Plugin for Jenkins](https://plugins.jenkins.io/kubernetes/)

---

#### **3. Set Up Jenkins to Monitor the Kubernetes Cluster**

**Steps to Monitor:**

- **Install Monitoring Plugins:** Use plugins like Prometheus, Grafana, or Kubernetes Dashboard Plugin for Jenkins.

**Example Monitoring Setup:**

1. Install the "Prometheus" plugin on Jenkins.
2. Configure Prometheus to scrape Jenkins metrics.
3. Set up a Grafana dashboard to visualize Jenkins metrics and Kubernetes cluster health.

**Resources:**

- [Prometheus Plugin for Jenkins](https://plugins.jenkins.io/prometheus/)
- [Grafana for Jenkins Monitoring](https://grafana.com/docs/grafana/latest/getting-started/getting-started-jenkins/)

---

#### **4. Implement Blue-Green or Canary Deployments Using Jenkins and Kubernetes**

**Blue-Green Deployment:**

- **Concept:** Deploy new versions alongside the old version. Switch traffic to the new version once it's confirmed to be working.

**Example Deployment Strategy:**

1. **Deploy New Version:**

```yaml
apiVersion: apps/v1
kind: Deployment
metadata:
  name: my-app-blue
spec:
  replicas: 3
  selector:
    matchLabels:
      app: my-app
      version: blue
  template:
    metadata:
      labels:
        app: my-app
        version: blue
    spec:
      containers:
        - name: my-container
          image: my-app:latest
```

2. **Switch Traffic:**

Update your Service to point to the new version by changing the label selector.

**Canary Deployment:**

- **Concept:** Gradually roll out changes to a subset of users before a full release.

**Example Deployment Strategy:**

1. **Initial Canary Release:**

```yaml
apiVersion: apps/v1
kind: Deployment
metadata:
  name: my-app-canary
spec:
  replicas: 1
  selector:
    matchLabels:
      app: my-app
      version: canary
  template:
    metadata:
      labels:
        app: my-app
        version: canary
    spec:
      containers:
        - name: my-container
          image: my-app:latest
```

2. **Gradual Rollout:**

Increase the number of replicas as you validate the canary deployment's stability.

**Resources:**

- [Blue-Green Deployment Strategy](https://www.redhat.com/en/topics/devops/what-is-blue-green-deployment)
- [Canary Releases](https://martinfowler.com/bliki/CanaryRelease.html)

---

#### **5. Learn About and Set Up Helm to Manage Kubernetes Applications**

**Helm Basics:**

- **Purpose:** Helm is a package manager for Kubernetes, simplifying the deployment and management of applications.

**Steps to Set Up Helm:**

1. **Install Helm:**

   ```sh
   curl https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3 | bash
   ```

2. **Add Helm Repository:**

   ```sh
   helm repo add stable https://charts.helm.sh/stable
   ```

3. **Install a Chart:**

   ```sh
   helm install my-release stable/nginx
   ```

4. **Manage Releases:**

   ```sh
   helm list
   helm upgrade my-release stable/nginx
   helm uninstall my-release
   ```

**Resources:**

- [Helm Documentation](https://helm.sh/docs/)
- [Helm Charts](https://artifacthub.io/)

---

### **Documentation**

**Document the Following:**

- **Jenkins-Kubernetes Integration:**

  - Configuration steps and benefits.

- **Jenkins Pipeline:**

  - Example pipeline script and explanations of each stage.

- **Cluster Monitoring:**

  - Tools and setup process for monitoring Jenkins and Kubernetes.

- **Deployment Strategies:**

  - Blue-Green and Canary deployment examples and how they are implemented.

- **Helm Setup:**
  - Installation steps, basic commands, and example usage of Helm charts.

---

### Day 29: Monitoring and Logging in Kubernetes

**Objective:** Set up and configure monitoring and logging tools to track the health and performance of your Kubernetes cluster. Learn to visualize metrics, collect logs, and manage the cluster effectively.

---

#### **1. Learn About Monitoring Tools Like Prometheus and Grafana**

**Prometheus:**

- **Description:** An open-source monitoring and alerting toolkit designed for reliability and scalability. It collects metrics from configured endpoints at specified intervals and stores them in a time-series database.
- **Website:** [Prometheus](https://prometheus.io/)

**Grafana:**

- **Description:** An open-source analytics and monitoring platform. It integrates with various data sources, including Prometheus, to create dashboards and visualizations.
- **Website:** [Grafana](https://grafana.com/)

**Resources:**

- [Introduction to Prometheus](https://prometheus.io/docs/introduction/overview/)
- [Introduction to Grafana](https://grafana.com/docs/grafana/latest/getting-started/)

---

#### **2. Set Up Prometheus to Monitor Your Kubernetes Cluster**

**Steps to Install Prometheus:**

1. **Install Prometheus Using Helm:**

   ```sh
   helm repo add prometheus-community https://prometheus-community.github.io/helm-charts
   helm repo update
   helm install prometheus prometheus-community/prometheus
   ```

2. **Verify Installation:**

   ```sh
   kubectl get pods -n default -l "release=prometheus"
   ```

**Configuration:**

- **Prometheus Configuration:** Prometheus uses configuration files to specify what data to scrape. Default Helm values will set up a basic configuration that monitors all the Kubernetes nodes and pods.

**Resources:**

- [Prometheus Helm Chart](https://artifacthub.io/packages/helm/prometheus-community/prometheus)

---

#### **3. Visualize Metrics Using Grafana**

**Steps to Install Grafana:**

1. **Install Grafana Using Helm:**

   ```sh
   helm install grafana grafana/grafana
   ```

2. **Access Grafana Dashboard:**

   ```sh
   kubectl port-forward svc/grafana 3000:80
   ```

   Open `http://localhost:3000` in your browser. Default username is `admin` and password is `admin`.

3. **Add Prometheus as a Data Source:**

   - Go to Grafana → Configuration → Data Sources.
   - Add Prometheus and set the URL to `http://prometheus-server`.

4. **Create Dashboards:**

   - Use pre-built dashboards available in Grafana or create your own to visualize metrics.

**Resources:**

- [Grafana Documentation](https://grafana.com/docs/grafana/latest/)
- [Grafana Dashboards](https://grafana.com/grafana/dashboards)

---

#### **4. Set Up and Configure Fluentd for Logging in Kubernetes**

**Steps to Install Fluentd:**

1. **Install Fluentd Using Helm:**

   ```sh
   helm repo add fluent https://fluent.github.io/helm-charts
   helm repo update
   helm install fluentd fluent/fluentd
   ```

2. **Configure Fluentd:**

   Fluentd collects logs from various sources and can forward them to different outputs (e.g., Elasticsearch, Fluentd).

   - **Edit Fluentd ConfigMap:**

     ```sh
     kubectl edit configmap fluentd-config -n kube-system
     ```

     Add your desired configurations for log collection and forwarding.

**Resources:**

- [Fluentd Documentation](https://docs.fluentd.org/)
- [Fluentd Helm Chart](https://artifacthub.io/packages/helm/fluent/fluentd)

---

#### **5. Explore and Use Kubernetes Dashboard for Cluster Management**

**Steps to Install Kubernetes Dashboard:**

1. **Install Kubernetes Dashboard:**

   ```sh
   kubectl apply -f https://raw.githubusercontent.com/kubernetes/dashboard/v2.6.0/aio/deploy/recommended.yaml
   ```

2. **Access Dashboard:**

   ```sh
   kubectl proxy
   ```

   Open `http://localhost:8001/api/v1/namespaces/kubernetes-dashboard/services/http:kubernetes-dashboard:/proxy/` in your browser.

3. **Set Up Access:**

   - **Create a Service Account:**

     ```yaml
     apiVersion: v1
     kind: ServiceAccount
     metadata:
       name: admin-user
       namespace: kubernetes-dashboard
     ```

   - **Bind Role to Service Account:**

     ```yaml
     apiVersion: rbac.authorization.k8s.io/v1
     kind: ClusterRoleBinding
     metadata:
       name: admin-user
     subjects:
       - kind: ServiceAccount
         name: admin-user
         namespace: kubernetes-dashboard
     roleRef:
       kind: ClusterRole
       name: cluster-admin
       apiGroup: rbac.authorization.k8s.io
     ```

   - **Get Token:**

     ```sh
     kubectl -n kubernetes-dashboard create token admin-user
     ```

**Resources:**

- [Kubernetes Dashboard Documentation](https://kubernetes.io/docs/tasks/access-application-cluster/web-ui-dashboard/)
- [Kubernetes Dashboard Installation Guide](https://kubernetes.io/docs/tasks/access-application-cluster/web-ui-dashboard/)

---

### **Documentation**

**Document the Following:**

- **Monitoring Tools:**

  - Overview of Prometheus and Grafana, and their roles in monitoring Kubernetes.

- **Prometheus Setup:**

  - Installation steps, verification, and basic configuration.

- **Grafana Visualization:**

  - Adding Prometheus as a data source, creating dashboards, and visualizing metrics.

- **Fluentd Configuration:**

  - Installation, configuration, and log collection setup.

- **Kubernetes Dashboard:**
  - Installation, access, and configuring user access.

---

### Day 30: Final Project - Detailed Guide

**Objective:** Build and deploy a fully automated CI/CD pipeline using Jenkins and Kubernetes. The pipeline will handle building a Docker image, running automated tests, deploying the application to a Kubernetes cluster, and implementing monitoring and logging. This guide includes all required scripts, software details, and instructions to replicate the setup.

---

#### **1. Prerequisites**

**Software:**

- **Jenkins**: CI/CD tool
- **Docker**: Containerization platform
- **Kubernetes**: Container orchestration
- **Helm**: Kubernetes package manager
- **Prometheus & Grafana**: Monitoring
- **Fluentd**: Logging

**Tools and Configurations:**

- **Git**: Version control
- **Minikube** or a cloud Kubernetes cluster (e.g., GKE, EKS, AKS)
- **kubectl**: Kubernetes command-line tool
- **Helm**: Kubernetes package manager

---

#### **2. Setup Jenkins**

**2.1 Install Jenkins:**

1. **Install Jenkins using Docker:**

   ```sh
   docker run -d --name jenkins -p 8080:8080 -p 50000:50000 jenkins/jenkins:lts
   ```

2. **Access Jenkins:**
   Open `http://localhost:8080` in your browser.

3. **Unlock Jenkins:**
   Retrieve the unlock key:

   ```sh
   docker exec jenkins cat /var/jenkins_home/secrets/initialAdminPassword
   ```

   Paste the key into the Jenkins setup wizard.

4. **Install Recommended Plugins:**
   Follow the setup wizard to install the recommended plugins.

5. **Create Admin User:**
   Complete the setup by creating an admin user.

**2.2 Configure Jenkins:**

1. **Install Necessary Plugins:**

   - Go to **Manage Jenkins** → **Manage Plugins**.
   - Install the following plugins:
     - **Docker Pipeline**
     - **Kubernetes CI Plugin**
     - **Git Plugin**
     - **Pipeline Plugin**
     - **Blue Ocean**

2. **Configure Jenkins to Use Docker:**

   - **Manage Jenkins** → **Manage Nodes and Clouds** → **Configure Clouds**.
   - Add a new cloud and select Docker.

3. **Set Up Credentials:**
   - **Manage Jenkins** → **Manage Credentials**.
   - Add credentials for DockerHub, GitHub, and Kubernetes.

---

#### **3. Build and Test Docker Image**

**3.1 Create a Dockerfile:**

1. **Create a `Dockerfile` for your application:**

   ```Dockerfile
   # Use an official Node.js runtime as a parent image
   FROM node:14

   # Set the working directory
   WORKDIR /app

   # Copy package.json and package-lock.json
   COPY package*.json ./

   # Install dependencies
   RUN npm install

   # Copy the rest of the application code
   COPY . .

   # Expose port
   EXPOSE 3000

   # Start the application
   CMD ["npm", "start"]
   ```

**3.2 Create a Jenkins Pipeline Job:**

1. **Create a new pipeline job in Jenkins:**

   - Go to **New Item** → **Pipeline**.
   - Name your job (e.g., `ci-cd-pipeline`).

2. **Configure the Pipeline Script:**

   ```groovy
   pipeline {
       agent any

       stages {
           stage('Checkout') {
               steps {
                   git 'https://github.com/your-repo/your-app.git'
               }
           }

           stage('Build') {
               steps {
                   script {
                       docker.build('your-app-image')
                   }
               }
           }

           stage('Test') {
               steps {
                   script {
                       docker.image('your-app-image').inside {
                           sh 'npm test'
                       }
                   }
               }
           }

           stage('Deploy') {
               steps {
                   script {
                       docker.withRegistry('https://index.docker.io/v1/', 'dockerhub-credentials') {
                           docker.image('your-app-image').push('latest')
                       }
                   }
               }
           }
       }

       post {
           always {
               cleanWs()
           }
       }
   }
   ```

**Note:** Replace `https://github.com/your-repo/your-app.git` with your actual Git repository URL and `dockerhub-credentials` with the ID of your DockerHub credentials.

---

#### **4. Deploy to Kubernetes**

**4.1 Create Kubernetes Deployment and Service YAML Files:**

1. **Create `deployment.yaml`:**

   ```yaml
   apiVersion: apps/v1
   kind: Deployment
   metadata:
     name: your-app
     labels:
       app: your-app
   spec:
     replicas: 2
     selector:
       matchLabels:
         app: your-app
     template:
       metadata:
         labels:
           app: your-app
       spec:
         containers:
           - name: your-app
             image: your-app-image:latest
             ports:
               - containerPort: 3000
   ```

2. **Create `service.yaml`:**

   ```yaml
   apiVersion: v1
   kind: Service
   metadata:
     name: your-app-service
   spec:
     selector:
       app: your-app
     ports:
       - protocol: TCP
         port: 80
         targetPort: 3000
     type: LoadBalancer
   ```

**4.2 Apply Kubernetes Configurations:**

1. **Deploy to Kubernetes:**

   ```sh
   kubectl apply -f deployment.yaml
   kubectl apply -f service.yaml
   ```

2. **Verify Deployment:**

   ```sh
   kubectl get pods
   kubectl get svc
   ```

---

#### **5. Implement Monitoring and Logging**

**5.1 Monitoring:**

1. **Install Prometheus and Grafana using Helm (if not already done):**

   ```sh
   helm install prometheus prometheus-community/prometheus --namespace monitoring
   helm install grafana grafana/grafana --namespace monitoring
   ```

2. **Configure Grafana to Use Prometheus:**

   - Access Grafana at `http://localhost:3000`.
   - Add Prometheus as a data source.
   - Create or import dashboards for Kubernetes monitoring.

**5.2 Logging:**

1. **Deploy Fluentd:**

   ```yaml
   apiVersion: apps/v1
   kind: DaemonSet
   metadata:
     name: fluentd
     namespace: kube-system
   spec:
     selector:
       matchLabels:
         name: fluentd
     template:
       metadata:
         labels:
           name: fluentd
       spec:
         containers:
           - name: fluentd
             image: fluent/fluentd:v1.12-debian-1
             volumeMounts:
               - name: config
                 mountPath: /fluentd/etc
                 subPath: fluentd.conf
               - name: varlog
                 mountPath: /var/log
         volumes:
           - name: config
             configMap:
               name: fluentd-config
           - name: varlog
             hostPath:
               path: /var/log
   ```

   Apply the Fluentd configuration:

   ```sh
   kubectl apply -f fluentd-daemonset.yaml
   ```

2. **Configure Fluentd to Send Logs to Elasticsearch or another log aggregator.**

---

### **Documentation**

1. **Document the Process:**

   - **Setup Jenkins**: Instructions for installing Jenkins, configuring plugins, and setting up the pipeline.
   - **Docker**: Detailed Dockerfile and Jenkins pipeline configuration.
   - **Kubernetes**: YAML files for deployment and services, and instructions to apply them.
   - **Monitoring and Logging**: Setup instructions for Prometheus, Grafana, and Fluentd.

2. **Include:**

   - **Screenshots**: Provide screenshots of Jenkins setup, Grafana dashboards, and Kubernetes deployments.
   - **Scripts**: Attach the complete scripts and configuration files used.
   - **Usage Instructions**: How to trigger the pipeline, check logs, and monitor the application.

---
