# WordPress CI/CD Demo
This repository sets up `Docker` containers for WordPress and MySQL using `docker-compose`. 
Configuration is managed by CICD workflows (`Github Actions`) so everything is installed automatically. 
Repo uses `reusable workflows` so all actions are clear and reusable if needed. Everytihng runs on a self-hosted `Ubuntu` runner.
## Overview
- Project Purpose: Dockerized WordPress + MySQL demo with CI/CD via GitHub Actions
- Runner Type: Self-hosted Ubuntu runner
- CICD is responsible for all configurations
- docker-compose statring containers with WordPress, MySQL, nginx reverse rpoxy for SSL
# Disclaimer
Looking overall state of repo and number of commits I think this should be a `Dev` or at most `Staging` environment and after merging with `main` branch there should be a CD workflow which deploys everything, makes additional validation, waits for manual approval etc. to `Production` environment. For now I don't see any reasons to do multiple environments given I have one worker.
- ideally database shoud be on diffrent server or in cloud service
- ideally for SSL it should use let's encrypt or similar service instead of mkcert
## Main pipeline status
[![CI](https://github.com/pazderskipawel/githubactions/actions/workflows/main_deploy.yml/badge.svg?branch=main)](https://github.com/pazderskipawel/githubactions/actions/workflows/main_deploy.yml?query=branch%3Amain)
## Getting Started
- Setup Self-Hosted Runner
  - To add runner: go to Repository settings > Actions > runners > add new self-hosted runner
  - If you want to autostart worker as a ([service](https://docs.github.com/en/actions/how-tos/managing-self-hosted-runners/configuring-the-self-hosted-runner-application-as-a-service)) use `sudo ./svc.sh install && sudo ./svh.sh start` instead of `.run.sh`
- After setting up runner everything should be installed automatically on it after triggering workflow
## CI/CD Workflows
### Summary of main workflow:
  1. Clean up last environment
      1. Clean up current docker containers and volumes related to project
  2. Prepare environment
      1. Check out code
      2. Check out current environment 
      3. Install docker and docker compose if its not installed 
  3. Run app 
      1. Start containers and mount eeded configurations
  4. Configure app
      1. Configures nginx reverse proxy 
      2. Configures wordpress (installs `WP-CLI`, finishes installation of WP )
  5. Validate app
      1. Check if containers are working
      2. Check if SSL certificates are valid
      2. Check if website is available
      4. Check if website is running
  6. Send notifications when build failed or was skipped
### Maintenance workflow - activated manually - allows to choose which jobs from below list should be started
  1. List installed wordpress plugins
  3. Configure wordpress
  4. Perform app validation
  5. Create backup
### Save Wordpress state (Back up Wordress), called manually or automatically when container stops
  1. Create directory for backup
  2. Copy WP files from container
  3. Create db dump from container
  1. Upload backup as `artifact`
  2. Delete backup directory
  3. Delete oldest artifacts 
### Restore Wordpress backup workflow 
  1. Find last successfull build id
  2. Download artifact from that run
  3. Upload restored backup to containers
  4. If any pf this steps fails, plain version of WordPress will be installed
## Secrets & Variables
- Repo uses github action variables and secrets, so no sensitive data shuold be leaked 
