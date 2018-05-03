#! /bin/bash
sudo ls -l /dev
sudo mkfs -t ext4 /dev/xvdb
sudo mkdir /opt/sonatype-work
sudo mount /dev/xvdb /opt/sonatype-work

echo "/dev/xvdb       /opt/sonatype-work   ext4    defaults,nofail " | sudo tee --append /etc/fstab > /dev/null
