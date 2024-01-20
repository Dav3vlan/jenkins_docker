FROM jenkins/jenkins:alpine

ENV JENKINS_USER admin
ENV JENKINS_PASS admin

# Skip initial setup
ENV JAVA_OPTS -Djenkins.install.runSetupWizard=false

RUN jenkins-plugin-cli \
    --plugins \
    git \
    workflow-aggregator \
    blueocean \
    templating-engine

# Install all the plugins
# Also install from a plugins.txt file
# RUN jenkins-plugin-cli -f /usr/share/jenkins/ref/plugins.txt

USER root
RUN apk add docker
RUN apk add py-pip

USER jenkins
