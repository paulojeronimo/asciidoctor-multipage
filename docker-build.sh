#!/usr/bin/env bash
set -eou pipefail

cd "$(dirname "$0")"
if ! source docker-config.sh 2> /dev/null
then
  source docker-config.sample.sh
fi

docker build \
  --build-arg asciidoctor_version=$ASCIIDOCTOR_VERSION \
  -t $DOCKER_IMAGE_NAME:$DOCKER_IMAGE_VERSION \
  .
