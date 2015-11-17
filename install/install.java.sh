#!/bin/bash

source ~/architecture.conf

echo "deb http://ppa.launchpad.net/webupd8team/java/ubuntu precise main" | sudo tee /etc/apt/sources.list.d/webupd8team-java.list
echo "deb-src http://ppa.launchpad.net/webupd8team/java/ubuntu precise main" | sudo tee -a /etc/apt/sources.list.d/webupd8team-java.list
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys EEA14886
sudo apt-get update
echo oracle-java7-installer shared/accepted-oracle-license-v1-1 select true | sudo debconf-set-selections
echo -e "y\n" | sudo apt-get install oracle-java7-installer
sudo rm /usr/lib/jvm/default-java
sudo ln -s /usr/lib/jvm/java-7-oracle/ /usr/lib/jvm/default-java
echo -e "\n# Java setting\nexport JAVA_HOME=$JAVA_HOME" >> ~/.bashrc
