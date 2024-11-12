#!/usr/bin/env bash

set -euo pipefail

cd "$(dirname "${BASH_SOURCE[0]}")"

# Create new bin/ and cleanup on script exit
rm -rf bin/ && mkdir -p bin/
trap 'rm -rf bin/' EXIT

# Build Go binaries and copy to local context
../go/build-go.sh
cp ../go/bin/* bin/

# Build Docker images
docker build -t demo1/ubuntu:latest -f ubuntu/Dockerfile .
docker build -t demo1/alpine:latest -f alpine/Dockerfile .
docker build -t demo1/scratch:latest -f scratch/Dockerfile .
