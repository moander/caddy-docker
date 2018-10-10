# caddy

Caddy for Kubernetes.


```sh
docker run -it \
 -e CADDY_STAGE=production \
 -e CADDY_SINGLE_HOSTNAME=hostname.example.com \
 -e CADDY_SINGLE_EMAIL="tls@example.com" \
 -e CADDY_SINGLE_PROXY_PATH="/" \
 -e CADDY_SINGLE_PROXY_TARGET="127.0.0.1:60124" \
  moander/caddy
```
