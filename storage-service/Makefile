all: build run

build:
	cp -rf ../../qd-secrets/services/storage/.env .
	docker-compose build

run:
	docker-compose up -d

stop:
	docker-compose stop
