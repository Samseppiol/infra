#!/bin/bash
# Log out to designated logfile all commands and results, great for debugging
exec 1<&-
exec 2<&-
LOG_FILE=/var/log/userdataScript.log
exec 1<>$LOG_FILE
exec 2>&1
# Prepare instance and install jenkins
yum update -y 
yum install java-1.8.0 -y
yum remove java-1.7.0-openjdk -y
sudo wget -O /etc/yum.repos.d/jenkins.repo http://pkg.jenkins-ci.org/redhat/jenkins.repo
sudo rpm --import https://pkg.jenkins.io/redhat/jenkins.io.key
yum install jenkins -y 
# Start jenkins and ensure it starts on boot
service jenkins start
chkconfig jenkins on
