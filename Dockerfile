FROM codercom/code-server:4.9.1
# Image Debian avec code-server préinstallé

# code-server est une instance de VisualStudio Code
#  - qui s'éxécute sur le container
#  - accessible de l'extérieur depuis un navigateur web
#  - Cf. https://github.com/cdr/code-server


USER root

# Install et run NGINX + Java
# ===========================

RUN apt-get update \
    && apt-get install -y nginx \
    && apt-get install -y openjdk-11-jdk

# Wrapper HTML et reverse-proxy Nginx
# ===================================

EXPOSE 80/tcp

RUN mkdir /usr/share/nginx/html/env/

COPY src/main/nginx/nginx.conf /etc/nginx
COPY src/main/sh/docker-init.sh /home/coder/

# Adaptation du lancement
# ======================

RUN chmod +x /home/coder/docker-init.sh
ENTRYPOINT ["dumb-init", "sh", "docker-init.sh"]


USER coder

# ===============================================================
# ===============================================================
# FixMe : Ce qui précède est générique (hormis le HTML du TP) et
# doit être migré vers un repo dédié. Ce qui suit est spécifique.
# ===============================================================
# ===============================================================



# Mise en place de l'env et du TP
# ===============================

RUN code-server --install-extension vscjava.vscode-java-pack
RUN code-server --install-extension Pivotal.vscode-boot-dev-pack

RUN mkdir /home/coder/workspace/

COPY src/main/vscode/settings.json /home/coder/.local/share/code-server/User/settings.json
RUN sudo chown -R coder /home/coder/.local/share/code-server/User/settings.json

RUN cd /home/coder/workspace/ \
    && git clone https://github.com/jimetevenard/spring-hello-world.git \
    && echo "\nserver.port=8282" >> spring-hello-world/src/main/resources/application.properties
#   Le port 8080 est déjà occupé par code-server (VSCode)

RUN cd /home/coder/workspace/spring-hello-world \
    && git config --global user.name "Docker Env" \
    && git config --global user.email contact@jimetevenard.com \
    && git add --all && git commit -m "[Docker env] Mise en place Spring Hello World"

# FixMe : Il faaudra séparer le wrapper du contenu du TP
# TODO : Placé à la fin pour le debug
COPY src/main/tp-wrapper/ /usr/share/nginx/html/env/
