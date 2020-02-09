FROM debian:testing-20200130-slim
ARG STACK_VERSION=2.1.3
RUN \
  apt-get update && \
  apt-get install --assume-yes \
    gcc \
    git \
    libgmp-dev \
    make \
    netbase \
    wget \
    xz-utils \
    zlib1g-dev && \
  wget \
    --no-verbose \
    --output-document stack.tgz \
    "https://github.com/commercialhaskell/stack/releases/download/v$STACK_VERSION/stack-$STACK_VERSION-linux-x86_64.tar.gz" && \
  tar \
    --extract \
    --file stack.tgz \
    --strip-components 1 \
    --wildcards '*/stack' && \
  rm stack.tgz && \
  mv stack /usr/local/bin && \
  adduser --disabled-password --gecos '' stack
USER stack
WORKDIR /home/stack
