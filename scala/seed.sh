mkdir $HOME/seed && \
cd $HOME/seed && \
$SBT_HOME/bin/sbt new playframework/play-scala-seed.g8 --name=play-scala-seed && \
cd $HOME/.seed/play-scala-seed && \
$SBT_HOME/bin/sbt compile test && \
cd $HOME