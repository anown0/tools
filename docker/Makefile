DOCKER_USERNAME ?= mark 
APPLICATION_NAME ?= hello-world

REPOSITORY ?= custom1
TAG ?= layer1

build:
	docker build --build-arg sw-ver=0.1 -t $(REPOSITORY):$(TAG) .

enter:
	docker run -it $(REPOSITORY):$(TAG) bash

inspect:
	docker inspect $(REPOSITORY):$(TAG)

clean:
	docker system prune -a --volumes
