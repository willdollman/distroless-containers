# Containers for BSides London 2024 talk

## Setup

Requirements:
- Docker
- [apko](https://github.com/chainguard-dev/apko?tab=readme-ov-file#quickstart)

## Demo 1

Containers that run a very simple Go binary that has no external dependencies.

```
# Build images
$ ./demo-1/build.sh

[...]

# List images
$ docker images | grep 'demo1/'
demo1/ubuntu     latest    da966b0f719f    1 minute ago    105MB
demo1/alpine     latest    135f150188d3    1 minute ago    10.2MB
demo1/scratch    latest    4cfd18d35a43    1 minute ago    1.4MB

# Run images
$ docker run --rm -it demo1/ubuntu
Hello World!
```

## Demo 2

Containers that run a Go binary which makes HTTPS connections - requires CA certificates to be present. Uses distroless base images built with `apko`.

```
# Build images
$ ./demo-2/build.sh

[...]

# List images
$ docker images | grep 'demo2/'
demo2/apko-wolfi          latest          de51e35c849f    1 minute ago    5.62MB
demo2/apko-alpine         latest          bbb3b56912da    1 minute ago    5.61MB
demo2/apko-wolfi-base     latest-amd64    d21cc58e8c4d    1 minute ago    254kB
demo2/apko-alpine-base    latest-amd64    50f3404e545e    1 minute ago    243kB

# Run images
$ docker run --rm -it demo2/apko-wolfi
Page title: Example Domain
```
