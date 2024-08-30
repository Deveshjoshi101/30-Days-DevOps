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