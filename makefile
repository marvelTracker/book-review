# Makefile for building, tagging, and pushing book-review-web and book-review-api Docker images

# Variables for AWS region and account ID
AWS_REGION ?= us-east-1
AWS_ACCOUNT_ID ?= your_account_id

# Docker registry
REGISTRY = $(AWS_ACCOUNT_ID).dkr.ecr.$(AWS_REGION).amazonaws.com

# Full image names
FULL_API_IMAGE_NAME = $(REGISTRY)/book-review-api:latest
FULL_WEB_IMAGE_NAME = $(REGISTRY)/book-review-web:latest

# Default target
.PHONY: all
all: build-api build-web tag-api tag-web docker-login push-api push-web

# Build the book-review-api Docker image
.PHONY: build-api
build-api:
	docker build -f book-review-api/Dockerfile -t book-review-api book-review-api

# Build the book-review-web Docker image
.PHONY: build-web
build-web:
	docker build -f book-review-ui/Dockerfile -t book-review-web book-review-ui

# Tag the book-review-api Docker image
.PHONY: tag-api
tag-api:
	docker tag book-review-api $(FULL_API_IMAGE_NAME)

# Tag the book-review-web Docker image
.PHONY: tag-web
tag-web:
	docker tag book-review-web $(FULL_WEB_IMAGE_NAME)

# Docker login to ECR
.PHONY: docker-login
docker-login:
	aws ecr get-login-password --region $(AWS_REGION) | docker login --username AWS --password-stdin $(REGISTRY)

# Push the book-review-api Docker image to the registry
.PHONY: push-api
push-api:
	docker push $(FULL_API_IMAGE_NAME)

# Push the book-review-web Docker image to the registry
.PHONY: push-web
push-web:
	docker push $(FULL_WEB_IMAGE_NAME)

# Clean up local Docker images
.PHONY: clean
clean:
    docker rmi book-review-api $(FULL_API_IMAGE_NAME)
    docker rmi book-review-web $(FULL_WEB_IMAGE_NAME)

# Example run: make run-api API_TAG=1.0
.PHONY: run-api
run-api: build-api tag-api docker-login push-api

# Example run: make run-web WEB_TAG=1.0
.PHONY: run-web
run-web: build-web tag-web docker-login push-web

# Example run: make run API_TAG=1.0 WEB_TAG=1.0
.PHONY: run
run: build-api build-web tag-api tag-web docker-login push-api push-web
