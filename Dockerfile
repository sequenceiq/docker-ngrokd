FROM debian:jessie

#COPY ngrokd_linux /ngrokd
ADD https://s3-eu-west-1.amazonaws.com/sequenceiq/ngrokd_linux /ngrokd
RUN chmod +x /ngrokd

ENTRYPOINT ["/ngrokd"]
