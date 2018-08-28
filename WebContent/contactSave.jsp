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
		
		// Cr�ation des variables de connection a la database bibliotheque
        String url = "jdbc:mysql://localhost:3306/Bibliotheque";
        String user = "root";
        String pwd= "Dauphyn1";
        
        // connection a la database Bibliotheque
   		// creation d'un objet nomm� con de la classe Connection
        Connection con=DriverManager.getConnection(url, user, pwd);
        
        // Cr�ation requ�te sql INSERT
        String sql = "insert into contacts values(?,?,?,?)";
        
        // Attention :
        //
        // Statement pour l'instruction SQL : SELECT
        //
        // PreparedStatement pour les instructions SQL : INSERT, UPDATE et DELETE
        PreparedStatement ps = con.prepareStatement(sql);
        
        // les m�thodes setString car nous ins�rons les donn�es dans la table contact
        // 1, 2, 3 et 4 sont les noms des colonnes de la table contact
        ps.setString(1,nom);
        ps.setString(2,prenom);
        ps.setString(3,email);
        ps.setString(4,telephone);
        
        // touche <Ctrl> + clic sur la m�thode
        //
        // la m�thode executeQuery est utilis�e pour l'instruction SELECT
        //
        // la m�thode executeUpdate est utilis�e pour les instructions INSERT, UPDATE et DELETE
        //
        // la m�thode executeUpdate retourne une valeur nomm�e s de type int
        // Si valeur s est sup�rieure a 0 alors result Ok
        // 								sinon result bad
        //
        // m�thode qui execute la requ�te SQL et retourne un status de type int
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