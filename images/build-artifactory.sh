#!/bin/bash

# https://www.jfrog.com/confluence/display/RTF/Installing+with+Docker
# Build 'artifactory' from the OSS install

# /var/opt/jfrog/artifactory
docker volume create --name artifactory5_data

docker build -t docker-scala-sbt:artifactory artifactory/
