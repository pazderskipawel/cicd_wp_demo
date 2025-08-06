# WordPress CI/CD Demo
This repository sets up Docker containers for WordPress and MySQL using `docker-compose`. Configuration is managed by CICD workflows so everything should be installed automatically. Repo uses "nested" workflows so all actions should be clear and reusable if needed. The CI/CD pipeline is powered by GitHub Actions and runs on a self-hosted Ubuntu runner.
## Overview
- Project Purpose: Dockerized WordPress + MySQL with CI/CD via GitHub Actions
- Runner Type: Self-hosted Ubuntu runner
- Main Features: Modular workflows, .env generation, Discord notifications
## Main pipeline status
[![CI](https://github.com/pazderskipawel/githubactions/actions/workflows/deploy_everything.yml/badge.svg?branch=main)](https://github.com/pazderskipawel/githubactions/actions/workflows/deploy_everything.yml?query=branch%3Amain)
## Getting Started
- Setup Self-Hosted Runner
  - To add runner: go to Repository settings > Actions > runners > add new self-hosted runner
  - If you want to autostart worker use `sudo ./svc.sh` instead of `.run.sh`, it will work as service ([source](https://docs.github.com/en/actions/how-tos/managing-self-hosted-runners/configuring-the-self-hosted-runner-application-as-a-service))
- After setting up runner everything should be installed automatically on it after triggering workflow
## CI/CD Workflows
### Summary of main workflow:
  1. Clean up last environment
      1. Clean up current docker resources related to project
  2. Prepare environment
      1. Check out current environment 
      2. Install docker and docker compose if its not installed 
      4. Creates directories that will be mounted to images 
      5. Creates https certificates using mkcert
  3. Validate app
      1. Performs dry run for docker compose 
  4. Run app 
      1. Start containers and mount eeded configurations
      2. Copy configurations to containers
  5. Send notifications when build failed or was skipped
### Maintenance workflow - activated manually, allows to choose which jobs from below list should be started
  1. List installed wordpress plugins
  2. List repository secrets
  3. Docker images cleanup
  4. Configure wordpress
  5. Perform app validation
  
## Secrets & Variables
- Repo uses github action variables and secrets, so no sensitive data shuold be leaked 
