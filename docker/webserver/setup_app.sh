#!/bin/sh
set -e
echo "=== SETUP APP SCRIPT STARTED ==="

chown -R app:app /home/app/oav_website
cd /home/app/oav_website

echo "Installing bundler..."
su - app -c "cd /home/app/oav_website && export PATH=\$PATH:/usr/local/bin && gem install bundler && bundle install --deployment"

mkdir -p /var/log/nginx
echo "=== SETUP APP SCRIPT FINISHED ==="