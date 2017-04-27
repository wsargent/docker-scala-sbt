# docker-scala-sbt

A docker file set up with a development environment such that you can run SBT easily on Windows.

This requires installing WSL and Docker for Windows, and then running through the tweaks necessary to make Docker happy.

## Installing

Note that this depends on https://git-lfs.github.com/ for storing large files.

```
git lfs install
```

Install WSL, Docker for Windows and the integration (running Docker from inside a WSL prompt):

* [Windows 10 Development Environment for Scala](https://gist.github.com/wsargent/072319c2100ac0aea4305d6f6eeacc08)
* [Developing a dockerized web app on Windows Subsystem for Linux (WSL)](https://medium.com/software-development-stories/developing-a-dockerized-web-app-on-windows-subsystem-for-linux-wsl-61efec965080)
* [Running Docker on Windows Subsystem for Linux (WSL)](https://www.reddit.com/r/docker/comments/5eggwo/running_docker_on_windows_subsystem_for_linux_wsl/)

## Artifactory

Set up Artifactory.  I did it on the host, you may have better luck running it in a docker container, where Docker can link to it more easily.

## Running

```
./build-docker.sh
./run-docker.sh
```

If SBT doesn't download anything, you did it right.

## Further reading

### Docker Cheat Sheet

* https://github.com/wsargent/docker-cheat-sheet

### Jess Frazelle's Docker Sheets

* https://github.com/jessfraz/dockerfiles

### Getting Notify to work on Docker

* https://github.com/merofeev/docker-windows-volume-watcher

### Mounting .sbt directory in Docker

* https://github.com/chanezon/docker-tips/blob/master/java-build-mount-maven-repo.md
* https://codefresh.io/blog/node_docker_multistage/
* https://flurdy.com/docs/docker/play-with-docker.html
* http://blog.flurdy.com/2014/11/dont-download-internet-share-maven-ivy-docker.html
* http://blog.traintracks.io/monorepo-shared-code-and-isolated-fast-docker-builds/

### More SBT Stuff

* https://www.clever-cloud.com/blog/engineering/2013/11/30/set-up-sbt-for-proxy-use/
* http://www.scala-sbt.org/0.13/docs/Proxy-Repositories.html#Proxying+Ivy+Repositories

### Setting up Artifactory as a proxy for SBT

* https://www.jfrog.com/getcli/
* https://www.jfrog.com/article/rest-api-user-plugins/
* https://www.jfrog.com/confluence/display/RTF/Artifactory+REST+API
* https://www.jfrog.com/confluence/display/RTF/SBT+Repositories
* https://www.jfrog.com/knowledge-base/what-are-best-practices-for-organizing-repositories-and-package-types/
* https://docs.google.com/document/d/18fGjMz21J4-JMHXfDH4OyGOXu8NvWfsG4q83S9RT64M/edit#
