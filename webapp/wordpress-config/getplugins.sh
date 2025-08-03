#!/bin/bash
# This script retrieves the list of WordPress plugins installed in the WordPress container.
su deployuser -c "cd /var/www/html && exec wp plugin list "