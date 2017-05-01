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
 
# ARG ARTIFACTORY_ADDRESS
# RUN echo "[repositories]\n\
#   local\n\
#   maven-local\n\
#   ivy-preloaded-releases: file:///$USERHOME/.sbt/preloaded, [organization]/[module]/(scala_[scalaVersion]/)(sbt_[sbtVersion]/)[revision]/[type]s/[artifact](-[classifier]).[ext]\n\
#   maven-preloaded-releases: file:///$USERHOME/.sbt/preloaded\n\
#   my-ivy-proxy-releases: http://$ARTIFACTORY_ADDRESS:8081/artifactory/ivy-release, [organization]/[module]/(scala_[scalaVersion]/)(sbt_[sbtVersion]/)[revision]/[type]s/[artifact](-[classifier]).[ext]\n\
#   my-maven-proxy-releases: http://$ARTIFACTORY_ADDRESS:8081/artifactory/libs-release/\n\
#   my-ivy-proxy-dev: http://$ARTIFACTORY_ADDRESS:8081/artifactory/ivy-dev/, [organization]/[module]/(scala_[scalaVersion]/)(sbt_[sbtVersion]/)[revision]/[type]s/[artifact](-[classifier]).[ext]\n\
#   my-maven-proxy-snapshot: http://$ARTIFACTORY_ADDRESS:8081/artifactory/libs-snapshot/\n\
#   sonatype-releases: https://oss.sonatype.org/content/repositories/releases/\n\
#   central: http://central.maven.org/maven2/\n\
#   #sbt-plugin-releases: https://repo.scala-sbt.org/scalasbt/sbt-plugin-releases/\n\
#   #typesafe-releases: https://repo.typesafe.com/typesafe/maven-releases/\n\
#   #typesafe-ivy-releases: https://repo.typesafe.com/typesafe/ivy-releases/, [organization]/[module]/(scala_[scalaVersion]/)(sbt_[sbtVersion]/)[revision]/[type]s/[artifact](-[classifier]).[ext]\n\
# ">> home/$USER/.sbt/repositories