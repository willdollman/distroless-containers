#!/usr/bin/env bash

set -euo pipefail

cd "$(dirname "${BASH_SOURCE[0]}")"

GOOS=linux GOARCH=amd64 go build -o bin/go-example ../go/cmd/example/main.go
GOOS=linux GOARCH=amd64 go build -o bin/go-example-network ../go/cmd/example-network/main.go
