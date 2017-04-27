
# Install hub
ENV HUB_VERSION 2.2.9
RUN \
    wget https://github.com/github/hub/releases/download/v$HUB_VERSION/hub-linux-amd64-$HUB_VERSION.tgz && \
    tar -xvzf hub-linux-amd64-$HUB_VERSION.tgz && \
    hub-linux-amd64-$HUB_VERSION/install && \
    rm -rf hub-linux-amd64-$HUB_VERSION.tgz hub-linux-amd64-$HUB_VERSION

