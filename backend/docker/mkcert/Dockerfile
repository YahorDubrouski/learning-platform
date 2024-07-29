FROM golang:latest

RUN go install filippo.io/mkcert@latest \
    && apt-get update \
    && apt-get install -y libnss3-tools \
    && /go/bin/mkcert -install

WORKDIR /app
