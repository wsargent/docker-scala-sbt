export DEFAULT_USER=wsargent
export JAVA_HOME=/usr/lib/jvm/java-8-oracle
export EDITOR=vim
export PATH=$PATH:"$SBT_HOME/bin"
export ANTIGEN=$HOME/.antigen

# https://medium.com/software-development-stories/developing-a-dockerized-web-app-on-windows-subsystem-for-linux-wsl-61efec965080
# Technically, this only needs to be on the host, not the container.
# But I keep forgetting and copying this anyway.
export DOCKER_HOST=tcp://127.0.0.1:2375