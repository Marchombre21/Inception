SRC_CMP := srcs/docker-compose.yml

CMD := docker compose


all: wp mdb
	$(CMD) -f $(SRC_CMP) up -d

re:
	$(CMD) -f $(SRC_CMP) up --build -d

wp:
	mkdir -p /home/bfitte/data/wordpress

mdb:
	mkdir -p /home/bfitte/data/mariadb

down:
	$(CMD) -f $(SRC_CMP) down

stop:
	$(CMD) -f $(SRC_CMP) stop

rmc:
	docker rm $(docker ps -a -q)

rmi:
	docker image prune -a

.PHONY: all wp mdb down stop rmc rmi