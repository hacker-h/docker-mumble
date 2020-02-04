#!/bin/bash
if [[ -z ${MUMUR_HOST+x} ]]
then
    echo "'MUMUR_HOST' is not set"
    exit 1
fi

if [[ -z ${MUMUR_PORT+x} ]]
then
    echo "'MUMUR_PORT' is not set"
    exit 1
fi

if [[ ! -d /certs ]]
then
    echo "'/certs' volume is missing"
    exit 1
fi

if [[ ! -f /certs/cert.key ]] || [[ ! -f /certs/cert.crt ]]
then
    echo "certs will be initially generated.."
    openssl req -x509 -nodes -newkey rsa:2048 \
    -keyout /certs/cert.key -out /certs/cert.crt \
    -subj "/C=/ST=/L=/O=/OU=/CN="
fi

echo "starting server.."
websockify --cert=/certs/cert.crt --key=/certs/cert.key --ssl-target --web=/mumble-web/dist 443 "${MUMUR_HOST}":${MUMUR_PORT}
