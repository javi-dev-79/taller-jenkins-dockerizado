#!/bin/bash

# # Crea el directorio /var/lib/apt/lists/partial y establece los permisos
# mkdir -p /var/lib/apt/lists/partial
# chown -R jenkins:jenkins /var/lib/apt/lists
# chmod 777 /var

# # Instala las dependencias necesarias
# apt-get update && \
#     apt-get install -y \
#         doxygen \
#         dot2tex \
#         graphviz \
#         cppcheck \
#         git

# # Crea el directorio jenkins_home y establece los permisos adecuados
# mkdir -p /var/jenkins_home
# chown -R jenkins:jenkins /var/jenkins_home
# chmod -R 777 /var/jenkins_home


# Ejecuta los comandos dentro del contenedor Docker
bash -c '
apt-get update
apt-get install -y doxygen dot2tex graphviz cppcheck git
'