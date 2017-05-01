FROM docker-scala-sbt:wsargent

RUN \
    cd /tmp && \
    /opt/sbt/bin/sbt new scala/scala-seed.g8 --name=scala-seed && \
    cd scala-seed && /opt/sbt/bin/sbt test && \
    cd /tmp && \
    rm -rf /tmp/scala-seed 
