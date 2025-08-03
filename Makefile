# GoHub Makefile

# ------------------------------------------------------------------------------
# Variables
# ------------------------------------------------------------------------------

BINARY_NAME := gohub

# Go variables
GO_CMD := go
GO_BUILD := $(GO_CMD) build
GO_RUN := $(GO_CMD) run
GO_CLEAN := $(GO_CMD) clean
GO_TIDY := $(GO_CMD) mod tidy

# Docker variables
DOCKER_COMPOSE := docker-compose

# Air for live reloading
AIR := air

# ------------------------------------------------------------------------------
# Targets
# ------------------------------------------------------------------------------

.PHONY: all build clean deps dev run serve docker-up docker-down docker-build

all: build

# Build the application
build:
	@echo "Building $(BINARY_NAME)..."
	@$(GO_BUILD) -o bin/$(BINARY_NAME) main.go

# Clean up build artifacts
clean:
	@echo "Cleaning..."
	@$(GO_CLEAN)
	@rm -f bin/$(BINARY_NAME)

# Install dependencies
deps:
	@echo "Installing dependencies..."
	@$(GO_TIDY)

# Run the application in development mode with live reloading
dev:
	@echo "Starting $(BINARY_NAME) in development mode..."
	@$(AIR)

# Run the application
run:
	@echo "Running $(BINARY_NAME)..."
	@$(GO_RUN) main.go

# Run the application with the serve command
serve:
	@echo "Serving $(BINARY_NAME)..."
	@$(GO_RUN) main.go serve

# Start the application with Docker
docker-up:
	@echo "Starting application with Docker..."
	@$(DOCKER_COMPOSE) up -d

# Stop the application with Docker
docker-down:
	@echo "Stopping application with Docker..."
	@$(DOCKER_COMPOSE) down

# Build the Docker image
docker-build:
	@echo "Building Docker image..."
	@$(DOCKER_COMPOSE) build
