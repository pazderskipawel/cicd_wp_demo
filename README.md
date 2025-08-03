# WordPress CI/CD Demo
This repository sets up Docker containers for WordPress and MySQL using `docker-compose`. Configuration is managed via Bash scripts, allowing reuse inside containers. The CI/CD pipeline is powered by GitHub Actions and runs on a self-hosted Ubuntu runner.
## Overview
- Project Purpose: Dockerized WordPress + MySQL with CI/CD via GitHub Actions
- Runner Type: Self-hosted Ubuntu runner
- Main Features: Modular workflows, .env generation, Discord notifications
## Main pipeline status
[![CI](https://github.com/pazderskipawel/githubactions/actions/workflows/deploy_everything.yml/badge.svg?branch=main)](https://github.com/pazderskipawel/githubactions/actions/workflows/deploy_everything.yml?query=branch%3Amain)
## Getting Started
- Setup Self-Hosted Runner
  - to add runner: go to Repository settings > Actions > runners > add new self-hosted runner
  - if you want to autostart worker use `sudo ./svc.sh` instead of `.run.sh`, it will work as service ([source](https://docs.github.com/en/actions/how-tos/managing-self-hosted-runners/configuring-the-self-hosted-runner-application-as-a-service))
- After setting up runner everything should be installed automatically on it after triggering workflow
## CI/CD Workflows
- repo uses "nested" workflows so everything should be clear and reusable if needed
- summary of main workflow:
  #### 1. prepare environment
    1. check out current environment 
          1. checkout code, 
          2. install docker and docker compose if its not installed 
    2. clean up current docker resources related to project
    3. prepare environment for app 
          1. creates `.env` file
          2. creates directories that will be mounted to images 
          3. creates https certificates using mkcert
  #### 2. validate app
    1. performs dry run for docker compose 
  #### 3. run app 
    1. start containers
    2. copy configurations to containers
    3. completes setting up of wordpress container 
        1. installs wp-cli 
        2. completes wordpress installation
## Secrets & Variables
- repo uses github action variables and secrets, so no sensitive data shuold be leaked 
## Maintenance & Cleanup
- Some actions can be triggered manually, to speed up some processes and to help troubleshoot the app
- Workflow failure notifications - in case any step of workflow fails it should send a notification to discord (currently)
