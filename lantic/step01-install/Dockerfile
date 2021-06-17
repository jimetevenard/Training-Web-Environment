FROM codercom/code-server:3.0.0
# Image Ubuntu avec code-server préinstallé

# code-server est une instance de VisualStudio Code
#  - qui s'éxécute sur le container
#  - accessible de l'extérieur depuis un navigateur web
#  - Cf. https://github.com/cdr/code-server


USER root

RUN apt-get update 

# Install et run NGINX
RUN apt-get install -y nginx








RUN apt-get install -y openjdk-11-jre-headless


WORKDIR /home/coder/project
RUN git clone https://github.com/jimetevenard/TP-RelaxNg.git .

# Création d'une commande alias pour jing
# ==================================

#  Les images Docker sont construites de façon scriptée via
#  un Dockerfile comme celui-ci ; le déploiement se fait
# en un clic / en une commande

#   On peut donc sans effort d'optimiser l'expérience
# stagiaire par ce genre de bonus (plus besoin de .bat / .sh)

RUN mkdir /opt/jing && mv ./jing.jar /opt/jing
RUN echo "alias jing='java -jar /opt/jing/jing.jar'" > /home/coder/.bash_aliases

# Mise à jour de la consigne du README avec l'alias
RUN sed -i 's/java -jar jing.jar/jing/g' README.md

# Commit des modifications (le répertoire est gité)
RUN git config --global user.name "Docker Env"
RUN git config --global user.email contact@jimetevenard.com
RUN git commit --all -m "[Docker env] Mise en place de l'environnement"


# Le dépot à été cloné par root
RUN chown -R coder /home/coder/project