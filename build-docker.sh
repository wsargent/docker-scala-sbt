DOCKER_HOST_IP=`ifconfig | grep -E "([0-9]{1,3}\.){3}[0-9]{1,3}" | grep -v 127.0.0.1 | awk '{ print $2 }' | cut -f2 -d: | head -n1`

echo DOCKER_HOST_IP = $DOCKER_HOST_IP

docker build --build-arg ARTIFACTORY_ADDRESS=$DOCKER_HOST_IP -t docker-scala-sbt:latest -t docker-scala-sbt:1.0 .
