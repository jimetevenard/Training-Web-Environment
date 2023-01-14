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
    && apt-get install -y openjdk-11-jre-headless

# Wrapper HTML et reverse-proxy Nginx
# ===================================

EXPOSE 80/tcp

RUN mkdir /usr/share/nginx/html/env/
# FixMe : Il faaudra séparer le wrapper du contenu du TP
COPY src/main/tp-wrapper/ /usr/share/nginx/html/env/
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

RUN git clone https://github.com/jimetevenard/TP-RelaxNg.git /home/coder/project \
    && mkdir /home/coder/jing && mv /home/coder/project/jing.jar /home/coder/jing \
    && echo "alias jing='java -jar /home/coder/jing/jing.jar'" > /home/coder/.bash_aliases \
    && sed -i 's/java -jar jing.jar/jing/g' /home/coder/project/README.md

COPY src/main/vscode/settings.json /home/coder/project/.vscode/settings.json

RUN cd /home/coder/project \
    && git config --global user.name "Docker Env" \
    && git config --global user.email contact@jimetevenard.com \
    && git add --all && git commit -m "[Docker env] Mise en place de l'environnement"
