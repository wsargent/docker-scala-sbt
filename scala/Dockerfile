FROM docker-scala-sbt:wsargent

USER $USER
WORKDIR /home/$USER

RUN \
    cd /tmp && \
    /opt/sbt/bin/sbt new scala/scala-seed.g8 --name=scala-seed && \
    cd scala-seed && /opt/sbt/bin/sbt test && \
    cd /tmp && \
    rm -rf /tmp/scala-seed 
