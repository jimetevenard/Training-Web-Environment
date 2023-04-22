# Env Docker - Java

Environnement pédagogique web - Java

Basé sur [codercom/code-server](https://github.com/cdr/code-server), il expose un éditeur [VSCode](https://code.visualstudio.com/) online, accessible depuis un navigateur web.  

Un dépôt Git peut être cloné au lancement du *container* : son URL doit être fournie via la variable d'environnement `GIT_REPOSITORY`

Aucune *authentication* n'est actuellement gérée : le repository doit être plublic.  
Si aucune URL n'est fournie, le repository [Spring Hello World](https://github.com/jimetevenard/spring-hello-world) sera clonné.

## Lancement et utilisation

Cette image est publiée automatiquement sur le dépôt central [Docker Hub](https://hub.docker.com/r/jimetevenard/code-env/tags) à chaque *commit* sur la branche *master* de ce *repo*. (cf [workflow Github](.github/workflows/docker-image.yml))

````
# Pull de l'image depuis Docker Hub (facultatif, sera fait lors du run à défaut)
docker pull jimetevenard/code-env:java-beta

# lancement d'un container et exposition du port 80 en local
docker run -d -p 127.0.0.1:80:80 jimetevenard/code-env:java-beta
````

### Accès depuis un navigateur

Accéder ensuite à <http://localhost/>  

L'éditeur s'ouvre alors sur le projet du TP !  
La consigne du TP est affichée à droite de l'application.


![Screenshot Code Server](docs/screenshot-code-env-java.png)

### Test de l'environnement du TP

L'utilitaire *Jing* est disponible dans le *path* du container.

Exemple : [ouvrir le terminal intégré à VSCode](https://code.visualstudio.com/docs/editor/integrated-terminal) et taper la commande suivante :

````
# Valider avec Jing le fichier livres.xml avec le schéma livres-init.xml
jing livres-init.rng livres.xml
````

### Notes

* le fait de spécifier l'hôte local dans le mapping de port `-p 127.0.0.1:80:80` restreint l'exposition du serveur à la machine hôte.

  * On aurait pu exploser ce port `80` à l'exterieur de l'hôte (si celui-ci est accessible depuis Internet ou un réseau) avec simplement `-p 80:80`.
  * Cela n'est toutefois pas recommandé, on préferera utiliser un *reverse proxy* (avec chiffrement TLS pour servir en HTTPS) pour exposer notre container. L'usage d'un serveur en *reverse proxy* permet également de mapper un (sous-)domaine différent pour chacun des conteneurs.  
  * Code-server est néanmois capable de gérer lui-même les certificats TLS. (voir § Liste des *args* de *code-server*)

* Le script de lancement spécifie l'option `--auth none` pour désactiver l'authentification par mot de passe de code-server (de façon à générer nous même l'authentification)

* Il peut être utile de faire un *volume* sur le répertoire du projet (pour le conserver à l'extérieur du container : `-v "/somwhere/on/host:/home/coder/project"`

## Build en local du Dockerfile

Pour tester une modification en local du Dockerfile ou des sources, vous pouvez builder vous-même l'image :

````
# build de l'image de ce dépot
docker build -t code-env:relaxng .
````

## Annexe : Liste complète des *args* de *code-server*

Peut être obtenu avec `docker exec <CONTAINER_ID> code-server --help`.


