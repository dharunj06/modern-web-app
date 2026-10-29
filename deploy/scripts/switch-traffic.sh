#!/usr/bin/env bash
set -euo pipefail

TARGET_COLOR="${1:-green}"
echo "Switching traffic for modern-web-app to: $TARGET_COLOR"

kubectl patch service modern-web-app-service -p "{\"spec\":{\"selector\":{\"version\":\"$TARGET_COLOR\"}}}"
echo "Traffic successfully switched to $TARGET_COLOR!"
