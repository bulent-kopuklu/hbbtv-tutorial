FROM debian:bullseye-slim


RUN apt-get update -qq \
    && apt-get upgrade -qq \
    && DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends --no-install-suggests \
        autoconf \
        binutils-dev \
        build-essential \
        ca-certificates \
        git \
        zlib1g-dev \
        python2.7 \
        python2.7-dev \
    && rm -rf /var/lib/apt/lists/* 


COPY opencaster-builder.sh /tmp/opencaster/build/

RUN /tmp/opencaster/build/opencaster-builder.sh

COPY opencaster-entrypoint.sh /

ENTRYPOINT ["/opencaster-entrypoint.sh"]

