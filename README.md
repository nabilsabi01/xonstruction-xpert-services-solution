# ConstructionXpert Services - Gestion de Projets de Construction

Cette application web permet à l'équipe de ConstructionXpert Services de créer et de gérer des projets de construction, d'assigner des tâches aux membres de l'équipe, de gérer les ressources nécessaires et de suivre les détails des projets et des tâches.

## Table des Matières

- [Fonctionnalités](#fonctionnalités)
- [Technologies Utilisées](#technologies-utilisées)
- [Prérequis](#prérequis)
- [Installation](#installation)

## Fonctionnalités

- **Gestion des Projets**
  - Créer un nouveau projet
  - Afficher la liste des projets
  - Mettre à jour les détails d'un projet
  - Supprimer un projet

- **Gestion des Tâches**
  - Créer une nouvelle tâche pour un projet
  - Afficher la liste des tâches associées à un projet
  - Mettre à jour les détails d'une tâche
  - Supprimer une tâche

- **Gestion des Ressources**
  - Ajouter de nouvelles ressources
  - Afficher la liste des ressources disponibles
  - Mettre à jour les détails d'une ressource
  - Supprimer une ressource

## Technologies Utilisées

- **Frontend**
  - HTML, CSS, Bootstrap, JavaScript
- **Backend**
  - Java EE (Servlets, JSP)
  - JDBC API pour la communication avec la base de données
  - Serveur d'application Apache Tomcat
- **Base de Données**
  - MySQL
- **Outils de Développement**
  - IntelliJ IDEA, Maven
  - Git pour le contrôle de version

## Prérequis

- JDK 17
- Apache Tomcat 9
- MySQL
- Maven
- IntelliJ IDEA

## Installation

1. **Clonez le dépôt :**

    ```sh
    git clone https://github.com/construction-xpert-services-solution.git
    cd construction-xpert-services-solution
    ```

2. **Configurez la base de données :**

    - Créez une base de données MySQL.
    - Importez le script SQL fourni dans le dossier `db` pour créer les tables nécessaires.
    - Par exemple, utilisez un outil comme MySQL Workbench ou la ligne de commande :

    ```sh
    mysql -u root -p constructionxpert_db < db/schema.sql
    ```

3. **Configurez le fichier `db.properties` avec vos informations de connexion à la base de données :**

    ```properties
    db.url=jdbc:mysql://localhost:3306/constructionxpert_db
    db.username=root
    db.password=
    ```

4. **Ouvrez le projet dans IntelliJ IDEA :**

    - Sélectionnez `File > Open` et choisissez le répertoire du projet.
    - IntelliJ IDEA détectera automatiquement le projet Maven et importera les dépendances.

5. **Configurez votre serveur Tomcat dans IntelliJ IDEA :**

    - Allez dans `Run > Edit Configurations`.
    - Cliquez sur le bouton `+` et sélectionnez `Tomcat Server > Local`.
    - Configurez votre Tomcat en pointant vers l'installation de Tomcat sur votre machine.
    - Ajoutez l'artifact généré par Maven (`constructionxpert-services-solution:war`) à la configuration.

6. **Déployez et lancez l'application :**

    - Cliquez sur `Run` (ou utilisez le raccourci `Shift + F10`).
    - Accédez à l'application via : `http://localhost:8080/constructionxpert_services_solution_war_exploded/`
