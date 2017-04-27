FROM base:latest


####################################
# Install Java and dependencies
#FROM base AS java
WORKDIR /tmp
RUN \
    apt-key adv --keyserver keyserver.ubuntu.com --recv-keys C2518248EEA14886 && \
    add-apt-repository -y ppa:webupd8team/java && \
    apt-get update && \
    echo oracle-java8-installer shared/accepted-oracle-license-v1-1 select true | debconf-set-selections && \
    apt-get install -y --allow-unauthenticated oracle-java8-installer && \
    rm -rf /var/lib/apt/lists/* && \
    rm -rf /var/cache/oracle-jdk8-installer

# Run unlimited security policy
RUN \
    curl -v -j -k -L -H "Cookie:oraclelicense=accept-securebackup-cookie" http://download.oracle.com/otn-pub/java/jce/8/jce_policy-8.zip  > jce_policy-8.zip && \
    unzip jce_policy-8.zip && \
    cp UnlimitedJCEPolicyJDK8/* /usr/lib/jvm/java-8-oracle/jre/lib/security/ && \
    rm -rf jce_policy-8.zip UnlimitedJCEPolicyJDK8
