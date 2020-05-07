FROM node:13.14.0-alpine3.11
# 3dda3d2 on Feb 6, 2019
# 4ecff11 on Sep 26, 2019
RUN apk add --no-cache  gcc \
                        git \
                        musl-dev \
                        npm \
                        nodejs \
                        openssl \
                        python3 \
                        python3-dev \
                        py3-setuptools \
    &&\
    git clone https://github.com/johni0702/mumble-web /mumble-web &&\
    cd /mumble-web &&\
    git checkout 3dda3d2 &&\
    npm install &&\
    npm run build &&\
    git clone https://github.com/novnc/websockify.git /websockify &&\
    cd /websockify &&\
    git checkout 4ecff11 &&\
    pip3 install cython &&\
    python3 /websockify/setup.py install

COPY ./command.sh /command.sh

CMD sh /command.sh

EXPOSE 443

ENV MUMUR_HOST localhost
ENV MUMUR_PORT 64738
