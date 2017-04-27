docker run --rm -it \
  --net=host \
  --privileged -v /dev/bus/usb:/dev/bus/usb \
  --publish 9000:9000 \
  --volume="C:/Users/wsargent/work:/home/wsargent/work" \
  docker-scala-sbt:latest \
  zsh
