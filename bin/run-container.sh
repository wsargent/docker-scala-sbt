#!/bin/bash

IMAGE_TAG=$1

# This isn't great for security, but it maps everything through to the $HOME/work directory.
docker run --rm -it \
   -h $IMAGE_TAG \
   -e "DEFAULT_USER=$IMAGE_TAG" \
  --net=host \
  --privileged -v /dev/bus/usb:/dev/bus/usb \
  --publish 9000:9000 \
  --volume="$HOME/work:/home/wsargent/work" \
  docker-scala-sbt:"$IMAGE_TAG" \
  zsh
