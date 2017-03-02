#!/bin/bash

# set the session to be noninteractive
export DEBIAN_FRONTEND="noninteractive"

## Update the Aptitude cache
apt-get update
apt-get upgrade -y

# Describe the environment
export DEBIAN_FRONTEND "noninteractive"
JDK_VERSION="1.7.0"
JMETER_VERSION="3.1"
JMETER_PLUGINS_MANAGER="0.11"

# Install the JDK
apt-get install -y curl openjdk-7-jdk

# download jmeter
cd /var/lib
curl -s http://www-us.apache.org/dist/jmeter/binaries/apache-jmeter-$JMETER_VERSION.tgz \
	-o /var/lib/jmeter-$JMETER_VERSION.tgz
tar xf jmeter-$JMETER_VERSION.tgz
rm -f jmeter-$JMETER_VERSION.tgz
ln -s /var/lib/apache-jmeter-$JMETER_VERSION /var/lib/apache-jmeter

# install plugins
curl -s https://repo1.maven.org/maven2/kg/apc/cmdrunner/2.0/cmdrunner-2.0.jar \
	-o /var/lib/apache-jmeter/lib/cmdrunner-2.0.jar
curl -s https://repo1.maven.org/maven2/kg/apc/jmeter-plugins-manager/$JMETER_PLUGINS_MANAGER/jmeter-plugins-manager-$JMETER_PLUGINS_MANAGER.jar \
	-o /var/lib/apache-jmeter/lib/ext/jmeter-plugins-manager.jar
java -cp /var/lib/apache-jmeter/lib/ext/jmeter-plugins-manager.jar org.jmeterplugins.repository.PluginManagerCMDInstaller
sh /var/lib/apache-jmeter/bin/PluginsManagerCMD.sh status
sh /var/lib/apache-jmeter/bin/PluginsManagerCMD.sh install jpgc-casutg

# copy over config
cp /vagrant/jmeter.properties /var/lib/apache-jmeter/bin/
