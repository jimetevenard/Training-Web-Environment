FROM code-env:post-install

EXPOSE 80/tcp


# COOPIE du rep wrapper
RUN mkdir /usr/share/nginx/html/env/
COPY tp-wrapper/ /usr/share/nginx/html/env/

# COPIE de la conf
COPY nginx.conf /etc/nginx

# TODO CECI EST COMMUN AUSSI
COPY docker-init.sh /home/coder/
RUN chmod +x /home/coder/docker-init.sh

# Retour à l'user et au pwd de fin de Dockerfile parent. Utile ? (lancement ?)
# OUI, utile ! (dumb-init coder .)
USER coder
WORKDIR /home/coder



ENTRYPOINT ["dumb-init", "sh", "docker-init.sh"]