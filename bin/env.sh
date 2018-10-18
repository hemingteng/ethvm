#!/bin/bash -e

SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
ROOT_DIR=$(cd ${SCRIPT_DIR}/..; pwd)

UNAME=$(uname)

if [[ "$UNAME" == 'Darwin' ]]; then
    # when running on mac we assume that dinghy will be used which means traefik is not required
    export DOCKER_COMPOSE="docker-compose"
else
    export DOCKER_COMPOSE="docker-compose -f ${ROOT_DIR}/docker-compose.yaml -f ${ROOT_DIR}/docker-compose.traefik.yaml"
fi
