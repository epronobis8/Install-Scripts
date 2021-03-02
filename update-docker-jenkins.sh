#This script updates jenkins for a docker container. You will need to update the jenkins version wihthin the wget command.

#Get into the root of the container with: docker container exec -u 0 -it jenkins bash

#update to current version
wget http://updates.jenkins-ci.org/download/war/2.282/jenkins.war
mv ./jenkins.war /usr/share/jenkins
mv ./jenkins.war /usr/share/jenkins
chown jenkins:jenkins /usr/share/jenkins/jenkins.war
