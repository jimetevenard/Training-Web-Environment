FROM jimetevenard/code-env:base

# Mise en place de l'env et du TP
# ===============================

COPY instructions.md /usr/share/nginx/html/env/


RUN git clone https://github.com/jimetevenard/TP-RelaxNg.git /home/coder/project \
    && mkdir /home/coder/jing && mv /home/coder/project/jing.jar /home/coder/jing \
    && echo "alias jing='java -jar /home/coder/jing/jing.jar'" > /home/coder/.bash_aliases \
    && sed -i 's/java -jar jing.jar/jing/g' /home/coder/project/README.md

RUN cd /home/coder/project && git add --all && git commit -m "[Docker env] Mise en place de l'environnement"