FROM code-env:post-install


# TODO CECI EST COMMUN AUSSI
COPY docker-init.sh /home/coder/
RUN chmod +x /home/coder/docker-init.sh

# Retour à l'user et au pwd de fin de Dockerfile parent. Utile ? (lancement ?)
# OUI, utile ! (dumb-init coder .)
USER coder
WORKDIR /home/coder



ENTRYPOINT ["dumb-init", "sh", "docker-init.sh"]