FROM debian:12

# php-mysql to allow php to connect with database server, 8.2 because debian v12 doesn't accept higher version
# mariadb-client to add the CLI utils to interact with remote database
RUN apt-get update && apt-get install -y curl php8.2-fpm php8.2-mysql mariadb-client && \
curl -o /usr/local/bin/wp https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && \
chmod +x /usr/local/bin/wp && \
apt-get purge -y --auto-remove curl && \
rm -rf /var/lib/apt/lists/*

RUN sed -i 's/listen = \/run\/php\/php8.2-fpm.sock/listen = 0.0.0.0:9000/g' /etc/php/8.2/fpm/pool.d/www.conf

COPY entrypoint.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/entrypoint.sh

EXPOSE 9000

ENTRYPOINT ["entrypoint.sh"]