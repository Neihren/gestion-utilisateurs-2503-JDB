# DOCKER IMAGE MariaDB 11

> Dans les instructions de ce document, remplacer `mdevoldere` par votre nom d'utilisateur de votre compte Docker HUB.

## Générer l'image 

1. Ouvrir un terminal et se positionner dans le répertoire du Dockerfile
2. Saisir la commande : 
    - `docker build . mdevoldere/mariadb:11`

## Créer un conteneur

1. Dans un terminal, saisir la commande :
 - `docker run -d -p 4006:3306 --name mdevoldere-mariadb11 -v mariadb11-data:/var/lib/mysql -v ./sql/init.sql:/docker-entrypoint-initdb.d/init.sql mdevoldere/mariadb:11`


 ## Tester la connexion

Se connecter au serveur avec les identifiants renseignés dans le Dockerfile

Vous pouvez utiliser l'un des outils suivants : 

- MySQL Workbench
- HeidiSQL
- Un terminal ^^

## Sauvegarder l'image sur le HUB Docker

> Vous devez posséder un compte sur [hub.docker.com](https://hub.docker.com) 

- [Pousser une image sur Docker HUB](https://docs.docker.com/get-started/introduction/build-and-push-first-image/)
