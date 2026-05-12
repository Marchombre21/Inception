#!/bin/bash

DATADIR="/var/lib/mysql"

# If the folder already exists, all database system already exists
if [ ! -d "$DATADIR/mysql" ]; then

    mariadb-install-db --user=mysql --datadir=$DATADIR

    mariadbd-safe --datadir=$DATADIR &
    
    sleep 5 

    mariadb -e "CREATE DATABASE IF NOT EXISTS \`${SQL_DATABASE}\`;"
    mariadb -e "CREATE USER IF NOT EXISTS '${SQL_USER}'@'%' IDENTIFIED BY '${SQL_PASSWORD}';"
    mariadb -e "GRANT ALL PRIVILEGES ON \`${SQL_DATABASE}\`.* TO '${SQL_USER}'@'%';"
    # Privileges MAJ
    mariadb -e "FLUSH PRIVILEGES;"

    mariadb -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '${SQL_ROOT_PASSWORD}';"

    # mariadb-admin is an administration program for the mariadbd daemon.
    # Since we just added a password for the root user, we now need to enter it to log in
    # as root
    mariadb-admin -u root -p"${SQL_ROOT_PASSWORD}" shutdown
fi

exec mariadbd --user=mysql --datadir=$DATADIR
