#!/bin/bash -e

SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
ROOT_DIR=$(cd ${SCRIPT_DIR}/..; pwd)

# source env to get platform specific docker compose command
. ${SCRIPT_DIR}/env.sh

# append extra to compose files list
DOCKER_COMPOSE="${DOCKER_COMPOSE} -f ${ROOT_DIR}/docker-compose.processing.yaml"

echo "Starting up containers: traefik, kafka, mongo, ethvm and server"
CMD="${DOCKER_COMPOSE} up -d --build traefik kafka mongo ethvm server"
echo "Executing: ${CMD}"
${CMD}

echo "Starting up container: ethereumj"
CMD="${DOCKER_COMPOSE} up -d ethereumj"
echo "Executing: ${CMD}"
${CMD}

echo "Waiting 15 secs to allow ethereumj to compile (but it will take a lot more than that...)"
sleep 15

echo "Starting up container: bolt"
CMD="${DOCKER_COMPOSE} up -d bolt"
echo "Executing: ${CMD}"
${CMD}
