#!/bin/bash -e

SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
ROOT_DIR=$(cd ${SCRIPT_DIR}/..; pwd)

# source env to get platform specific docker compose command
. ${SCRIPT_DIR}/env.sh

echo "Starting up containers: traefik, kafka, mongo, ethvm and server"
CMD="${DOCKER_COMPOSE} up -d --build"
echo "Executing: ${CMD}"
${CMD}

echo "Waiting 15 seconds to allow previous docker containers initialisation..."
sleep 15

echo "Creating kafka topics..."
CMD="${SCRIPT_DIR}/kafka/init.sh"
echo "Executing: ${CMD}"
${CMD}

echo "Initialisation of mongo"
CMD="${SCRIPT_DIR}/mongo/init.sh"
echo "Executing: ${CMD}"
${CMD}
