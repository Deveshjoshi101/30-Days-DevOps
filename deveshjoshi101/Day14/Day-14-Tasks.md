### Day 14: Mini Project - Complete Linux Server Setup and Automation

**Project Objective:** Set up a Linux server with a complete LAMP/LEMP stack, configure basic security settings including a firewall and SSH keys, and write scripts to automate routine maintenance tasks. Document the entire process with clear instructions.

---

Once you combine the activities and knowledge with the scripts you finished this week, you will have finished the projects. Well done!

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
