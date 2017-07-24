NAME = gomeet-builder
VERSION = $(shell cat VERSION)
DOCKER_TAG = $(shell cat VERSION | tr +- __)

.PHONY: build
build:
	@echo "$(NAME): build task"
	docker build -t gomeet/gomeet-builder:$(DOCKER_TAG) .
