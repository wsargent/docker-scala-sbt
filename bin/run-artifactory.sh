#!/bin/bash

# https://www.jfrog.com/confluence/display/RTF/Installing+with+Docker
# https://gist.github.com/jbaruch/ba94cd3150645aa079bf
docker run \
  --name docker-scala-sbt:artifactory \
  -d \
  -v artifactory5_data:/var/opt/jfrog/artifactory \
  -p 8081:8081 \
  artifactory