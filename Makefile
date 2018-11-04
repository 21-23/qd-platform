IMAGE_NAME=qd-platform
CONTAINER_NAME=qd-platform
DOCKER_SOCKET=/var/run/docker.sock
TIMEOUT_SECONDS=9999

all: build run

build:
	docker build -t $(IMAGE_NAME) .

run:
	docker run \
	  --rm \
	  --tty \
	  --detach \
	  --interactive \
	  --name $(CONTAINER_NAME) \
	  --stop-timeout=$(TIMEOUT_SECONDS) \
	  --network hex-network \
	  --mount type=bind,source=$(DOCKER_SOCKET),target=$(DOCKER_SOCKET) \
	  $(IMAGE_NAME)
