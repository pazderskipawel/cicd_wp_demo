#!/bin/bash
# Finish installation of wordpress using cli
cd /var/www/html &&
exec wp core install \
  --url=${WORDPRESS_URL} \
  --title="${WORDPRESS_SITE_TITLE}" \
  --admin_user="${WORDPRESS_ADMIN_USER}" \
  --admin_password="${WORDPRESS_ADMIN_PASSWORD}" \
  --admin_email="${WORDPRESS_ADMIN_EMAIL}"
"