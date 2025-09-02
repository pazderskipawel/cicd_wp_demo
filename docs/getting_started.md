---
layout: default
title: Getting started
category: 1
place: 2 
rank: 2
---

## Getting Started
- Setup Self-Hosted Runner
  - To add runner: go to Repository settings > Actions > runners > add new self-hosted runner
  - If you want to autostart worker as a ([service](https://docs.github.com/en/actions/how-tos/managing-self-hosted-runners/configuring-the-self-hosted-runner-application-as-a-service)) use `sudo ./svc.sh install && sudo ./svh.sh start` instead of `.run.sh`
- After setting up runner everything should be installed automatically on it after triggering workflow