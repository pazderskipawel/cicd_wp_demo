# Docker compose file with main application containers
## Wordpress app
- depends on database container to make sure tat database is active
- has access to wp-net network
## Database - MySQL
- has access to wp-net network
## Nginx - for reverse proxy
- depends on wordpress container to make sure it's running
- the only continer with open ports
- has access to wp-net network
