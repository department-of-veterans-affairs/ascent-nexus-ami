#! /bin/bash

# Install Java Runtime
curl -L -H "Cookie: oraclelicense=accept-securebackup-cookie" -o jdk1.8.0_161.tar.gz http://download.oracle.com/otn-pub/java/jdk/8u161-b12/2f38c3b165be4555a1fa6e98c45e0808/jdk-8u161-linux-x64.tar.gz
tar -xzf jdk1.8.0_161.tar.gz
rm jdk1.8.0_161.tar.gz
sudo mkdir -p /usr/lib/jvm
sudo mv jdk1.8.0_161 /usr/lib/jvm/jdk1.8.0_161
sudo chown -R root:root /usr/lib/jvm/jdk1.8.0_161

sudo update-alternatives --install /usr/bin/java java /usr/lib/jvm/jdk1.8.0_161/bin/java 1200