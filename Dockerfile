FROM jenkins/jenkins:lts

USER root

# Working directory
WORKDIR /var/jenkins_home

# Set the Jenkins HTTP port
ENV JENKINS_OPTS="--httpPort=9080"

# Switch back to user jenkins
USER jenkins

# Grant docker permissions to user jenkins
RUN usermod -aG docker jenkins


