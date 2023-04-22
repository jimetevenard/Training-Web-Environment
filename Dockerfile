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

COPY _common/nginx/nginx.conf /etc/nginx
COPY _common/sh/docker-init.sh /home/coder/

# Adaptation du lancement
# ======================

RUN chmod +x /home/coder/docker-init.sh
ENTRYPOINT ["dumb-init", "sh", "docker-init.sh"]


USER coder

RUN git config --global user.name "Docker Env" \
    && git config --global user.email contact@jimetevenard.com

COPY --chown=coder:coder _common/vscode/settings.json /home/coder/.local/share/code-server/User/settings.json

COPY _common/tp-wrapper/ /usr/share/nginx/html/env/