FROM docker:stable-dind

RUN apk add --update --no-cache git curl vim nano python3\
    && pip3 install --upgrade pip \
    && pip3 install docker-compose \
    && docker-compose --version

COPY docker-compose.yml docker-compose.yml
COPY Dockerfile Dockerfile
RUN  mkdir config-dir data
COPY cisco.conf config-dir/cisco.conf

