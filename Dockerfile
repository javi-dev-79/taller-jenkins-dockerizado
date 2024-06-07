# Utiliza la imagen base de Jenkins LTS
FROM jenkins/jenkins:lts

# Define el puerto HTTP personalizado para Jenkins
ENV JENKINS_OPTS="--httpPort=9080"

# Cambia al usuario root para instalar dependencias
USER root

# Instala sudo y otras dependencias
RUN apt-get update && \
    apt-get install -y sudo && \
    sudo apt-get install -y doxygen dot2tex graphviz

# Crea el directorio jenkins_home y establece los permisos adecuados
RUN mkdir -p /var/jenkins_home && \
    sudo chown -R jenkins:jenkins /var/jenkins_home && \
    sudo chmod -R 777 /var/jenkins_home

# Instala git
RUN apt-get update && apt-get install -y git

# Cambia de nuevo al usuario de Jenkins
USER jenkins

# Directorio de trabajo
WORKDIR /var/jenkins_home

# Clona el repositorio de Git dentro del contenedor
RUN git clone https://github.com/javi-dev-79/taller-jenkins-dockerizado.git taller-jenkins-dockerizado

# Reinicia Jenkins para aplicar los cambios
RUN /usr/local/bin/install-plugins.sh git && \
    /usr/local/bin/jenkins.sh restart

