#!/usr/bin/env bash
# file: ./scripts/install_docker.sh
curl -sSL https://get.docker.com/ | sh
sudo systemctl enable docker
sudo systemctl start docker
