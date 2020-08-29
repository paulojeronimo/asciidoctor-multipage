#!/usr/bin/env bash
set -eou pipefail

cd "$(dirname "$0")"
cp ../asciidoctor-multipage.rb .
source ./config.sh 2> /dev/null || source ./config.sample.sh
docker build \
  --build-arg asciidoctor_version=$ASCIIDOCTOR_VERSION \
  -t $DOCKER_IMAGE_NAME:$DOCKER_IMAGE_VERSION .
