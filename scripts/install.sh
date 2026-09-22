#!/bin/bash

set -e

APP_DIR="/home/ec2-user/cron_app"
VENV="$APP_DIR/venv"

echo "=== Creating Python environment ==="

if [ ! -d "$VENV" ]; then
    /usr/bin/python3 -m venv "$VENV"
fi

echo "=== Installing Python dependencies ==="

"$VENV/bin/pip" install -r "$APP_DIR/requirements.txt"

echo "=== Creating log directory ==="

mkdir -p "$APP_DIR/logs"

echo "=== Installing cron configuration ==="

crontab "$APP_DIR/cron_jobs/crontab"

echo "=== Deployment completed ==="