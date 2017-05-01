#
# This dockerfile contains projects and settings specific to wsargent. :-)
#
FROM docker-scala-sbt:wsargent-shell

ENV USER wsargent
ENV DEFAULT_USER wsargent

USER $USER
WORKDIR /home/$USER

RUN curl https://keybase.io/will_sargent/pgp_keys.asc | gpg --import

RUN \
  git config --global user.name "Will Sargent" && \
  git config --global user.email "will.sargent@gmail.com" && \
  git config --global user.signingkey CD6970B72D00E5BE9A330EF3C1E8BF062BC6C4B7 && \
  git config --global commit.gpgsign true
 