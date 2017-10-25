<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@ page import="java.sql.*"%>


         


<meta charset="utf-8">
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import = "recursosPropios.MisExcepciones" %>

<html>

<head>

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title></title>


</head>
<body>	


	<%
		String nombreColumna1 = "Codigo";
		String nombreColumna2 = "Descripcion";
		String nombreColumna3 = "Precio";
		String desc = request.getParameter("descripcion");
		String precio = request.getParameter("precio");
		String codigo = request.getParameter("codigo");
		String select = "SELECT * FROM articulos WHERE codigo = ?";

		Connection con = null;

		try {

			Class.forName("com.mysql.jdbc.Driver");

			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/base1", "root", "");
			PreparedStatement pS = con.prepareStatement(select);
			pS.setInt(1, Integer.parseInt(codigo));
			ResultSet rs = pS.executeQuery();%>
			
			<table> 
		<tr>
			<th><%=nombreColumna1%></th>
			<th><%=nombreColumna2%></th>
			<th><%=nombreColumna3%></th> 
		</tr>
		<%	while (rs.next()) { %>
		<tr>
			<td><%= rs.getInt(1) %></td>
			<td><%= rs.getString(2) %></td>
			<td><%= rs.getFloat(3) %></td>
		</tr>
		<%	} %>
	</table>
			
			
		<%} catch (Exception e){
			String query = "SELECT * FROM ARTICULOS";
			Statement statement = con.createStatement();
			ResultSet rs = statement.executeQuery(query);
		%>
		<table> 
			<tr>
				<th><%=nombreColumna1%></th>
				<th><%=nombreColumna2%></th>
				<th><%=nombreColumna3%></th> 
			</tr>
			<%	while (rs.next()) { %>
			<tr>
				<td><%= rs.getInt(1) %></td>
				<td><%= rs.getString(2) %></td>
				<td><%= rs.getFloat(3) %></td>
			</tr>
			<%	} %>
		</table>

		<%	} %>
		
			
		
	<br />
	
		
	Hacer otra consulta <br />	
	<form action="consultarimput.html" method="post">	
			 <input type="submit" name="consultar" value="Consultar" >			
	</form><br />
	Otras Acciones	
	<form action="dia2.jsp" method="post">	
			 <input type="submit" name="registrar" value="Registrar" >			
	</form>			
	<form action="Actualizarimput.html" method="post">	
		<input type="submit" name="actualizar" value="Actualizar" >			
	</form>		
	<form action="Borrarimput.html" method="post">
		<input type="submit" name="borrar" value="Borrar" >	
	</form>
	
</body>
</html>