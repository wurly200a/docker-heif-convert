DOCKER_USERNAME ?= wurly
DOCKER_IMAGE_NAME ?= docker-heif-convert

BUILD_ARGS := --build-arg IMAGE_NAME=${DOCKER_IMAGE_NAME}

.PHONY: build
build:
	docker build -t $(DOCKER_USERNAME)/$(DOCKER_IMAGE_NAME):latest $(BUILD_ARGS) .

.PHONY: push
push:
	echo ${DOCKER_PASSWORD} | docker login -u $(DOCKER_USERNAME) --password-stdin
	docker push $(DOCKER_USERNAME)/$(DOCKER_IMAGE_NAME):latest
