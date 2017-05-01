export JAVA_HOME=/usr/lib/jvm/java-8-oracle
export EDITOR=vim
export PATH=$PATH:/opt/sbt/bin
export ANTIGEN=$HOME/.antigen

export SBT_OPTS="-Xmx2G -Xss2M -XX:MaxMetaspaceSize=512M -XX:ReservedCodeCacheSize=192M -XX:+CMSClassUnloadingEnabled -Dfile.encoding=UTF-8 -Dsbt.override.build.repos=true"