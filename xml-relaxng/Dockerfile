FROM jimetevenard/code-env:base

# Mise en place de l'env et du TP
# ===============================

COPY instructions.md /usr/share/nginx/html/env/

ENV GIT_REPOSITORY=https://github.com/jimetevenard/TP-RelaxNg.git


RUN mkdir /home/coder/jing \
    && curl --location --output /home/coder/jing/jing.jar "https://github.com/jimetevenard/TP-RelaxNg/blob/master/jing.jar?raw=true" \
    && echo "alias jing='java -jar /home/coder/jing/jing.jar'" > /home/coder/.bash_aliases