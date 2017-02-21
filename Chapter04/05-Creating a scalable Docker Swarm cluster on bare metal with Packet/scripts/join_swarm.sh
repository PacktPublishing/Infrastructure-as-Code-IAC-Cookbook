#!/usr/bin/env bash
# file: scripts/join_swarm.sh
MASTER=$1
SWARM_TOKEN=$(cat worker.token)
echo ${SWARM_TOKEN}
docker swarm join --token ${SWARM_TOKEN} ${MASTER}:2377
