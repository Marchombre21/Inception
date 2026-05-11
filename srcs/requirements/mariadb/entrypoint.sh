#!/bin/bash
sudo systemctl start mariadb
sudo mysql_secure_installation -y
sudo mariadb

CREATE DATABASE	wpdb CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
CREATE USER 'bfitte'@'localhost' IDENTIFIED BY 'truc'
CREATE USER 'chef'@'localhost' IDENTIFIED BY 'truc2'
GRANT ALL PRIVILEGES ON appdb.* TO 'chef'@'localhost';
FLUSH PRIVILEGES;
EXIT;

sudo nano /etc/mysql/mariadb.conf.d/50-server.cnf
bind-adress = 0.0.0.0
port = 3306
sudo systemctl restart mariadb
sudo ufw allow 3306/tcp


