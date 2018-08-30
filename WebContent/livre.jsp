<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="biblio.LivresModel" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="com.mysql.jdbc.Connection" %>
<%@ page import="com.mysql.jdbc.Statement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="java.util.ArrayList" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Liste de tous les livres</title>
</head>
<body>

<%
	try
	{
		// 1ère phase - Charger le driver
		Class.forName("com.mysql.jdbc.Driver");
		String url = "jdbc:mysql://localhost/Bibliotheque";
		String user = "root";
		String pwd = "Dauphyn1";
	
		// 2ème phase - Connection à notre base de données Bibliotheque
		Connection cn = (Connection) DriverManager.getConnection(url, user, pwd);
	
		// 3ème phase - création d'une instance nommée st
		// de la classe Statement
		Statement st = (Statement) cn.createStatement();
	
		// Création de la requête SQL
		String sql = "SELECT * FROM livres";
		
		// 4ème phase - Exécution de la requête SQL
		ResultSet result = (ResultSet) st.executeQuery(sql);
		
		// Création d'une ArrayList de type LivresModel
		ArrayList<LivresModel> ListeLivre = new ArrayList<LivresModel>();
		
		while (result.next())
		{
			// création d'une instance nommée l de la classe LivresModel
			LivresModel l = new LivresModel();
			
			// affectation de nos valeur de notre objet result
			// provenant de la base de données Bibliotheque
			l.setTitre(result.getString("titre"));
			l.setAuteur(result.getString("auteur"));
			l.setEditeur(result.getString("editeur"));
			
			// ajouter dans l'ArrayList 
			ListeLivre.add(l);
		}
			
		// Afficher tous le contenu de l'ArrayList
		out.print("<h3><ol>");
		for (int i = 0; i < ListeLivre.size(); i++)
		{
			out.print("<li>" + ListeLivre.get(i).getTitre());
			out.print(" ");
			out.print(ListeLivre.get(i).getAuteur());
			out.print(" ");
			out.println(ListeLivre.get(i).getEditeur());
			out.print("</li>");
		}
		out.print("</ol></h3>");
	}
	catch (ClassNotFoundException e)
	{
		e.printStackTrace();
	} 
	catch (SQLException e) 
	{
		e.printStackTrace();
	}
%>

</body>
</html>
