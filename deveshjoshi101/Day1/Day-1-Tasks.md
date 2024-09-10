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
