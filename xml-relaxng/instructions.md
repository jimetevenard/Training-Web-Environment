TP Relax NG
===========

> TODO je suis Markdown !!

Dans ce TP, vous allez valider un document XML avec un schéma RelaxNG.

Vous devrez compléter le fichier `livres-init.rng` pour qu'il valide le document `livres.xml`.

Exercice 1
----------

Ouvrir les fichiers `livres.xml` et `livres-init.xml` dans l'éditeur.

Le format du document `livres.xml` est le suivant :

L'élément racine est `<bibliotheque>`, composé de 0 à plusieurs `<livres>`

Le `<livre>` possède un attribut `@isbn` obligatoire (10 caractères)  
Le `<livre>` possède un attribut `@nombrePages` optionnel (Nombre entier.)

Le `<livre>` est composé :

*   D'un `<titre>` et d'un `<auteur>`, dans n'importe quel ordre. et d'un `<personnage>` optionnel.
*   Un `<auteur>` est composé d'un `<nom>`, d'un `<prenom>` et d'une `<precision>` optionnelle.
*   Un `<personnage>` est composé soit :
    *   d'un `<nom>` et d'un `<prenom>`
    *   d'un `<surnom>`

Complétez le fichier `livres-init.xml` pour qu'il valide ce document.

### Vérifiez votre travail

Nous allons valider le fichier livres.xml avec notre schéma.

Ouvrir le terminal intégré à l'éditeur.

Lancer la commande suivante :

````
jing livres-init.rng livres.xml
````

La validation ne doit renvoyer aucune erreur.

Nous allons maintenant valider un document non conforme au schéma.

*   lancer `jing livres-init.rng livres-invalide.xml`

**Vérifier que des erreurs de validation sont bien levées.**

Solution
--------

Le répertoire `solution/` contient un fichier rng valide. (mais d'autres solutions sont possibles...)