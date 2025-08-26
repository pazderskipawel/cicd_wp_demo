#!/bin/bash

echo "create backup directory"
mkdir -p ./wp-backup

echo "copy wordpress to runner"
docker cp wordpress:/var/www/html/. ./wp-backup/
docker exec wordpress wp db export ./wp-backup/wordpress-database.sql --allow-root --path=/var/www/html

echo "save backup as artifact"
gh workflow run app_save_backup.yml

echo "Workflow should save backup as artifact in few seconds. Please check notifications to see if everything runs ok"