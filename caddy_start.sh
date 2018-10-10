#!/bin/sh

set -e

/caddy_generate_single.sh
set -x
caddy -agree --conf /etc/Caddyfile --log stdout $CADDY_ARG_1 $CADDY_ARG_2 $CADDY_ARG_3 $CADDY_ARG_4 $CADDY_ARG_5 $CADDY_ARG_6 $CADDY_ARG_7 $CADDY_ARG_8 $CADDY_ARG_9

