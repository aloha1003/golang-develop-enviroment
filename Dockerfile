# Production environment (alias: base)
FROM golang:alpine as base
RUN apk update && apk upgrade && \
apk add --no-cache bash git openssh
WORKDIR /go/src

# Development environment
# Unfortunately, linux alpine doesn't have fswatch package by default, so we will need to download source code and make it by outselves.
FROM alpine as dev
COPY --from=base  /go/src /go/src
WORKDIR /go/src
