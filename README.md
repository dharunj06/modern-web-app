# modern-web-app

## Overview
This project was generated using the DevOps Project Generator v2.0.0. It includes a comprehensive set of DevOps configurations and infrastructure as code templates.

## Architecture
- **Application**: Sample web application with health checks and metrics
- **Infrastructure**: AWS-VPC-EKS
- **Deployment**: BLUE-GREEN
- **CI/CD**: GITHUB-ACTIONS
- **Observability**: PROMETHEUS-GRAFANA
- **Security**: NIST-CSF

## Prerequisites
- Docker
- Kubernetes CLI (kubectl)
- Terraform (if using infrastructure as code)
- Make (for build automation)

## Quick Start

```bash
# Setup the project
make setup

# Run locally
make run

# Deploy to staging
make deploy-staging

# Run tests
make test
```

## Project Structure
```
modern-web-app/
├── app/                    # Application source code
├── ci/                     # CI/CD pipeline configurations
├── infra/                  # Infrastructure as code
├── deploy/                 # Deployment configurations
├── monitoring/             # Monitoring and alerting
├── security/               # Security policies and configurations
├── scripts/                # Utility scripts
├── docs/                   # Documentation
└── tests/                  # Test files
```

## Environment Variables
Create a `.env` file based on `.env.example`:

```bash
cp .env.example .env
```

## Monitoring
The application exposes metrics at `/metrics` and health checks at `/health`.

## Security
This project implements security best practices including:
- Network security policies
- Security monitoring
- Data protection

## Support
For issues and questions, please refer to the documentation in the `docs/` directory.

---
*Generated on 2026-10-29T05:46:15.360Z by DevOps Project Generator v2.0.0*