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
