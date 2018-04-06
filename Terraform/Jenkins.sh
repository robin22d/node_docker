#!/bin/bash
# updating machine
echo "updating machine..."
yum update -y
yum upgrade -y

echo "installing unzip and wget"
# isntalling wget
yum install wget -y
# isntalling unzip
yum install unzip -y

echo "installing git..."
# isntalling get
yum install git -y

echo "Installing java package"
# installing Java
yum install java-1.8.0-openjdk-devel -y
echo "checking the version on java"
#checking java has installed
java -version
javac -version

# Setting environment variables
echo "updating environment variables"
cp /etc/profile /etc/profile_backup
echo 'export JAVA_HOME=/usr/lib/jvm/jre-1.8.0-openjdk' | sudo tee -a /etc/profile
echo 'export JRE_HOME=/usr/lib/jvm/jre' | sudo tee -a /etc/profile
echo 'export PATH=$PATH:$GRADLE_HOME/bin' | sudo tee -a /etc/profile
source /etc/profile

echo "installing docker..."
#installing docker
yum install -y yum-utils device-mapper-persistent-data lvm2
yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo
yum install docker-ce -y

systemctl enable docker.service
systemctl start docker.service
systemctl status docker.service

usermod -aG docker centos

#https://www.cyberciti.biz/faq/install-use-setup-docker-on-rhel7-centos7-linux/
echo "checking docker is working"
docker run hello-world

echo "installing gitlab server key"
# installing gitlab server key
touch /root/.ssh/known_hosts
cat << 'EOF' >> /root/.ssh/known_hosts
gitlab.cs.cf.ac.uk,131.251.168.40 ecdsa-sha2-nistp256 AAAAE2VjZHNhLXNoYTItbmlzdHAyNTYAAAAIbmlzdHAyNTYAAABBBDQcOCOPLUQCRGrioWbPcxxCsqGOIj2wbP9MiE14Oc7KeLYbRwBtlHImq4k8f0tgI3qejeSnXl2y3jbFAmnttXY=
EOF
chmod 644 /root/.ssh/known_hosts
#changing to root
cd ~
#getting jenkins and installing
wget -O /etc/yum.repos.d/jenkins.repo http://pkg.jenkins-ci.org/redhat-stable/jenkins.repo
rpm --import http://pkg.jenkins-ci.org/redhat-stable/jenkins-ci.org.key
yum install jenkins -y
# stating and enabling jenkins
systemctl start jenkins.service
systemctl enable jenkins.service
# waiting for file to be created
sleep 70
# Printing jenkins password
echo 'jenkins password:'
cat /var/lib/jenkins/secrets/initialAdminPassword

