FROM codercom/code-server:3.0.0
# Image Ubuntu avec code-server préinstallé

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


WORKDIR /home/coder/project

# Mise en place de l'env et du TP
# ===============================

RUN git clone https://github.com/jimetevenard/TP-RelaxNg.git . \
    && mkdir /opt/jing && mv ./jing.jar /opt/jing \
    && echo "alias jing='java -jar /opt/jing/jing.jar'" > /home/coder/.bash_aliases \
    && sed -i 's/java -jar jing.jar/jing/g' README.md \
    \
    && git config --global user.name "Docker Env" \
    && git config --global user.email contact@jimetevenard.com \
    && git commit --all -m "[Docker env] Mise en place de l'environnement" \
    && chown -R coder /home/coder/project \
