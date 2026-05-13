#!/bin/bash 

cd  /var/www/html

if [ ! -f wp-config.php ]; then

	wp core download --skip-content --allow-root

	wp config create \
		--dbname=$SQL_DATABASE \
		--dbuser=$SQL_USER_NAME \
		--dbpass=$SQL_PASSWORD \
		--dbhost=mariadb \
		--allow-root

	wp core install \
		--url=$URL_SITE \
		--title=$DOMAIN_NAME \
		--admin_user=$WP_ADMIN_NAME \
		--admin_password=$WP_ADMIN_PASSWORD \
		--admin_email=$WP_ADMIN_EMAIL \
		--allow-root

	wp user create $WP_USER_NAME $WP_USER_MAIL --user_pass=$WP_USER_PASSWORD --role=author --allow-root
fi

# The run directory is deleted every time the system is restarted (security)
# FPM is writing its PID file and its socket file in it so we have to recreate it.
mkdir -p /run/php

exec php-fpm8.2 -F
