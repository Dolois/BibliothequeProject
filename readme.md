## Création : Projet Web Dynamique

CREATE DATABASE Bibliotheque ;

footer.html
logo.jpg

CREATE DATABASE Bibliotheque ;

USE Bibliotheque ;

CREATE TABLE livres (
	id_livre INT NOT NULL AUTO_INCREMENT,
	titre VARCHAR(60),
	auteur VARCHAR(50),
	editeur VARCHAR(60)
	PRIMARY KEY ( id_livre )
);

Lister tous les livres de la table livres

CREATE TABLE contacts (
	nom VARCHAR(60),
	prenom VARCHAR(60),
	email VARCHAR(80),
	telephone VARCHAR(20)
);

Formulaire contacts (insert)

CREATE TABLE inscriptions (
	nom VARCHAR(60),
	prenom VARCHAR(60),
	email VARCHAR(80),
	password VARCHAR(50)
);

Formulaire inscriptions (insert)
