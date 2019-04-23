FROM golang:1.12.4 as builder

RUN CGO_ENABLED=0 \
    go get github.com/drone/drone-yaml

FROM alpine:3.9
COPY --from=builder /go/bin/* /usr/bin/

ENTRYPOINT ["drone-yaml"]
CMD ["--help"]
