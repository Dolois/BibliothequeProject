package biblio;

public class LivresModel 
{
	int idLivre;
	String titre;
	String auteur;
	String editeur;
	public int getIdLivre() {
		return idLivre;
	}
	public void setIdLivre(int idLivre) {
		this.idLivre = idLivre;
	}
	
	public String getTitre() {
		return titre;
	}
	public void setTitre(String titre) {
		this.titre = titre;
	}
	
	public String getAuteur() {
		return auteur;
	}
	public void setAuteur(String auteur) {
		this.auteur = auteur;
	}
	
	public String getEditeur() {
		return editeur;
	}
	public void setEditeur(String editeur) {
		this.editeur = editeur;
	}
}