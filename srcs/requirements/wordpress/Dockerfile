FROM debian:12

# php-mysql to allow php to connect with database server, 8.2 because debian v12 doesn't accept higher version
# mariadb-client to add the CLI utils to interact with remote database
RUN apt-get update && apt-get install -y curl php8.2-fmp php8.2-mysql mariadb-client && \
curl -o /usr/local/bin/wp https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && \
chmod +x /usr/local/bin/wp && \
rm -rf /var/lib/apt/lists/*

EXPOSE 9000

ENTRYPOINT ["entrypoint.sh"]
