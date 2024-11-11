#!/usr/bin/env bash

set -euo pipefail

pushd ../go

GOOS=linux GOARCH=amd64 go build -o bin/go-example ../go/cmd/example/main.go
GOOS=linux GOARCH=amd64 go build -o bin/go-example-network ../go/cmd/example-network/main.go

# TODO: Figure out how to avoid this
cp bin/* ../demo-1/ubuntu-minimal/
cp bin/* ../demo-1/scratch/

popd

docker build -t demo1-ubuntu:latest ubuntu-minimal/
docker build -t demo1-scratch:latest scratch/
# docker build -t demo1-scratch-ssl:latest .
