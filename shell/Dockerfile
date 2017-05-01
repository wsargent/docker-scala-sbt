FROM docker-scala-sbt:sbt

ARG USER
ENV USERHOME /home/$USER

# Set up gpg.conf
RUN curl -s "https://sks-keyservers.net/sks-keyservers.netCA.pem" -o /etc/sks-keyservers.netCA.pem

# Install hub
ENV HUB_VERSION 2.2.9
RUN \
    wget https://github.com/github/hub/releases/download/v$HUB_VERSION/hub-linux-amd64-$HUB_VERSION.tgz && \
    tar -xvzf hub-linux-amd64-$HUB_VERSION.tgz && \
    hub-linux-amd64-$HUB_VERSION/install && \
    rm -rf hub-linux-amd64-$HUB_VERSION.tgz hub-linux-amd64-$HUB_VERSION

# Create userspace
RUN \
    groupadd $USER && \
    useradd $USER -m -g $USER -s /bin/zsh && \
    passwd -d -u $USER && \
    touch /etc/sudoers.d/$USER && \
    echo "$USER ALL=(ALL) NOPASSWD:ALL" > /etc/sudoers.d/$USER && \
    chmod 0440 /etc/sudoers.d/$USER

COPY .gnupg $USERHOME/.gnupg
COPY .gitconfig $USERHOME/.gitconfig
RUN mkdir -p $USERHOME/.zsh/completions
COPY _hub $USERHOME/.zsh/completions/_hub
COPY .sbt $USERHOME/.sbt

# Get antigen
RUN git clone --depth 1 https://github.com/zsh-users/antigen.git $USERHOME/.antigen
COPY .antigenrc $USERHOME/.antigenrc

# Just zsh things (COPY uses "root" regardless of USER here)
COPY .zshrc $USERHOME/.zshrc
COPY .zshenv $USERHOME/.zshenv

RUN chown -R $USER:$USER $USERHOME
RUN chmod og-rwx $USERHOME/.gnupg

# Change user (Run respects USER, so everything is run with $USER context)
USER $USER
WORKDIR $USERHOME

# Run antigen caching as $USER
RUN zsh -c 'source $USERHOME/.antigen/antigen.zsh && antigen init $USERHOME/.antigenrc && antigen cache-gen'

CMD ["/bin/zsh"]

ENV SHELL /bin/zsh

ENTRYPOINT /bin/zsh