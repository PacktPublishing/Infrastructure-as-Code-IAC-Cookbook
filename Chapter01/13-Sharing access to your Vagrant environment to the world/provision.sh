#!/usr/bin/env bash

sudo yum install -q -y epel-release
sudo yum install -q -y node npm unzip
curl -L https://ghost.org/zip/ghost-latest.zip -o ghost.zip
sudo unzip -uo ghost.zip -d /srv/blog/
cd /srv/blog && sudo npm install --production
# cd /srv/blog && sudo npm start --production
