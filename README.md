# WordPress CI/CD Demo
This repository sets up `Docker` containers for WordPress and MySQL using `docker-compose`. 
Configuration is managed by CICD workflows (`Github Actions`) so everything is installed automatically. 
Repo uses `reusable workflows` so all actions are clear and reusable if needed. Everytihng runs on a self-hosted `Ubuntu` runner.
# Dcumantation
Documentation was moved to github pages https://pazderskipawel.github.io/cicd_wp_demo/
## Main pipeline status
[![CI](https://github.com/pazderskipawel/githubactions/actions/workflows/main_deploy.yml/badge.svg?branch=main)](https://github.com/pazderskipawel/githubactions/actions/workflows/main_deploy.yml?query=branch%3Amain)
# Disclaimer
Looking overall state of repo and number of commits I think this should be a `Dev` or at most `Staging` environment and after merging with `main` branch there should be a CD workflow which deploys everything, makes additional validation, waits for manual approval etc. to `Production` environment. For now I don't see any reasons to do multiple environments given I have one worker.
- ideally database shoud be on diffrent server or in cloud service
- ideally for SSL it should use let's encrypt or similar service instead of mkcert