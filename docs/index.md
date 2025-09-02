---
layout: default
title: Home
category: Home
place: 1
---

# WordPress CI/CD Demo
This repository sets up `Docker` containers for WordPress and MySQL using `docker-compose`. 
Configuration is managed by CICD workflows (`Github Actions`) so everything is installed automatically. 
Repo uses `reusable workflows` so all actions are clear and reusable if needed. Everytihng runs on a self-hosted `Ubuntu` runner.

## Overview
- Project Purpose: Dockerized WordPress + MySQL demo with CI/CD via GitHub Actions
- Runner Type: Self-hosted Ubuntu runner
- CICD is responsible for all configurations
- docker-compose statring containers with WordPress, MySQL, nginx reverse rpoxy for SSL

## CI/CD Workflows
- [Main workflow](/workflows/main-workflow.md) - sets up envirnmnt, starts and configures app containers 
- [Backup save/restore workflows](/workflows/backup-workflows.md) - allow to save wordpress state without any more configuration
- [Troubleshooting workflow](/workflows/troubleshooting-workflow.md) - enabled manually, created to help with any app troubleshooting

## Secrets & Variables
- Repo uses github action variables and secrets, so no sensitive data shuold be leaked 
