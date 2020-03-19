#!/usr/bin/env bash
#
# This script can be used to show with Asciidoctor
# is running on the docker container.
#
set +x

BASEDIR=`cd "$(dirname "$0")"; pwd`
cd "$BASEDIR"
source ./docker-settings.sh

docker run -it $DOCKER_IMAGE_NAME:$DOCKER_IMAGE_VERSION asciidoctor -v
