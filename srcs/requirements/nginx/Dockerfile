FROM debian:12
RUN apt-get update && \
apt-get install -y nginx openssl && \
rm -rf /var/lib/apt/lists/* && \
mkdir -p /etc/nginx/ssl && \
openssl req -x509 -noenc -newkey rsa:2048 -out /etc/nginx/ssl/inception.crt -keyout /etc/nginx/ssl/inception.key -subj "/C=FR/ST=IDF/L=Paris/O=42/OU=42/CN=bfitte.42.fr/UID=bfitte"
COPY ./conf/nginx.conf /etc/nginx/conf.d/nginx.conf
EXPOSE 443
CMD ["nginx", "-g", "daemon off;"]
