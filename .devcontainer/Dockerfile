ARG BASE_IMAGE=mcr.microsoft.com/devcontainers/typescript-node:1-20-bullseye
FROM ${BASE_IMAGE}

# Install essential CLI build utilities and security scanners
USER root
RUN apt-get update && apt-get install -y --no-install-recommends \
    curl \
    wget \
    git \
    make \
    jq \
    unzip \
    ca-certificates \
    gnupg \
    lsb-release \
    && rm -rf /var/lib/apt/lists/*

# Install Trivy security scanner
RUN curl -sfL https://raw.githubusercontent.com/aquasecurity/trivy/main/contrib/install.sh | sh -s -- -b /usr/local/bin

# Switch back to non-root developer user
USER vscode
WORKDIR /workspace
