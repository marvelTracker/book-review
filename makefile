# Makefile for building, tagging, pushing Docker images and updating Helm values

# Variables for AWS region and account ID
AWS_REGION ?= us-east-1
AWS_ACCOUNT_ID ?= your_account_id

# Docker registry
REGISTRY = $(AWS_ACCOUNT_ID).dkr.ecr.$(AWS_REGION).amazonaws.com

REPOSITORY = https://github.com/marvelTracker/book-review

# Full image names
FULL_API_IMAGE_NAME = $(REGISTRY)/book-review-api
FULL_WEB_IMAGE_NAME = $(REGISTRY)/book-review-web

# Unique tag based on the current timestamp and commit SHA
IMAGE_TAG ?= $(shell git rev-parse --short HEAD)

# Default target
.PHONY: all
all: build-api build-web tag-api tag-web docker-login push-api push-web update-helm-values

# Build the book-review-api Docker image
.PHONY: build-api
build-api:
	docker build -f book-review-api/Dockerfile -t book-review-api:$(IMAGE_TAG) book-review-api

# Build the book-review-web Docker image
.PHONY: build-web
build-web:
	docker build -f book-review-ui/Dockerfile -t book-review-web:$(IMAGE_TAG) book-review-ui

# Tag the book-review-api Docker image
.PHONY: tag-api
tag-api:
	docker tag book-review-api:$(IMAGE_TAG) $(FULL_API_IMAGE_NAME):$(IMAGE_TAG)

# Tag the book-review-web Docker image
.PHONY: tag-web
tag-web:
	docker tag book-review-web:$(IMAGE_TAG) $(FULL_WEB_IMAGE_NAME):$(IMAGE_TAG)

# Docker login to ECR
.PHONY: docker-login
docker-login:
	aws ecr get-login-password --region $(AWS_REGION) | docker login --username AWS --password-stdin $(REGISTRY)

# Push the book-review-api Docker image to the registry
.PHONY: push-api
push-api:
	docker push $(FULL_API_IMAGE_NAME):$(IMAGE_TAG)

# Push the book-review-web Docker image to the registry
.PHONY: push-web
push-web:
	docker push $(FULL_WEB_IMAGE_NAME):$(IMAGE_TAG)

# Update Helm values file with new image tag
.PHONY: update-helm-values
update-helm-values:
	yq e '.api.image.tag = strenv(IMAGE_TAG)' -i deploy/values.yaml
	yq e '.web.image.tag = strenv(IMAGE_TAG)' -i deploy/values.yaml

# Configure Git
.PHONY: configure-git
configure-git:
	git config --global user.email "github-actions@github.com"
	git config --global user.name "GitHub Actions"

# Commit the updated Helm values file
.PHONY: commit-helm-values
commit-helm-values: configure-git
	@echo "GITHUB_TOKEN is: $(GITHUB_TOKEN)"
	git remote set-url origin https://$(GITHUB_TOKEN)@github.com/$(REPOSITORY).git
	git add deploy/values.yaml
	git commit -m "Update Helm values with new image tag $(IMAGE_TAG)"

# Push the commit to the repository
.PHONY: push-helm-values
push-helm-values:
	git push origin main

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
