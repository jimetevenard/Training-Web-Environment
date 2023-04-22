Environnement Java
==================

Bienvenue dans votre Environnement de travail Java

Il est basé sur [Visual Studio Code](https://code.visualstudio.com/).

Un JDK est installé, ainsi que l'extension Java pour VSCode

Import d'un projet
------------------

Les projets Java / Maven sont automatiquement importés.

*   Utilisez la vue **Java Projects** pour naviguer plus facilement dans les sources
*   Recherchez un fichier avec le menu  
    [Go To File](#editor::menu::Go/Go_to_File...)

Dépôt de fichiers
-----------------

Il est possible de grisser / déposer des fichiers ou des répertoires depuis votre ordinateur vers l'environnement.

*   Glissez un fichier ou un répertoire vers le volet [File Explorer](#editor::view::Explorer) situé sur la gauche de l'éditeur pour ajouter ces fichiers à l'environnement.

*   Glissez un fichier vers la zone principale de l'éditeur pour en ouvrir le contenu dans l'éditeur.

Clone d'un dépot Git
--------------------

Vous pouver ouvrir un terminal par le menu [Terminal > New Terminal](#editor::menu::Terminal/New_Terminal)

*   Saisir la commande  
    `git clone https://votre-depot...`
*   La [vue Source Control](#editor::view::Source_Control) permet de consulter l'état du dépot

Accédez à votre application
---------------------------

Pour accéder à un port lancé en local d'environnement depuis votre navigateur local (ou autre client Web : Postman...)

*   Utilisez l'URL <code class="env-url-prefix">/proxy/<PORT DE VOTRE APP></code>

Par exemple, pour accéder au port 8282 :  
 <a class="env-url-prefix" target="_blank" href="/proxy/8282">/proxy/8282</a>