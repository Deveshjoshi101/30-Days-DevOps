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
