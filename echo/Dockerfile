FROM debian:stretch

RUN apt-get update \
    && apt-get install -y --no-install-recommends ca-certificates wget \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /usr/local/bin/
COPY echo/app ./

ENTRYPOINT ["/usr/local/bin/app"]
