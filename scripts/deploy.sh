#!/bin/bash

APP_DIR="/home/ec2-user/app"
JAR_NAME=$(ls $APP_DIR/*.jar | tail -n1)

echo "Stopping running app (if any)..."
pkill -f 'java -jar' || true

echo "Starting $JAR_NAME..."
nohup java -jar $JAR_NAME > $APP_DIR/app.log 2>&1 &
