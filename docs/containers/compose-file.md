---
layout: default
title: Docker compose
category: Containers
place: 1
---

# Docker compose file with main application containers

## Wordpress app
- depends on database container to make sure tat database is active
- has access to wp-net network

## Database - MySQL
- has access to wp-net network
