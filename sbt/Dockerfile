FROM base:latest


####################################
# Install sbt
#FROM java AS sbt
COPY sbt-0.13.15.tgz sbt-0.13.15.tgz
RUN \
    tar zxvf sbt-0.13.15.tgz && \
    mv sbt /opt && \
    rm sbt-0.13.15.tgz
ENV SBT_HOME /opt/sbt

COPY .sbt $USERHOME/.sbt