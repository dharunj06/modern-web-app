.PHONY: help setup build run test deploy-staging deploy-prod clean lint format security-check monitoring-setup

# Default target
help:
	@echo "Available targets:"
	@echo "  setup           - Install dependencies and initialize project"
	@echo "  build           - Build the application"
	@echo "  run             - Run the application locally"
	@echo "  test            - Run all tests"
	@echo "  deploy-staging  - Deploy to staging environment"
	@echo "  deploy-prod     - Deploy to production environment"
	@echo "  clean           - Clean build artifacts"
	@echo "  lint            - Run linting"
	@echo "  format          - Format code"
	@echo "  security-check  - Run security scans"
	@echo "  monitoring-setup- Setup monitoring infrastructure"

# Project configuration
PROJECT_NAME := modern-web-app
VERSION := 2.0.0
DOCKER_REGISTRY := your-registry.com
DOCKER_TAG := $(DOCKER_REGISTRY)/$(PROJECT_NAME):$(VERSION)

# Setup project
setup:
	@echo "Setting up $(PROJECT_NAME)..."
	docker build -t $(DOCKER_TAG) .
	@if [ ! -f .env ]; then cp .env.example .env; echo "Created .env file"; fi
	@echo "Setup complete!"

# Build application
build:
	@echo "Building $(PROJECT_NAME)..."
	docker build -t $(DOCKER_TAG) .
	docker tag $(DOCKER_TAG) $(DOCKER_REGISTRY)/$(PROJECT_NAME):latest

# Run locally
run:
	@echo "Running $(PROJECT_NAME) locally..."
	docker run -p 8080:8080 --env-file .env $(DOCKER_TAG)

# Run tests
test:
	@echo "Running tests..."
	docker run --rm $(DOCKER_TAG) npm test
	@echo "Tests completed!"

# Deploy to staging
deploy-staging:
	@echo "Deploying to staging..."
	@if command -v kubectl >/dev/null 2>&1; then 		kubectl apply -f deploy/k8s/staging/; 		echo "Staging deployment complete!"; 	else 		echo "kubectl not found. Please install Kubernetes CLI."; 	fi

# Deploy to production
deploy-prod:
	@echo "Deploying to production..."
	@if command -v kubectl >/dev/null 2>&1; then 		kubectl apply -f deploy/k8s/production/; 		echo "Production deployment complete!"; 	else 		echo "kubectl not found. Please install Kubernetes CLI."; 	fi

# Clean artifacts
clean:
	@echo "Cleaning build artifacts..."
	docker system prune -f
	rm -rf node_modules/ dist/ build/

# Run linting
lint:
	@echo "Running linting..."
	docker run --rm $(DOCKER_TAG) npm run lint

# Format code
format:
	@echo "Formatting code..."
	docker run --rm $(DOCKER_TAG) npm run format

# Security checks
security-check:
	@echo "Running security scans..."
	@if command -v trivy >/dev/null 2>&1; then 		trivy image $(DOCKER_TAG); 	else 		echo "Trivy not found. Install for security scanning."; 	fi

# Setup monitoring
monitoring-setup:
	@echo "Setting up monitoring..."
	@if command -v helm >/dev/null 2>&1; then 		helm repo add prometheus-community https://prometheus-community.github.io/helm-charts; 		helm install monitoring prometheus-community/kube-prometheus-stack; 	else 		echo "Helm not found. Install for monitoring setup."; 	fi