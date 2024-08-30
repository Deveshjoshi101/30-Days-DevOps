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
