FROM debian:9

LABEL version "1.0"
LABEL maintainer "wsargent"
LABEL name "docker-scala-sbt"

# Fix sh
RUN rm /bin/sh && ln -s /bin/bash /bin/sh

ARG DEBIAN_FRONTEND=noninteractive
RUN \
    apt-get update && apt-get install -y --no-install-recommends \
      sudo \
      software-properties-common \
      build-essential \
      apt-utils \
      git \
      vim \
      zsh \
      curl \
      wget \
      tar \
      zip \
      bzip2 \
      unzip \
      gnupg2 \
      dirmngr \
      locales \
      apt-transport-https \
      hopenpgp-tools \
      && \
    rm -rf /var/lib/apt/lists/*

# Install Java and dependencies
WORKDIR /tmp
RUN \
    apt-key adv --keyserver keyserver.ubuntu.com --recv-keys C2518248EEA14886 && \
    add-apt-repository -y ppa:webupd8team/java && \
    apt-get update && \
    echo oracle-java8-installer shared/accepted-oracle-license-v1-1 select true | debconf-set-selections && \
    apt-get install -y --allow-unauthenticated oracle-java8-installer && \
    rm -rf /var/lib/apt/lists/* && \
    rm -rf /var/cache/oracle-jdk8-installer

# Create editor userspace
RUN \
    groupadd wsargent && \
    useradd wsargent -m -g wsargent -s /bin/zsh && \
    passwd -d -u wsargent && \
    touch /etc/sudoers.d/wsargent && \
    echo "play ALL=(ALL) NOPASSWD:ALL" > /etc/sudoers.d/wsargent && \
    chmod 0440 /etc/sudoers.d/wsargent

# Run unlimited security policy
RUN \
    curl -v -j -k -L -H "Cookie:oraclelicense=accept-securebackup-cookie" http://download.oracle.com/otn-pub/java/jce/8/jce_policy-8.zip  > jce_policy-8.zip && \
    unzip jce_policy-8.zip && \
    cp UnlimitedJCEPolicyJDK8/* /usr/lib/jvm/java-8-oracle/jre/lib/security/ && \
    rm -rf jce_policy-8.zip UnlimitedJCEPolicyJDK8

# Install the keyservers CA file:
RUN curl -s "https://sks-keyservers.net/sks-keyservers.netCA.pem" -o /etc/sks-keyservers.netCA.pem

# Install sbt
RUN \
    echo "deb https://dl.bintray.com/sbt/debian /" | sudo tee -a /etc/apt/sources.list.d/sbt.list && \
    sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 2EE0EA64E40A89B84B2DF73499E82A75642AC823 && \
    apt-get update && apt-get install -y --allow-unauthenticated sbt && \


# Install hub
ENV HUB_VERSION 2.2.9
RUN \
    wget https://github.com/github/hub/releases/download/v$HUB_VERSION/hub-linux-amd64-$HUB_VERSION.tgz && \
    tar -xvzf hub-linux-amd64-$HUB_VERSION.tgz && \
    hub-linux-amd64-$HUB_VERSION/install && \
    rm -rf hub-linux-amd64-$HUB_VERSION.tgz hub-linux-amd64-$HUB_VERSION

# Just zsh things (COPY uses "root" regardless of USER here)
COPY .zshrc /home/wsargent/.zshrc
COPY .zshenv /home/wsargent/.zshenv
COPY .antigen.zsh /home/wsargent/.antigen.zsh
RUN mkdir -p /home/wsargent/.zsh/completions
COPY _hub /home/wsargent/.zsh/completions/_hub

RUN chown -R wsargent:wsargent /home/wsargent

# http://stackoverflow.com/a/38553499
RUN sed -i -e 's/# en_US.UTF-8 UTF-8/en_US.UTF-8 UTF-8/' /etc/locale.gen && \
    echo 'LANG="en_US.UTF-8"'>/etc/default/locale && \
    dpkg-reconfigure --frontend=noninteractive locales && \
    update-locale LANG=en_US.UTF-8

ENV LANG en_US.UTF-8

# Change user
USER wsargent
WORKDIR /home/wsargent

# Set up some Git things (Run respects USER at least)
# probably faster to just have COPY .gitconfig
RUN \
    git config --global core.autocrlf input && \
    git config --global core.symlinks true && \
    git config --global user.name "Will Sargent" && \
    git config --global user.email "will.sargent@gmail.com" && \
    git config --global push.default simple && \
    git config --global user.signingkey CD6970B72D00E5BE9A330EF3C1E8BF062BC6C4B7 && \
    git config --global commit.gpgsign true

# Download all public keys
#RUN curl https://keybase.io/will_sargent/pgp_keys.asc | gpg --import

# Should preload sbt
# http://www.scala-sbt.org/0.13/docs/sbt-0.13-Tech-Previews.html#Offline+installation
# docker pull triplequote/ci-scala-sbt-preloaded

CMD ["/bin/zsh"]
