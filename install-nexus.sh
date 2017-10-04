#! /bin/bash
# See Installation docs at https://books.sonatype.com/nexus-book/3.0/reference/install.html#installation-archive

# Increase max file descriptors to more than 65,536
echo "fs.file-max = 100000" | sudo tee --append /etc/sysctl.conf > /dev/null

# Increase the max file descriptors for the nexus user
echo "nexus - nofile 65536" | sudo tee --append /etc/security/limits.conf > /dev/null

# Create nexus user
sudo useradd -r -m nexus
echo "export NEXUS_HOME=/opt/nexus" | sudo -u nexus tee --append ~nexus/.bashrc > /dev/null

# Install Nexus
curl -L -o nexus.tar.gz http://download.sonatype.com/nexus/3/latest-unix.tar.gz
tar -xzf nexus.tar.gz
sudo mv nexus-* /opt/nexus
sudo mv sonatype-work/* /opt/sonatype-work
sudo chown -R nexus:nexus /opt/nexus /opt/sonatype-work
rm nexus.tar.gz

# Configure Nexus
echo 'run_as_user="nexus"' | sudo -u nexus tee /opt/nexus/bin/nexus.rc > /dev/null
#sudo mv ~/nexus.properties /opt/sonatype-work/nexus3/etc/nexus.properties
#sudo chown nexus:nexus /opt/sonatype-work/nexus3/etc/nexus.properties

# Configure as service
sudo ln -s /opt/nexus/bin/nexus /etc/init.d/nexus
cd /etc/init.d
sudo chkconfig --add nexus
sudo chkconfig --levels 345 nexus on
sudo service nexus start