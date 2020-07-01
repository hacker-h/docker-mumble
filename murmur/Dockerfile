FROM alpine:3.12

ENV MURMUR_VERSION 1.3.0

RUN apk add --no-cache curl tar &&\
    curl -sSL https://github.com/mumble-voip/mumble/releases/download/${MURMUR_VERSION}/murmur-static_x86-${MURMUR_VERSION}.tar.bz2 | tar xj --strip 1 &&\
    mv murmur.x86 /usr/bin/murmur &&\
    apk del curl tar

CMD ["murmur", "-fg"]

EXPOSE 64738