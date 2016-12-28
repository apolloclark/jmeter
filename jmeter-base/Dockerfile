FROM ubuntu:14.04 
MAINTAINER Apollo Clark apolloclark@gmail.com 

# Describe the environment
ENV DEBIAN_FRONTEND "noninteractive"
ENV JDK_VERSION 1.7.0
ENV JMETER_VERSION 3.1
ENV JMETER_PLUGINS_MANAGER 0.11

# Install the JDK
RUN apt-get update -y && apt-get install curl openjdk-7-jdk -y && \
  cd /var/lib && \
  curl -s http://www-us.apache.org/dist/jmeter/binaries/apache-jmeter-$JMETER_VERSION.tgz -o /var/lib/jmeter-$JMETER_VERSION.tgz && \
  tar xf jmeter-$JMETER_VERSION.tgz && \
  rm -f jmeter-$JMETER_VERSION.tgz && \
  ln -s /var/lib/apache-jmeter-$JMETER_VERSION /var/lib/apache-jmeter && \
  curl -s https://repo1.maven.org/maven2/kg/apc/cmdrunner/2.0/cmdrunner-2.0.jar --output /var/lib/apache-jmeter/lib/cmdrunner-2.0.jar && \
  curl -s https://repo1.maven.org/maven2/kg/apc/jmeter-plugins-manager/$JMETER_PLUGINS_MANAGER/jmeter-plugins-manager-$JMETER_PLUGINS_MANAGER.jar --output /var/lib/apache-jmeter/lib/ext/jmeter-plugins-manager.jar && \
  java -cp /var/lib/apache-jmeter/lib/ext/jmeter-plugins-manager.jar org.jmeterplugins.repository.PluginManagerCMDInstaller && \
  sh /var/lib/apache-jmeter/bin/PluginsManagerCMD.sh status && \
  sh /var/lib/apache-jmeter/bin/PluginsManagerCMD.sh install jpgc-casutg

ENTRYPOINT /bin/sh