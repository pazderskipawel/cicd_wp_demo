# WordPress CI/CD Demo
This repository sets up `Docker` containers for WordPress and MySQL using `docker-compose`. 
Configuration is managed by CICD workflows (`Github Actions`) so everything is installed automatically. 
Repo uses `reusable workflows` so all actions are clear and reusable if needed. Everytihng runs on a self-hosted `Ubuntu` runner.
# Dcumantation
Documentation was moved to github pages https://pazderskipawel.github.io/cicd_wp_demo/
## Main pipeline status
[![CI](https://github.com/pazderskipawel/githubactions/actions/workflows/main_deploy.yml/badge.svg?branch=main)](https://github.com/pazderskipawel/githubactions/actions/workflows/main_deploy.yml?query=branch%3Amain)