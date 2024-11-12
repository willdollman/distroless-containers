#!/usr/bin/env bash

set -euo pipefail

cd "$(dirname "${BASH_SOURCE[0]}")"

# Create new bin/ and cleanup on script exit
rm -rf bin/ && mkdir -p bin/
trap 'rm -rf bin/' EXIT

# Build Go binaries and copy to local context
../go/build-go.sh
cp ../go/bin/* bin/

# Build apko-alpine base image
pushd apko-alpine/
apko build config.yaml demo2/apko-alpine-base:latest image.tar
docker load --input image.tar
rm -rf image.tar sbom-*.json
popd

# Build apko-wolfi base image
pushd apko-wolfi/
apko build config.yaml demo2/apko-wolfi-base:latest image.tar
docker load --input image.tar
rm -rf image.tar sbom-*.json
popd

# Build Docker images
docker build --debug -t demo2/apko-alpine:latest -f apko-alpine/Dockerfile .
docker build --debug -t demo2/apko-wolfi:latest -f apko-wolfi/Dockerfile .
