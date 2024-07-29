#!/bin/bash

set -e

DOMAIN_NAME=${1:-learning-platform.com}
CERT_DIR=${2:-/docker/nginx/certs}

# Create directory for certificates if it does not exist
mkdir -p "$CERT_DIR"

docker build -t mkcert-gen docker/mkcert

docker run --rm -v "$(pwd)/docker/nginx/certs":/certs mkcert-gen /bin/bash -c "\
    /go/bin/mkcert -cert-file /certs/server.crt -key-file /certs/server.key $DOMAIN_NAME"

echo "Certificates generated at $CERT_DIR for $DOMAIN_NAME"
