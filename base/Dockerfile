FROM debian:9

ARG DEBIAN_FRONTEND=noninteractive

RUN \
    apt-get update && \
    apt-get install -y --no-install-recommends \
      apt-utils \
      gnupg2 \
      dirmngr \
      hopenpgp-tools \
      sudo \
      software-properties-common \
      build-essential \
      git \
      vim \
      zsh \
      curl \
      wget \
      tar \
      zip \
      unzip \
      bzip2 \
      procps \
      openssh-client \
      mosh \
      rsync \
      locales \
      apt-transport-https \
      ca-certificates \
      && rm -rf /var/lib/apt/lists/*
      
# Debian locale needs to be fixed because not set in docker
# http://stackoverflow.com/a/38553499
RUN sed -i -e 's/# en_US.UTF-8 UTF-8/en_US.UTF-8 UTF-8/' /etc/locale.gen && \
    echo 'LANG="en_US.UTF-8"'>/etc/default/locale && \
    dpkg-reconfigure --frontend=noninteractive locales && \
    update-locale LANG=en_US.UTF-8

ENV LANG en_US.UTF-8
