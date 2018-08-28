Création : Projet Web Dynamique

dataBase : Bibliothèque
CREATE DATABASE Bibliotheque ;

Tables		      Formulaire		Instruction
livres						            SELECT
contacts		    Formulaire		INSERT
inscriptions		Formulaire		INSERT

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
) ;	

CREATE TABLE contacts (
	nom VARCHAR(60),
	prenom VARCHAR(60),
	email VARCHAR(80),
	telephone VARCHAR(20)
);

CREATE TABLE inscriptions (
	nom VARCHAR(60),
	prenom VARCHAR(60),
	email VARCHAR(80),
	password VARCHAR(50)
);
