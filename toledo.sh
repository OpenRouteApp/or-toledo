#!/bin/bash

SERVICE=$1
LANG=$2

# Setup command for executing buf utilitites within the docker container
DOCKER_IMAGE="bufbuild/buf:latest"
VOLUME_MOUNT="-v $(PWD):/build"
WORKDIR="-w /build"
RUN_BUF_DOCKER="docker run --rm ${VOLUME_MOUNT} ${WORKDIR} ${DOCKER_IMAGE}"

${RUN_BUF_DOCKER} lint
${RUN_BUF_DOCKER} breaking

BUF_TEMPLATE="templates/buf.gen.${LANG}.yaml"
${RUN_BUF_DOCKER} generate      \
    --template ${TEMPLATE}      \
    --path "proto/${SERVICE}"   \
    --exclude-imports
