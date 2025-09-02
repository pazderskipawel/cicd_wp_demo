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
- Main workflow - sets up envirnmnt, starts and configures app containers
- Backup save/restore workflows - allow to save wordpress state without any more configuration
- Troubleshooting workflow - enabled manually, created to help with any app troubleshooting
## Secrets & Variables
- Repo uses github action variables and secrets, so no sensitive data shuold be leaked 
