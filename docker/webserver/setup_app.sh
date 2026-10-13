#!/bin/sh
echo "=== SETUP APP SCRIPT STARTED ==="

chown -R app:app /home/app/oav_website || true
cd /home/app/oav_website || true

echo "Configuring environment..."
su - app -c "cd /home/app/oav_website && gem install bundler || true"

mkdir -p /var/log/nginx
echo "=== SETUP APP SCRIPT FINISHED ==="