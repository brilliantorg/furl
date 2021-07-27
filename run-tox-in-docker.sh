#!/bin/bash

BASEDIR="$( cd -- "$(dirname "$0")" >/dev/null 2>&1 ; pwd -P )"

## https://www.terriblecode.com/blog/dockerizing-python-test-environments/

# Remove all cached pyc files, they don't play nice with the containers
find . -name "*.pyc" -delete
# Build the docker image
docker build -t furl-test-image .
# Run `tox` on the image
docker run -w /app -v "$BASEDIR":/app -t furl-test-image tox $@
