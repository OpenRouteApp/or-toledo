#!/bin/bash

SERVICE=$1
LANG=$2

# Setup command for executing buf utilitites within the docker container
DOCKER_IMAGE="proto-builder"
DOCKERFILE_PATH="./docker/Dockerfile.proto-builder"
VOLUME_MOUNT="-v $(pwd):/build"
WORKDIR="-w /build"
RUN_BUF_DOCKER="docker run --rm ${VOLUME_MOUNT} ${WORKDIR} ${DOCKER_IMAGE}"

docker build . -f ${DOCKERFILE_PATH} -t ${DOCKER_IMAGE}

${RUN_BUF_DOCKER} lint

${RUN_BUF_DOCKER} breaking --against ".git#subdir=proto"

BUF_TEMPLATE="templates/buf.gen.${LANG}.yaml"

${RUN_BUF_DOCKER} generate              \
    --template ${BUF_TEMPLATE}          \
    --path "proto/openroute/${SERVICE}" \
    --output "gen/${SERVICE}/${LANG}"




