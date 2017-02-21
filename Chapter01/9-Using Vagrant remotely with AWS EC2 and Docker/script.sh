#!/bin/sh
# script name: script.sh

# install Docker
curl -sSL https://get.docker.com/ | sh
# add ubuntu user to docker group
sudo usermod -aG docker ubuntu
# install docker-compose
curl -L https://github.com/docker/compose/releases/download/1.8.0/docker-compose-`uname -s`-`uname -m` > /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
# execute the docker compose file
cd /vagrant
docker-compose up -d
