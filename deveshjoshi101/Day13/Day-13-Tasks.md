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
