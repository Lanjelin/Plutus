FROM python:3.12.0a7-slim-bullseye

LABEL maintainer="lanjelin"

ENV SUBSTRING=8
ENV VERBOSE=0

COPY ["plutus.py", "plutus.txt", "/"]

RUN \
  echo "**** install packages ****" && \
  apt-get update && \
  apt-get install -y \
    git \
    gcc \
    libgmp3-dev && \
  pip install fastecdsa starkbank-ecdsa && \
  echo "**** cleanup ****" && \
  rm -rf \
    /tmp/* \
    /var/lib/apt/lists/* \
    /var/tmp/*

COPY entrypoint.sh /entrypoint.sh

VOLUME /plutus

ENTRYPOINT ["/bin/bash", "entrypoint.sh"]
