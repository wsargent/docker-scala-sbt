# docker-scala-sbt

A docker file set up with a development environment such that you can run SBT easily on Windows.

This requires installing WSL and Docker for Windows, and then running through the tweaks necessary to make Docker happy.

This is because SBT requires a bunch of cache resolution, even if you already have a warmed up Artifactory install, and so providing a pre-built Docker image lets you skip all of that.

## Installing

Install WSL, Docker for Windows and the integration (running Docker from inside a WSL prompt):

* [Windows 10 Development Environment for Scala](https://gist.github.com/wsargent/072319c2100ac0aea4305d6f6eeacc08)
* [Developing a dockerized web app on Windows Subsystem for Linux (WSL)](https://medium.com/software-development-stories/developing-a-dockerized-web-app-on-windows-subsystem-for-linux-wsl-61efec965080)
* [Running Docker on Windows Subsystem for Linux (WSL)](https://www.reddit.com/r/docker/comments/5eggwo/running_docker_on_windows_subsystem_for_linux_wsl/)

## Artifactory

Set up Artifactory.  I did it on the host, you may have better luck running it in a docker container, where Docker can link to it more easily.

Note that Artifactory 5 has the service installer broken on Windows 10, and you need to follow this video to install it:

* [Install Artifactory 5 on Windows 10 as a service](https://www.youtube.com/watch?v=Lg4a6Sc_Xco)

Artifactory has two things you need to worry about: remote repositories (which are things like Sonatype Releases, JCenter etc) and virtual repositories (which are composites of remote repositories).  You want to create all the Maven remote repositories and turn them into one Maven virtual repository.  Then you want to create all the Ivy virtual repositories and turn them into one Ivy virtual repository.  You do this through the admin interface.  

If you're publishing to the Artifactory instance, I think you need different repositories for that, but I'm not sure.

I don't remember the list of URLs that I put into artifactory -- I think I just spammed links until everything resolved.  The likely candidates are commented out in the relevant dockerfile, but there's also some scala-sbt repository I haven't been able to track down.

Once you have that up, then the Dockerfile will write to ~/.sbt/repositories with the correct name and the correct IP address.  

## Running

```
./build-docker.sh

```

Then open up a shell:

```
./run-docker.sh
```

and try to create a project:

```
sbt new playframework/play-scala-seed.g8 --name=test-project
cd test-project
sbt test
```

If you can do that without SBT resolving anything, then you're good.

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
