#! /bin/bash

# Install Java Runtime
curl -L -H "Cookie: oraclelicense=accept-securebackup-cookie" -o jdk1.8.0_181.tar.gz http://download.oracle.com/otn-pub/java/jdk/8u181-b13/96a7b8442fe848ef90c96a2fad6ed6d1/jdk-8u181-linux-x64.tar.gz
tar -xzf jdk1.8.0_181.tar.gz
rm jdk1.8.0_181.tar.gz
sudo mkdir -p /usr/lib/jvm
sudo mv jdk1.8.0_181 /usr/lib/jvm/jdk1.8.0_181
sudo chown -R root:root /usr/lib/jvm/jdk1.8.0_181

sudo update-alternatives --install /usr/bin/java java /usr/lib/jvm/jdk1.8.0_181/bin/java 1200