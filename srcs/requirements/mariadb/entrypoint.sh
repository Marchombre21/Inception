#!/bin/bash

DATADIR="/var/lib/mysql"

if [ ! -d "$DATADIR/mysql" ]; then

    mysql_install_db --user=mysql --datadir=$DATADIR

    mysqld_safe --datadir=$DATADIR &
    
    sleep 5 

    mariadb -e "CREATE DATABASE IF NOT EXISTS \`wpdb\`;"
    mariadb -e "CREATE USER IF NOT EXISTS 'chef'@'%' IDENTIFIED BY 'truc2';"
    mariadb -e "GRANT ALL PRIVILEGES ON \`wpdb\`.* TO 'chef'@'%';"
    mariadb -e "FLUSH PRIVILEGES;"

    mariadb -e "ALTER USER 'root'@'localhost' IDENTIFIED BY 'mot_de_passe_root';"

    mysqladmin -u root -p'mot_de_passe_root' shutdown
fi

exec mysqld_safe --datadir=$DATADIR
