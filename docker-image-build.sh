#!/usr/bin/env bash
#
# This script can be used to build a Docker image to run Asciidoctor.
# Settings are configured on the file `docker-settings.sh`.
#
set +x

BASEDIR=`cd "$(dirname "$0")"; pwd`
cd "$BASEDIR"
source ./docker-settings.sh

docker build \
  --build-arg asciidoctor_version=$ASCIIDOCTOR_VERSION \
  -t $DOCKER_IMAGE_NAME:$DOCKER_IMAGE_VERSION \
  .
