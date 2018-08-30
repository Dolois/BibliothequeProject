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
		// 1�re phase - Charger le driver
		Class.forName("com.mysql.jdbc.Driver");
		String url = "jdbc:mysql://localhost/Bibliotheque";
		String user = "root";
		String pwd = "Dauphyn1";
	
		// 2�me phase - Connection � notre base de donn�es users
		Connection cn = (Connection) DriverManager.getConnection(url, user, pwd);
	
		// 3�me phase - cr�ation d'une instance nomm�e st
		// de la classe Statement
		Statement st = (Statement) cn.createStatement();
	
		// Cr�ation de la requ�te SQL
		String sql = "SELECT * FROM livres";
		
		// 4�me phase - Ex�cution de la requ�te SQL
		ResultSet result = (ResultSet) st.executeQuery(sql);
		
		// Cr�ation d'une ArrayList de type Livre
		ArrayList<LivresModel> ListeLivre = new ArrayList<LivresModel>();
		
		while (result.next())
		{
			// cr�ation d'une instance nomm�e l de la classe LivresModel
			LivresModel l = new LivresModel();
			
			// affectation de nos valeur de notre objet result
			// provenant de la base de donn�es personne
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