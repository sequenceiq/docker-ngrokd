This image aims to run a [selfhosted](https://github.com/inconshreveable/ngrok/blob/master/docs/SELFHOSTING.md)
ngrok daemon. For example when ngrok.com becomes unavailable, ot you want to use
custom domain name feature for free.

## running ngrok dameon

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

## client install

As you want to run `ngrokd` which is not distributed officially, we compiled
it for linux and osx, but as the [self hosting docs](https://gist.github.com/lyoshenka/002b7fbd801d0fd21f2f)
describes:

> Since the client and server executables are paired, you won't be able to use
  any other ngrok to connect to this ngrokd, and vice versa.

You also need a new client. For that reason the version numbers is set to `1.7.2`

### OS X
```
brew cask install https://raw.githubusercontent.com/sequenceiq/docker-ngrokd/master/ngrok.rb
```

### Linux

```
curl -o /usr/local/bin/ngrok https://s3-eu-west-1.amazonaws.com/sequenceiq/ngrok_linux
chmod +x /usr/local/bin/ngrok
```

## checking ngrok version

You should see the `1.7.2` on client side:
```
> ngrok version

1.7.2
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
