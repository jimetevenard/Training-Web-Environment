FROM jimetevenard/code-env:base

COPY instructions.md /usr/share/nginx/html/env/

# Mise en place de l'env
# ======================

RUN code-server --install-extension vscjava.vscode-java-pack
# RUN code-server --install-extension Pivotal.vscode-boot-dev-pack [Trop lourd, pas indispensable]

ENV GIT_REPOSITORY=https://github.com/jimetevenard/spring-hello-world.git