#! /bin/bash

# Install Java Runtime
curl -L -H "Cookie: oraclelicense=accept-securebackup-cookie" -o jdk1.8.0_171.tar.gz http://download.oracle.com/otn-pub/java/jdk/8u171-b11/512cd62ec5174c3487ac17c61aaa89e8/jdk-8u171-linux-i586.tar.gz
tar -xzf jdk1.8.0_171.tar.gz
rm jdk1.8.0_171.tar.gz
sudo mkdir -p /usr/lib/jvm
sudo mv jdk1.8.0_171 /usr/lib/jvm/jdk1.8.0_171
sudo chown -R root:root /usr/lib/jvm/jdk1.8.0_171

sudo update-alternatives --install /usr/bin/java java /usr/lib/jvm/jdk1.8.0_171/bin/java 1200