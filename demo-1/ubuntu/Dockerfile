FROM ubuntu:latest

RUN apt-get update && apt-get install -y ca-certificates && rm -rf /var/lib/apt/lists/*

COPY bin/go-example /usr/local/bin/
COPY bin/go-example-network /usr/local/bin/

CMD ["/usr/local/bin/go-example"]
