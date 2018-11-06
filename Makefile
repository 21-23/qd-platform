IMAGE_NAME=qd-platform
CONTAINER_NAME=qd-platform
DOCKER_SOCKET=/var/run/docker.sock
TIMEOUT_SECONDS=9999
HEXFILE=./Hexfile.yml
HEXFILE_DEV=./Hexfile.dev.yml

all: build run

build:
	cp -r ../_qd-secret/front-service/config.secret*.json ./services/front-service
	mkdir -p ./services/ignition/data
	cp -r ../_qd-secret/init-service/* ./services/ignition/data
	docker build -t $(IMAGE_NAME) .
	rm ./services/front-service/config.secret*.json
	rm -r ./services/ignition/data

run: run-container

run-dev:
	@make HEXFILE=$(HEXFILE_DEV) run-container

run-container:
	docker run \
	  --rm \
	  --tty \
	  --detach \
	  --interactive \
	  --name $(CONTAINER_NAME) \
	  --stop-timeout=$(TIMEOUT_SECONDS) \
	  --network hex-network \
	  --mount type=bind,source=$(DOCKER_SOCKET),target=$(DOCKER_SOCKET) \
	  --mount type=bind,source=$(abspath $(HEXFILE)),target=/opt/hex/Hexfile.yml \
	  $(IMAGE_NAME)
