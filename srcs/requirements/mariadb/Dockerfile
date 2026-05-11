FROM debian:12
RUN apt-get update && apt-get -y install mariadb-server && \
rm -rf /var/lib/apt/lists/* 

COPY entrypoint.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/entrypoint.sh

EXPOSE 3306

ENTRYPOINT ["entrypoint.sh"]
