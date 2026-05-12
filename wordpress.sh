#!/bin/bash

# Update packages
sudo dnf update -y

# Install Apache, PHP and required extensions
sudo dnf install -y httpd wget php php-mysqlnd

# Start and enable Apache
sudo systemctl start httpd
sudo systemctl enable httpd

# Go to web root
sudo cd /var/www/html

# Download latest WordPress
sudo wget https://wordpress.org/latest.tar.gz

# Extract WordPress
sudo tar -xvzf latest.tar.gz

# Copy WordPress files
sudo cp -rf wordpress/* /var/www/html/

# Remove unwanted files
sudo rm -rf wordpress latest.tar.gz

# Set permissions
sudo chown -R apache:apache /var/www/html
sudo chmod -R 755 /var/www/html

# Create wp-config.php
cp /var/www/html/wp-config-sample.php /var/www/html/wp-config.php

# Replace DB values
sed -i "s/database_name_here/wp_skdb/g" /var/www/html/wp-config.php
sed -i "s/username_here/wp_suresh/g" /var/www/html/wp-config.php
sed -i "s/password_here/wordpress/g" /var/www/html/wp-config.php

# Replace RDS endpoint dynamically
sed -i "s/localhost/${rds_endpoint}/g" /var/www/html/wp-config.php

# Restart Apache
sudo systemctl restart httpd