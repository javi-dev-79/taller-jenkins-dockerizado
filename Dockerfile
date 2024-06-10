# # Utiliza la imagen base de Jenkins LTS
# FROM jenkins/jenkins:lts

# # Define el puerto HTTP personalizado para Jenkins
# ENV JENKINS_OPTS="--httpPort=9080"

# # Cambia al usuario root para instalar dependencias
# USER root

# # Copia el script de entrada al contenedor
# COPY entrypoint.sh /usr/local/bin/

# # Otorga permisos de ejecución al script de entrada
# RUN chmod +x /usr/local/bin/entrypoint.sh

# # # Cambia de nuevo al usuario de Jenkins
# # USER jenkins

# # Directorio de trabajo
# WORKDIR /var/jenkins_home

# # Clona el repositorio de Git dentro del contenedor
# RUN git clone https://github.com/javi-dev-79/taller-jenkins-dockerizado.git taller-jenkins-dockerizado

# # Reinicia Jenkins para aplicar los cambios
# RUN /usr/local/bin/install-plugins.sh git && \
#     /usr/local/bin/jenkins.sh restart

# # Establece el script de entrada como el punto de entrada del contenedor
# CMD ["/usr/local/bin/entrypoint.sh"]


# ---------------------------------------------------------------------------

# # Utiliza la imagen base de Jenkins LTS
# FROM jenkins/jenkins:lts

# # Define el puerto HTTP personalizado para Jenkins
# ENV JENKINS_OPTS="--httpPort=9080"

# # Cambia al usuario root para instalar dependencias
# USER root

# # Copia el script de entrada al contenedor
# COPY entrypoint.sh /usr/local/bin/

# # Establece los permisos adecuados para el script de entrada
# RUN chmod +x /usr/local/bin/entrypoint.sh

# # Cambia de nuevo al usuario de Jenkins
# USER jenkins

# # Directorio de trabajo
# WORKDIR /var/jenkins_home

# # Clona el repositorio de Git dentro del contenedor
# RUN git clone https://github.com/javi-dev-79/taller-jenkins-dockerizado.git taller-jenkins-dockerizado

# # Establece el script de entrada como el punto de entrada del contenedor
# CMD ["/usr/local/bin/entrypoint.sh"]

# ---------------------------------------------------------------------------

FROM jenkins/jenkins:lts

USER root

# Directorio de trabajo
WORKDIR /var/jenkins_home

# RUN mkdir /var/jenkins_home/aaaa

# # Copia el contenido del directorio actual al directorio de trabajo en el contenedor
# COPY . .

# # Instala git
# RUN apt-get update && \
#     apt-get install -y git && \
#     rm -rf /var/lib/apt/lists/*

# # Copia el script dependencies.sh a la carpeta de inicio de Jenkins
# COPY dependencies.sh /var/jenkins_home/dependencies.sh

# # Da permisos de ejecución al script
# RUN chmod +x /var/jenkins_home/dependencies.sh

# # Ejecuta el script dependencies.sh
# RUN /var/jenkins_home/dependencies.sh

# Establece el puerto HTTP de Jenkins
ENV JENKINS_OPTS="--httpPort=9080"

# # Clona el repositorio
# RUN git clone https://github.com/javi-dev-79/taller-jenkins-dockerizado.git /taller-jenkins-dockerizado

# Cambia de nuevo al usuario jenkins
USER jenkins

RUN usermod -aG docker jenkins


