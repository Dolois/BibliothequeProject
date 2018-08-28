<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="biblio.LivresClass" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
  <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
  <title>Contactez nous !</title>
</head>

  <body>
  	<jsp:include page="logo.html"></jsp:include>

	<div id="nav">
	   <ul>
	   		<li><a href=livre.jsp>Nos Livres</a></li>
	   		<li><a href=contact.jsp>Contactez-nous !</a></li>
	     	<li><a href=inscription.jsp>Inscrivez-vous !</a></li>
	   </ul>
	   <div class="clear"> </div>
	</div>
  	
    <form action="contactSave.jsp">            
    	<table>
        	<tr>	<td>Name:</td>		<td><input type="text" name="nom"></td>			</tr>
        	<tr>	<td>Prenom:</td>	<td><input type="text" name="prenom"></td>		</tr>
        	<tr>	<td>Email:</td>		<td><input type="text" name="email"></td>		</tr>
        	<tr>	<td>Telephone:</td>	<td><input type="text" name="telephone"></td>	</tr>
        	
        	<tr>	<td><input type="submit" value="Submit"></td>						</tr>
		</table>            
    </form>
    
    <jsp:include page="footer.html"></jsp:include>
            
  </body>
</html>