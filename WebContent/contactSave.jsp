<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
<%@ page import="java.sql.*" %>

<%
	try
	{
		String nom = request.getParameter("nom");
		String prenom = request.getParameter("prenom");
		String email = request.getParameter("email");
		String telephone = request.getParameter("telephone");
		
		// chargement du driver jdbc
		Class.forName("com.mysql.jdbc.Driver");
		
		// Création des variables de connection a la database bibliotheque
        String url = "jdbc:mysql://localhost:3306/Bibliotheque";
        String user = "root";
        String pwd= "Dauphyn1";
        
        // connection a la database Bibliotheque
   		// creation d'un objet nommé con de la classe Connection
        Connection con=DriverManager.getConnection(url, user, pwd);
        
        // Création requête sql INSERT
        String sql = "insert into contacts values(?,?,?,?)";
        
        // Attention :
        //
        // Statement pour l'instruction SQL : SELECT
        //
        // PreparedStatement pour les instructions SQL : INSERT, UPDATE et DELETE
        PreparedStatement ps = con.prepareStatement(sql);
        
        // les méthodes setString car nous insérons les données dans la table contact
        // 1, 2, 3 et 4 sont les noms des colonnes de la table contact
        ps.setString(1,nom);
        ps.setString(2,prenom);
        ps.setString(3,email);
        ps.setString(4,telephone);
        
        // touche <Ctrl> + clic sur la méthode
        //
        // la méthode executeQuery est utilisée pour l'instruction SELECT
        //
        // la méthode executeUpdate est utilisée pour les instructions INSERT, UPDATE et DELETE
        //
        // la méthode executeUpdate retourne une valeur nommée s de type int
        // Si valeur s est supérieure a 0 alors result Ok
        // 								sinon result bad
        //
        // méthode qui execute la requête SQL et retourne un status de type int
        int s = ps.executeUpdate();
        
        if (s > 0)
        {
			%>
				<jsp:forward page="contact.jsp"></jsp:forward>
			<% 
        }
        else
        {
        	out.print("Sorry ! Please fill correct detail and try again");
        }
	}
	catch(Exception e)
	{
		e.printStackTrace();
		out.print("Sorry ! Please fill correct detail and try again");
	}
%>