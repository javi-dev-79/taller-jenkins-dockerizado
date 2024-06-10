#!/bin/bash

docker exec -it -u root new_jenkins /bin/bash -c '
apt-get update
apt-get install -y doxygen dot2tex graphviz git
git clone https://github.com/javi-dev-79/taller-jenkins-dockerizado.git /taller-jenkins-dockerizado
chown -R jenkins:jenkins /taller-jenkins-dockerizado
chmod -R 777 /taller-jenkins-dockerizado
cd taller-jenkins-dockerizado
apt-get update && apt-get install -y \
    build-essential \
    cppcheck \
    && rm -rf /var/lib/apt/lists/*
cppcheck *.c --enable=all --inconclusive --language=c *.c
'