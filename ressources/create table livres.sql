USE Bibliotheque;

CREATE TABLE livres (
	id_livre INT NOT NULL AUTO_INCREMENT,
	titre VARCHAR(60),
	auteur VARCHAR(50),
	editeur VARCHAR(60),
	PRIMARY KEY ( id_livre )
);



