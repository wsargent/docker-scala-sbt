# https://medium.com/software-development-stories/developing-a-dockerized-web-app-on-windows-subsystem-for-linux-wsl-61efec965080
# But I keep forgetting and copying this anyway.
export DOCKER_HOST=tcp://127.0.0.1:2375

# This lets me do a playframework build and compile with a warmed up and ready to go image.
docker run --rm -it \
  --net=host \
  --privileged -v /dev/bus/usb:/dev/bus/usb \
  --publish 9000:9000 \
  --volume="C:/Users/wsargent/work:/home/wsargent/work" \
  docker-scala-sbt:playframework-dev \
  zsh
