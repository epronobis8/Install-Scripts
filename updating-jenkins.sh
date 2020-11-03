cd /downloads
wget http://updates.jenkins-ci.org/download/war/2.265/jenkins.war
#update version number above
cp /usr/lib/jenkins/jenkins.war /downloads/jenkins.war.previous.version
cp /downloads/jenkins.war /usr/lib/jenkins/
systemctl stop jenkins
systemctl start jenkins
systemctl status jenkins

