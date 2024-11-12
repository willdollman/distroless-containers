FROM scratch

COPY bin/go-example /usr/local/bin/
COPY bin/go-example-network /usr/local/bin/

# TODO: This doesn't seem to be sufficent to make the TLS connection work
COPY --from=demo1-ubuntu:latest /usr/share/ca-certificates /usr/share/ca-certificates

CMD ["/usr/local/bin/go-example"]
