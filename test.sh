#!/bin/bash

cd "$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

set -e
docker build -t caddy:test .


# Single path test
docker run -it \
 -e CADDY_STAGE=production \
 -e CADDY_SINGLE_HOSTNAME=hostname.example.com \
 -e CADDY_SINGLE_EMAIL="m@qse.no" \
 -e CADDY_SINGLE_PROXY_PATH="/" \
 -e CADDY_SINGLE_PROXY_TARGET="127.0.0.1:60124" \
  caddy:test /caddy_generate_single.sh

# Multi path test (was failing)
docker run -it \
 -e CADDY_SINGLE_HOSTNAME=hostname.example.com \
 -e CADDY_SINGLE_EMAIL="m@qse.no" \
 -e CADDY_SINGLE_PROXY_PATH="/jau/test" \
 -e CADDY_SINGLE_PROXY_TARGET="127.0.0.1:60124" \
 -e CADDY_SINGLE_PROXY_EXTRA_1=websocket \
  caddy:test
