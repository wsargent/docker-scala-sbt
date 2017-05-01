# This lets me do a playframework project
docker run --rm -it \
  --net=host \
  --privileged -v /dev/bus/usb:/dev/bus/usb \
  --publish 9000:9000 \
  docker-scala-sbt:playframework \
  zsh
