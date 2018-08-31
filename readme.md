# Création : Projet Web Dynamique

CREATE DATABASE Bibliotheque ;

USE Bibliotheque ;

CREATE TABLE livres (
	id_livre INT NOT NULL AUTO_INCREMENT,
	titre VARCHAR(60),
	auteur VARCHAR(50),
	editeur VARCHAR(60)
	PRIMARY KEY ( id_livre )
);

1ère tache : Lister tous les livres de la table livres

CREATE TABLE contacts (
	nom VARCHAR(60),
	prenom VARCHAR(60),
	email VARCHAR(80),
	telephone VARCHAR(20)
);

2ème tache : créer un formulaire contacts (gérer les inserts)

CREATE TABLE inscriptions (
	nom VARCHAR(60),
	prenom VARCHAR(60),
	email VARCHAR(80),
	password VARCHAR(50)
);

3ème tache : créer un formulaire inscriptions (gérer les inserts)

création d'un fichier logo.html
création d'un fichier footer.html

création d'un fichier contact.jsp (page jsp d'accueil, formulaire)
création d'un fichier inscription.jsp (formulaire)
création d'un fichier contactSave.jsp (sauvegardes des données dans la table contacts)
création d'un fichier inscriptionSave.jsp (sauvegardes des données dans la table inscriptions)
création d'un fichier livres.jsp (liste de tous les livres de la table livres)



