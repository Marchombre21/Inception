FROM debian:12
RUN apt-get update && \
apt-get install -y nginx && \
rm -rf /var/lib/apt/lists/*
COPY ./conf/nginx.conf /etc/nginx/nginx.conf
CMD "-g deamon off;"
