#!/bin/bash -e

SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
ROOT_DIR=$(cd ${SCRIPT_DIR}/..; pwd)

# source env to get platform specific docker compose command
. ${SCRIPT_DIR}/env.sh

echo "Starting up containers: traefik, mongo, ethvm and server"
CMD="${DOCKER_COMPOSE} up -d --build traefik mongodb ethvm server"
echo "Executing: ${CMD}"
${CMD}

echo "Waiting 10 seconds to allow previous docker containers initialisation..."
sleep 10

echo "Initialisation of mongo"
CMD="${SCRIPT_DIR}/mongo/init.sh"
echo "Executing: ${CMD}"
${CMD}

echo "Importing bootstraped db to mongo..."
CMD="mongorestore --db ethvm_local --archive=\"ethvm_sample.archive\""
echo "Executing: ${CMD}"
${DOCKER_COMPOSE} exec mongodb sh -c "$CMD"

echo "Everything done! Wait for ethvm and server containers to be ready..."
