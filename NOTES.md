# Notes (intégration wrapper via NGIX)

## Script de lancement

J'ai overridé l'ENTRYPOINT de coder avec un script pour avoir ET ngix et coder.
*Bonus* : le `--auth none` est embarqué, il n'est plus nécéssaire de l'ajouter lors du Docker run.

J'ai viré [fixuid](https://github.com/boxboat/fixuid) qui n'est pas utile pour mon cas d'usage (sert à fixer les user id avec les volumes, il n'y en aura pas dans mon cas)

**Par contre, ce truc pourrait me servir pour Jenkins LSS, à étudier...**

## Wrapper et conf 

Pas possible de faire un jeu complexe de redirections avec NGINX.  
De plus code-server semble devoir absolument être à la racine

Il faut donc accéder à /env/ pour avoir le wrapper :

- /env/* => HTML statique du wrapper via NGINX
- /* => Proxy vers Code-server

