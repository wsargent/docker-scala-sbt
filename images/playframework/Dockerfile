#
# This dockerfile checks out and resolves all the play related library dependencies.
#
FROM docker-scala-sbt:scala

USER $USER
WORKDIR /home/$USER

RUN \
    cd /tmp  && \
    /opt/sbt/bin/sbt new playframework/play-scala-seed.g8 --name=play-scala-seed && \
    cd /tmp/play-scala-seed && \
    /opt/sbt/bin/sbt test  && \
    cd /tmp && \
    rm -rf /tmp/play-scala-seed

RUN \
    cd /tmp && \
    /opt/sbt/bin/sbt new playframework/play-java-seed.g8 --name=play-java-seed && \
    cd /tmp/play-java-seed && \
    /opt/sbt/bin/sbt test  && \
    cd /tmp && \
    rm -rf /tmp/play-java-seed
