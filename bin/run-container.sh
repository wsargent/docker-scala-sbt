#!/bin/bash

IMAGE_TAG=$1

# This lets me do a playframework build and compile with a warmed up and ready to go image.
docker run --rm -it \
   -h $IMAGE_TAG \
   -e "DEFAULT_USER=$IMAGE_TAG" \
  --net=host \
  --privileged -v /dev/bus/usb:/dev/bus/usb \
  --publish 9000:9000 \
  --volume="C:/Users/wsargent/work:/home/wsargent/work" \
  docker-scala-sbt:"$IMAGE_TAG" \
  zsh
