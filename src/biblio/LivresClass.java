package biblio;

import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.mysql.jdbc.Connection;
import com.mysql.jdbc.Statement;

public class LivresClass
{
	// creation d'une méthode pour ouvrir la connection
	// cette méthode retourne une variable de type Connection
	// de la classe Connection
	public static Connection openConnection(Statement st) 
	{
		// déclarations de variables de connection
		Connection cn = null;
		
		String url  = "jdbc:mysql://localhost/cinema?autoReconnect=true&useSSL=false";
		String user = "root";
		String pwd  = "Dauphyn1";

		// récupération du driver (chemin du driver de jdbc)
		try
		{
			// lancement du driver
			Class.forName("com.mysql.jdbc.Driver");
			System.out.println(".Driver Ok");
			
			// récupération de la connection
			// type cast = convertion d'un type vers autre type 
			cn = (Connection) DriverManager.getConnection(url, user, pwd);
		}
		
		// la classe mère des exceptions est Exception
		//
		// pour gérer tous les types Exceptions
		// catch (Exception e)
		//
		// ici nous gérons les exceptions Class 
		catch (ClassNotFoundException e)
		{
			e.printStackTrace();
		}
		
		// ici nous gérons les exceptions SQL
		catch (SQLException e)
		{
			e.printStackTrace();
		}
		System.out.println("..Connection Ok");
		
		// retourne la connection
		return cn;
	}
	
	// creation d'une méthode pour fermer la Connection et le Statement
	public static void closeConnection(Connection cn, Statement st)
	{
		// évènement aléatoire
		// donc utilisation d'un try
		// pour la gestion d'erreurs
		try {
			cn.close();
			st.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		System.out.println("...Déconnection Ok");
	}
	
	// creation d'une méthode pour exécuter la 1ère requête SQL
	public static Statement requeteSQL_1(Connection cn)
	{
		Statement st = null;
		
		// création du statement
		try
		{
			// creation d'un statement
			st = (Statement) cn.createStatement();
			
			// liste de toutes les occurences de la table personne
			String sql = "SELECT * FROM livres";
			
			// la classe ResultSet permet d'exécuter une requête
			// creation d'une instance result de la classe ResultSet
			// pour stocker le resultat de la requête
			ResultSet result = (ResultSet) st.executeQuery(sql);
			
			String titre;
			String auteur;
			String editeur;
			
			while(result.next())
			{
				titre = result.getString("titre");
				auteur = result.getString("auteur");
				editeur = result.getString("editeur");
				System.out.println(auteur + " a écrit le livre " + titre + " édité par " + editeur);
			}
			
		} catch (SQLException e)
		{
			e.printStackTrace();
		}
		return st;
	}

	public static void main(String[] args)
	{
		Connection cn = null;
		Statement st = null;
		
		// appelle de la méthode de connection
		cn = openConnection(st);
		System.out.println("");
		
		// création et exécution de la 1ère requete SQL
		st = requeteSQL_1(cn);
		System.out.println();
		
		// appelle de la méthode de fermeture
		closeConnection(cn, st);
	}
}
