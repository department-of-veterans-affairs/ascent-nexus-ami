# Install Github authentication plugin for Nexus.
# See: https://github.com/larscheid-schmitzhermes/nexus3-github-oauth-plugin

# Install uzip utility
sudo yum -y install unzip

# Install GitHub OAuth plugin
sudo mkdir -p /opt/nexus/system/com/larscheidschmitzhermes/
sudo curl -L -o /opt/nexus/system/com/larscheidschmitzhermes/nexus3-github-oauth-plugin.zip https://github.com/larscheid-schmitzhermes/nexus3-github-oauth-plugin/releases/download/1.0.0/nexus3-github-oauth-plugin.zip
sudo unzip /opt/nexus/system/com/larscheidschmitzhermes/nexus3-github-oauth-plugin.zip -d /opt/nexus/system/com/larscheidschmitzhermes/
sudo chown -R nexus:nexus /opt/nexus/system/com/larscheidschmitzhermes
echo "mvn\:com.larscheidschmitzhermes/nexus3-github-oauth-plugin/1.0.0 = 200" | sudo -u nexus tee --append /opt/nexus/etc/karaf/startup.properties > /dev/null

sudo mv githuboauth.properties /opt/nexus/etc/githuboauth.properties
sudo chown nexus:nexus /opt/nexus/etc/githuboauth.properties
