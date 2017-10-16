export JAVA_HOME=/usr/lib/jvm/java-8-oracle
export EDITOR=vim
export PATH=$PATH:/opt/sbt/bin
export ANTIGEN=$HOME/.antigen

export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

# GPG 2.1.x SSH support
# See : http://incenp.org/notes/2015/gnupg-for-ssh-authentication.html
export SSH_AUTH_SOCK=$HOME/.gnupg/S.gpg-agent.ssh

# Do not override repos by default unless you are doing artifactory things specifically
#export SBT_OPTS="-Xmx2G -Xss2M -XX:MaxMetaspaceSize=512M -XX:ReservedCodeCacheSize=192M -XX:+CMSClassUnloadingEnabled -Dfile.encoding=UTF-8 -Dsbt.override.build.repos=true"

# This is the safe version to use
export SBT_OPTS="-Xmx2G -Xss2M -XX:MaxMetaspaceSize=512M -XX:ReservedCodeCacheSize=192M -XX:+CMSClassUnloadingEnabled -Dfile.encoding=UTF-8"
