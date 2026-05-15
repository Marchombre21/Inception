all: wp mdb
	docker compose -f srcs/docker-compose.yml up -d

wp:
	mkdir -p /home/bfitte/data/wordpress

mdb:
	mkdir -p /home/bfitte/data/mariadb

.PHONY: all wp mdb