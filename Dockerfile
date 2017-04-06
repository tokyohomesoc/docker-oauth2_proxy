FROM alpine:latest

MAINTAINER HomeSOC Tokyo <github@homesoc.tokyo>

ARG OAUTH2_PROXY_VERSION=2.1.linux-amd64.go1.6

RUN \
       apk add --no-cache --virtual .build-deps \
            bash \
            curl \
    && curl -fSL https://github.com/bitly/oauth2_proxy/releases/download/v2.1/oauth2_proxy-${OAUTH2_PROXY_VERSION}.tar.gz \
        -o oauth2_proxy.tar.gz \
    && tar xzvf oauth2_proxy.tar.gz \
    && mv oauth2_proxy-$OAUTH2_PROXY_VERSION/oauth2_proxy /bin/ \
    && chmod +x /bin/oauth2_proxy \
    && rm -r oauth2_proxy* \
    && apk del .build-deps

EXPOSE 4180

ENTRYPOINT ["oauth2_proxy"]
CMD ["oauth2_proxy"]