FROM docker-scala-sbt:playframework

USER $USER
WORKDIR /home/$USER

RUN hub clone --depth 1 https://github.com/playframework/playframework.git /tmp/playframework

# We want to run the test suite and even if it fails, it's still an acceptable build.
ENV TRAVIS_SCALA_VERSION=2.11.11   
RUN cd /tmp/playframework/framework && /opt/sbt/bin/sbt test publishLocal; exit 0

# We want to run the test suite and even if it fails, it's still an acceptable build.
ENV TRAVIS_SCALA_VERSION=2.12.2   
RUN cd /tmp/playframework/framework && /opt/sbt/bin/sbt test publishLocal; exit 0

RUN cd /tmp && rm -rf /tmp/playframework
