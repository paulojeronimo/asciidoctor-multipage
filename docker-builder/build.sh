#!/usr/bin/env bash
#
# This script can run a Asciidoctor Docker container.
# Settings are configured on the file `docker-settings.sh`.
#
# [NOTE]
# ====
# This builder is separeted from the main project in
# its own directory. So you can easily copy its content
# to another project containing Asciidoc files to build
# with this multipage_html5 backend.
#
# So, for example, if you have a multipage document
# called `index.adoc` in a directory `my-multipage-doc`
# you can do the following commands to build it:
#
# ----
# cd my-multipage-doc
# cp -LR <asciidoctor-multipage-dir>/docker-builder .
# ./docker-builder/build.sh index.adoc
# ----
# ====
#
set +x
set -e

THISDIR=`cd "$(dirname "$0")"; pwd`
BASEDIR=`cd "$THISDIR"/..; pwd`
source "$THISDIR"/docker-settings.sh

cd "$BASEDIR"
source ./build.conf.sh 2> /dev/null || true

BUILD_DIR=${BUILD_DIR:-test}
DOC=${DOC:-"test/sample.adoc"}

docker run --rm -it -v "$PWD":/documents/ $DOCKER_IMAGE_NAME:$DOCKER_IMAGE_VERSION \
  asciidoctor \
    -a linkcss \
    -D "$BUILD_DIR" \
    -r ./"$(basename "$THISDIR")"/asciidoctor-multipage.rb \
    -b multipage_html5 \
    "$DOC"
