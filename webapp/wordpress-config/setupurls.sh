#!/bin/bash
# Update WordPress site URL and home URL to allow HTTP access
cd /var/www/html &&
wp option update siteurl http://localhost --allow-root &&
wp option update home http://localhost --allow-root
