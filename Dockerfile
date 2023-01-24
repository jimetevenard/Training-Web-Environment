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
    && apt-get install -y nginx openjdk-11-jdk-headless \
    && rm -rf /var/lib/apt/lists/*


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

RUN git config --global user.name "Docker Env" \
    && git config --global user.email contact@jimetevenard.com

# ===============================================================
# ===============================================================
# FixMe : Ce qui précède est générique (hormis le HTML du TP) et
# doit être migré vers un repo dédié. Ce qui suit est spécifique.
# ===============================================================
# ===============================================================



# Mise en place de l'env et du TP
# ===============================

RUN code-server --install-extension vscjava.vscode-java-pack
# RUN code-server --install-extension Pivotal.vscode-boot-dev-pack [Trop lourd, pas indispensable]

COPY --chown=coder:coder src/main/vscode/settings.json /home/coder/.local/share/code-server/User/settings.json

RUN mkdir /home/coder/workspace/ && cd /home/coder/workspace/ \
    && git clone https://github.com/jimetevenard/spring-hello-world.git \
#   ## Le port 8080 est déjà occupé par code-server (VSCode) => 8282
    && echo "\nserver.port=8282" >> spring-hello-world/src/main/resources/application.properties \
    && cd /home/coder/workspace/spring-hello-world \
    && git add --all && git commit -m "[Docker env] Mise en place Spring Hello World"

# FixMe : Il faudra séparer le wrapper du contenu du TP
# TODO : Placé à la fin pour le debug
COPY src/main/tp-wrapper/ /usr/share/nginx/html/env/
