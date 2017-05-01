# https://medium.com/software-development-stories/developing-a-dockerized-web-app-on-windows-subsystem-for-linux-wsl-61efec965080
# But I keep forgetting this -- running under WSL, you need to specify IP, not the socket.
export DOCKER_HOST=tcp://127.0.0.1:2375
