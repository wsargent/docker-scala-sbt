docker run \
  --rm \
  -it \
  --net=host \
  --volume="C:/Users/wsargent/work:/home/play/work" \
  --volume="C:/Users/wsargent/.sbt:/home/play/.sbt" \
  --volume="C:/Users/wsargent/.m2:/home/play/.m2" \
  --volume="C:/Users/wsargent/.ivy2:/home/play/.ivy2" \
  docker-scala-sbt \
  bash
