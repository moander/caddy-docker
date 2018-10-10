#!/bin/sh

set -e

xhost=$CADDY_SINGLE_HOSTNAME
xemail=$CADDY_SINGLE_EMAIL
xpath=$CADDY_SINGLE_PROXY_PATH
xtarget=$CADDY_SINGLE_PROXY_TARGET

stage=
if [ "$CADDY_STAGE" != "production" ]; then
    stage="ca https://acme-staging-v02.api.letsencrypt.org/directory"
    echo "WARNING"
    echo "WARNING"
    echo "WARNING running in stage mode. set CADDY_STAGE=production to go live"
    echo "WARNING"
    echo "WARNING"
fi
env | grep CADDY

if [ -n "$xhost" ]; then
    echo transforming..
    set -x
    sed -e "s!TLS_STAGE!$stage!g" -e "s!HOSTNAME!$xhost!g" -e "s!EMAIL!$xemail!g" -e "s!PROXY_PATH!$xpath!g" -e "s!PROXY_TARGET!$xtarget!g" \
        -e "s!TLS_EXTRA_1!$CADDY_SINGLE_TLS_EXTRA_1!g" \
        -e "s!TLS_EXTRA_2!$CADDY_SINGLE_TLS_EXTRA_2!g" \
        -e "s!TLS_EXTRA_3!$CADDY_SINGLE_TLS_EXTRA_3!g" \
        -e "s!TLS_EXTRA_4!$CADDY_SINGLE_TLS_EXTRA_4!g" \
        -e "s!TLS_EXTRA_5!$CADDY_SINGLE_TLS_EXTRA_5!g" \
        -e "s!TLS_EXTRA_6!$CADDY_SINGLE_TLS_EXTRA_6!g" \
        -e "s!TLS_EXTRA_7!$CADDY_SINGLE_TLS_EXTRA_7!g" \
        -e "s!TLS_EXTRA_8!$CADDY_SINGLE_TLS_EXTRA_8!g" \
        -e "s!TLS_EXTRA_9!$CADDY_SINGLE_TLS_EXTRA_9!g" \
        -e "s!PROXY_EXTRA_1!$CADDY_SINGLE_PROXY_EXTRA_1!g" \
        -e "s!PROXY_EXTRA_2!$CADDY_SINGLE_PROXY_EXTRA_2!g" \
        -e "s!PROXY_EXTRA_3!$CADDY_SINGLE_PROXY_EXTRA_3!g" \
        -e "s!PROXY_EXTRA_4!$CADDY_SINGLE_PROXY_EXTRA_4!g" \
        -e "s!PROXY_EXTRA_5!$CADDY_SINGLE_PROXY_EXTRA_5!g" \
        -e "s!PROXY_EXTRA_6!$CADDY_SINGLE_PROXY_EXTRA_6!g" \
        -e "s!PROXY_EXTRA_7!$CADDY_SINGLE_PROXY_EXTRA_7!g" \
        -e "s!PROXY_EXTRA_8!$CADDY_SINGLE_PROXY_EXTRA_8!g" \
        -e "s!PROXY_EXTRA_9!$CADDY_SINGLE_PROXY_EXTRA_9!g" \
        -e "s!SERVER_EXTRA_1!$CADDY_SINGLE_SERVER_EXTRA_1!g" \
        -e "s!SERVER_EXTRA_2!$CADDY_SINGLE_SERVER_EXTRA_2!g" \
        -e "s!SERVER_EXTRA_3!$CADDY_SINGLE_SERVER_EXTRA_3!g" \
        -e "s!SERVER_EXTRA_4!$CADDY_SINGLE_SERVER_EXTRA_4!g" \
        -e "s!SERVER_EXTRA_5!$CADDY_SINGLE_SERVER_EXTRA_5!g" \
        -e "s!SERVER_EXTRA_6!$CADDY_SINGLE_SERVER_EXTRA_6!g" \
        -e "s!SERVER_EXTRA_7!$CADDY_SINGLE_SERVER_EXTRA_7!g" \
        -e "s!SERVER_EXTRA_8!$CADDY_SINGLE_SERVER_EXTRA_8!g" \
        -e "s!SERVER_EXTRA_9!$CADDY_SINGLE_SERVER_EXTRA_9!g" \
        /etc/Caddyfile.template > /etc/Caddyfile

    echo "Transformed config (v4)"
    cat /etc/Caddyfile
fi

