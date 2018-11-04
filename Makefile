NAME=qd-platform
DOCKER_SOCKET=/var/run/docker.sock
TIMEOUT=9999

all: build run

build:
	docker build -t $(NAME) .

run:
	docker run \
	  --rm \
	  --tty \
	  --detach \
	  --interactive \
	  --name $(NAME) \
	  --stop-timeout=$(TIMEOUT) \
	  --network hex-network \
	  --mount type=bind,source=$(DOCKER_SOCKET),target=$(DOCKER_SOCKET) \
	  $(NAME)

stop:
	docker stop --time $(TIMEOUT) $(NAME)
