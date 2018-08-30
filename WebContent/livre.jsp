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
		// 1ere phase - Charger le driver
		Class.forName("com.mysql.jdbc.Driver");
		String url = "jdbc:mysql://localhost/Bibliotheque";
		String user = "root";
		String pwd = "Dauphyn1";
	
		// 2eme phase - Connection a notre base de donnees Bibliotheque
		Connection cn = (Connection) DriverManager.getConnection(url, user, pwd);
	
		// 3eme phase - creation d'une instance nommee st
		// de la classe Statement
		Statement st = (Statement) cn.createStatement();
	
		// Creation de la requete SQL
		String sql = "SELECT * FROM livres";
		
		// 4eme phase - Execution de la requete SQL
		ResultSet result = (ResultSet) st.executeQuery(sql);
		
		// Creation d'une ArrayList de type LivresModel
		ArrayList<LivresModel> ListeLivre = new ArrayList<LivresModel>();
		
		while (result.next())
		{
			// creation d'une instance nommee l de la classe LivresModel
			LivresModel l = new LivresModel();
			
			// affectation de nos valeur de notre objet result
			// provenant de la base de donnees Bibliotheque
			l.setTitre(result.getString("titre"));
			l.setAuteur(result.getString("auteur"));
			l.setEditeur(result.getString("editeur"));
			l.setUrl(result.getString("url"));
			
			// ajouter dans l'ArrayList 
			ListeLivre.add(l);
		}
			
		// Afficher tous le contenu de l'ArrayList
		out.print("<h3><ol>");
		for (int i = 0; i < ListeLivre.size(); i++)
		{
			out.print("<li>");
			out.print("<a href=\"" + ListeLivre.get(i).getUrl() + "\"" + ">");
			out.print(ListeLivre.get(i).getTitre());
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
