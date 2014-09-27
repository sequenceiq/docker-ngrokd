#!/bin/bash

: ${CONTAINER:=trusting_bell}

docker cp $CONTAINER:/go/src/github.com/inconshreveable/ngrok/bin/darwin_amd64/ngrok . && mv ngrok ngrok_darwin
docker cp $CONTAINER:/go/src/github.com/inconshreveable/ngrok/bin/darwin_amd64/ngrokd . && mv ngrokd ngrokd_darwin
docker cp $CONTAINER:/go/src/github.com/inconshreveable/ngrok/bin/ngrok . && mv ngrok ngrok_liux
docker cp $CONTAINER:/go/src/github.com/inconshreveable/ngrok/bin/ngrokd . && mv ngrokd ngrokd_liux

UPLOADS="ngrok_darwin ngrokd_darwin ngrok_liux ngrokd_liux"
for file in $UPLOADS;
  do echo $file
  aws s3 cp $file s3://sequenceiq
done
