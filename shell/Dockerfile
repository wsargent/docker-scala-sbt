ENV USER wsargent
ENV USERHOME /home/$USER

# Create userspace
RUN \
    groupadd $USER && \
    useradd $USER -m -g $USER -s /bin/zsh && \
    passwd -d -u $USER && \
    touch /etc/sudoers.d/$USER && \
    echo "$USER ALL=(ALL) NOPASSWD:ALL" > /etc/sudoers.d/$USER && \
    chmod 0440 /etc/sudoers.d/$USER

RUN curl -s "https://sks-keyservers.net/sks-keyservers.netCA.pem" -o /etc/sks-keyservers.netCA.pem

COPY .gnupg $USERHOME/.gnupg

####################################
# Install wsargent
#FROM sbt AS wsargent

COPY .gitconfig $USERHOME/.gitconfig
RUN mkdir -p $USERHOME/.zsh/completions
COPY _hub $USERHOME/.zsh/completions/_hub

# Get antigen
RUN git clone --depth 1 https://github.com/zsh-users/antigen.git $USERHOME/.antigen
COPY .antigenrc $USERHOME/.antigenrc

# Just zsh things (COPY uses "root" regardless of USER here)
COPY .zshrc $USERHOME/.zshrc
COPY .zshenv $USERHOME/.zshenv

RUN chown -R $USER:$USER $USERHOME

# Change user (Run respects USER, so everything is run with $USER context)
USER $USER
WORKDIR $USERHOME

# Download all public keys as wsargent
RUN curl https://keybase.io/will_sargent/pgp_keys.asc | gpg --import

# Run antigen caching as wsargent
RUN zsh -c 'source $USERHOME/.antigen/antigen.zsh && antigen init $USERHOME/.antigenrc && antigen cache-gen'

# Assuming that you have Artifactory running on your host machine, we can connect to it through the host IP.
# Write out a repositories file with variables substituted, since apparently Docker hasn't managed to do this
# in five years and counting...

# Still not sure what repos need to be in artifactory, but it seems to look something like this in the remote repos:
#
# https://dl.bintray.com/typesafe/ivy-releases/
# http://repo1.maven.org/maven2
# https://dl.bintray.com/typesafe/maven-releases/
# https://dl.bintray.com/sbt/sbt-plugin-releases/
# https://repo.scala-sbt.org/scalasbt/sbt-plugin-releases
# https://oss.sonatype.org/content/repositories/releases
#
# And then if you're using Windows, you're going to publish artifacts to artifactory so they are persistent,
# and can leverage your artifacts against IntelliJ IDEA and the various containers.ADD
#
# I think cached resolution may be the rest of it:
#
# http://www.scala-sbt.org/0.13/docs/Cached-Resolution.html
#
# So you need a virtual repo for each kind (ivy, maven) and you need releases and shapshots for each kind.
# I think.

ARG ARTIFACTORY_ADDRESS
RUN echo "[repositories]\n\
  local\n\
  maven-local\n\
  ivy-preloaded-releases: file:///$USERHOME/.sbt/preloaded, [organization]/[module]/(scala_[scalaVersion]/)(sbt_[sbtVersion]/)[revision]/[type]s/[artifact](-[classifier]).[ext]\n\
  maven-preloaded-releases: file:///$USERHOME/.sbt/preloaded\n\
  my-ivy-proxy-releases: http://$ARTIFACTORY_ADDRESS:8081/artifactory/ivy-release, [organization]/[module]/(scala_[scalaVersion]/)(sbt_[sbtVersion]/)[revision]/[type]s/[artifact](-[classifier]).[ext]\n\
  my-maven-proxy-releases: http://$ARTIFACTORY_ADDRESS:8081/artifactory/libs-release/\n\
  my-ivy-proxy-dev: http://$ARTIFACTORY_ADDRESS:8081/artifactory/ivy-dev/, [organization]/[module]/(scala_[scalaVersion]/)(sbt_[sbtVersion]/)[revision]/[type]s/[artifact](-[classifier]).[ext]\n\
  my-maven-proxy-snapshot: http://$ARTIFACTORY_ADDRESS:8081/artifactory/libs-snapshot/\n\
  sonatype-releases: https://oss.sonatype.org/content/repositories/releases/\n\
  central: http://central.maven.org/maven2/\n\
  #sbt-plugin-releases: https://repo.scala-sbt.org/scalasbt/sbt-plugin-releases/\n\
  #typesafe-releases: https://repo.typesafe.com/typesafe/maven-releases/\n\
  #typesafe-ivy-releases: https://repo.typesafe.com/typesafe/ivy-releases/, [organization]/[module]/(scala_[scalaVersion]/)(sbt_[sbtVersion]/)[revision]/[type]s/[artifact](-[classifier]).[ext]\n\
">> $USERHOME/.sbt/repositories

CMD ["/bin/zsh"]

ENV SHELL /bin/zsh

ENTRYPOINT /bin/zsh