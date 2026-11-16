#!/usr/bin/env bash
set -euo pipefail

APP_DIR="/home/ec2-user/app"
# CodeDeploy preserves the build/libs path from buildspec.yml.
JAR="$(find "$APP_DIR/build/libs" -maxdepth 1 -type f -name '*.jar' ! -name '*-plain.jar' -print -quit)"
if [[ -z "$JAR" ]]; then
  echo "No executable application JAR found under $APP_DIR/build/libs" >&2
  exit 1
fi

# Do not kill arbitrary java processes on this host. Prefer a dedicated service.
if ! command -v systemctl >/dev/null || ! systemctl cat spring-boot-app.service >/dev/null 2>&1; then
  echo "spring-boot-app.service is not configured; refusing unverified restart" >&2
  exit 1
fi
sudo systemctl restart spring-boot-app.service
sudo systemctl is-active --quiet spring-boot-app.service
echo "Deployed JAR: $JAR"
