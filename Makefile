SRC_CMP := srcs/docker-compose.yml

CMD := docker compose

all: wp mdb
	$(CMD) -f $(SRC_CMP) up -d

re:
	$(CMD) -f $(SRC_CMP) up --build -d

wp:
	mkdir -p /home/bruno/data/wordpress

mdb:
	mkdir -p /home/bruno/data/mariadb

down:
	$(CMD) -f $(SRC_CMP) down

stop:
	$(CMD) -f $(SRC_CMP) stop

rmc:
	docker rm $(docker ps -a -q)

rmi:
	docker image prune -a

retest:
	$(CMD) -f $(SRC_CMP) down -v
	sudo rm -rf ../data/mariadb/
	sudo rm -rf ../data/wordpress/

.PHONY: all wp mdb down stop rmc rmi retest