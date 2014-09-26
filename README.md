This image aims to run a [selfhosted](https://github.com/inconshreveable/ngrok/blob/master/docs/SELFHOSTING.md)
ngrok daemon. For example when ngrok.com becomes unavailable, ot you want to use
custom domain name feature for free.

## running

```
docker run -d --name ngrokd \
  -p 4480:4480 \
  -p 4444:4444 \
  -p 4443:4443 \
  sequenceiq/ngrokd \
    -httpAddr=:4480 \
    -httpsAddr=:4444 \
    -domain=ngrok.sequenceiq.com
```

## client config

```
cat > ~/.ngrok <<EOF
server_addr: server.ngrok.sequenceiq.com:4443
trust_host_root_certs: false
EOF
```

## start client

as ususal

```
ngrok <port>
```

## dns config

You will need an `A record` suche as:

```
*.ngrok.sequenceiq.com 54.72.21.93
```
