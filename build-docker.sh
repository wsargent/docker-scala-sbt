#!/bin/bash

# Run this against Docker to build all of the images needed.
# It is idempotent, so running it again is harmless -- Docker will see everything is cached.

# https://medium.com/software-development-stories/developing-a-dockerized-web-app-on-windows-subsystem-for-linux-wsl-61efec965080
# But I keep forgetting and copying this anyway.

# Build 'base' from a Debian install.
docker build -t docker-scala-sbt:base base/

# Add 'java', on top of base.
docker build -t docker-scala-sbt:java java/

# Add 'sbt' on top of java.
docker build -t docker-scala-sbt:sbt sbt/

# Build 'wsargent-shell' from hub / sbt with username of wsargent
docker build --build-arg USER=wsargent -t docker-scala-sbt:wsargent-shell shell/

# Build 'wsargent' from 'wsargent-shell'
DOCKER_HOST_IP=`ifconfig | grep -E "([0-9]{1,3}\.){3}[0-9]{1,3}" | grep -v 127.0.0.1 | awk '{ print $2 }' | cut -f2 -d: | head -n1`
echo DOCKER_HOST_IP = $DOCKER_HOST_IP
docker build \
  --build-arg ARTIFACTORY_ADDRESS=$DOCKER_HOST_IP \
  --build-arg USER=wsargent \
  -t docker-scala-sbt:wsargent \
  wsargent/

# Build 'scala' from 'wsargent' (runs "sbt new scala/hello-world.g8")
docker build --build-arg USER=wsargent -t docker-scala-sbt:scala scala/

# XXX Should technically do Akka builds here

# Build 'playframework' from 'scala' (runs "sbt new playframework/play-scala-seed.g8")
docker build --build-arg USER=wsargent -t docker-scala-sbt:playframework playframework/

## XXX Build all of the playframework example templates?

# Build 'playframework-dev' from 'playframework' (this is for use by play contributors)
docker build --build-arg USER=wsargent -t docker-scala-sbt:playframework-dev playframework-dev/
