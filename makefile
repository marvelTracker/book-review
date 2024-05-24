# Makefile for building, tagging, and pushing bookreview-web and bookreview-api Docker images

# Variables for the bookreview-api Docker image
API_IMAGE_NAME = bookreview-api
API_TAG = latest
API_DOCKERFILE = book-review-api/Dockerfile
API_CONTEXT = book-review-api

# Variables for the bookreview-web Docker image
WEB_IMAGE_NAME = bookreview-web
WEB_TAG = latest
WEB_DOCKERFILE = book-review-ui/Dockerfile
WEB_CONTEXT = book-review-ui

# Docker registry
REGISTRY = your_registry # e.g., docker.io/username, ghcr.io/username, gcr.io/project-id

# Full image names
FULL_API_IMAGE_NAME = $(REGISTRY)/$(API_IMAGE_NAME):$(API_TAG)
FULL_WEB_IMAGE_NAME = $(REGISTRY)/$(WEB_IMAGE_NAME):$(WEB_TAG)

# Default target
.PHONY: all
all: build-api build-web tag-api tag-web push-api push-web

# Build the bookreview-api Docker image
.PHONY: build-api
build-api:
	docker build -f $(API_DOCKERFILE) -t $(API_IMAGE_NAME) $(API_CONTEXT)

# Build the bookreview-web Docker image
.PHONY: build-web
build-web:
	docker build -f $(WEB_DOCKERFILE) -t $(WEB_IMAGE_NAME) $(WEB_CONTEXT)

# Tag the bookreview-api Docker image
.PHONY: tag-api
tag-api:
	docker tag $(API_IMAGE_NAME):latest $(FULL_API_IMAGE_NAME)

# Tag the bookreview-web Docker image
.PHONY: tag-web
tag-web:
	docker tag $(WEB_IMAGE_NAME):latest $(FULL_WEB_IMAGE_NAME)

# Push the bookreview-api Docker image to the registry
.PHONY: push-api
push-api:
	docker push $(FULL_API_IMAGE_NAME)

# Push the bookreview-web Docker image to the registry
.PHONY: push-web
push-web:
	docker push $(FULL_WEB_IMAGE_NAME)

# Clean up local Docker images
.PHONY: clean
clean:
	docker rmi $(API_IMAGE_NAME):latest $(FULL_API_IMAGE_NAME)
	docker rmi $(WEB_IMAGE_NAME):latest $(FULL_WEB_IMAGE_NAME)

# Example run: make run-api API_TAG=1.0
.PHONY: run-api
run-api: build-api tag-api push-api

# Example run: make run-web WEB_TAG=1.0
.PHONY: run-web
run-web: build-web tag-web push-web

# Example run: make run API_TAG=1.0 WEB_TAG=1.0
.PHONY: run
run: build-api build-web tag-api tag-web push-api push-web
