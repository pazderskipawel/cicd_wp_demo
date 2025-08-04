#!/bin/bash
# This script retrieves the list of WordPress plugins installed in the WordPress container.
cd /var/www/html &&
exec wp plugin list