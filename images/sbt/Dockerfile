FROM docker-scala-sbt:java

####################################
# Install sbt

#COPY sbt-0.13.15.tgz sbt-0.13.15.tgz
RUN \
    wget https://github.com/sbt/sbt/releases/download/v0.13.15/sbt-0.13.15.tgz && \
    tar zxvf sbt-0.13.15.tgz && \
    mv sbt /opt && \
    rm sbt-0.13.15.tgz
ENV SBT_HOME /opt/sbt
