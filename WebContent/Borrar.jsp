<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@ page import="java.sql.*"%>


<meta charset="utf-8">
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">


<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	
	
	
	
	
	Borrado el artículo:
	<%
	out.println(request.getParameter("codigo"));
%>

	<%
		String nombreColumna1 = "Codigo";
		String nombreColumna2 = "Descripcion";
		String nombreColumna3 = "Precio";		
		String codigo = request.getParameter("codigo");
		String insert = "delete from articulos where codigo=?";

		Connection con = null;

		try {

			Class.forName("com.mysql.jdbc.Driver");

			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/base1", "root", "");
			
			//Statement statement = con.createStatement();
			PreparedStatement pS = con.prepareStatement(insert);

			pS.setInt(1, new Integer(codigo));
			//pS.setString(2, precio);			
			pS.executeUpdate();
			out.println("<script> alert(\"Borrardo con exito...\");</script>");
		} catch (Exception e){
			out.println("<script> alert(\"Error: " + e.getMessage() + "\");</script>");
		}
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
	</table><br />
	
		
	Borrar otro artículo <br />	
	<form action="Borrarimput.html" method="post">	
			 <input type="submit" name="Borrar" value="Borrar" >			
	</form><br />
	Otras Acciones	
	<form action="dia2.jsp" method="post">	
			 <input type="submit" name="registrar" value="Registrar" >			
	</form>			
	<form action="Actualizarimput.html" method="post">	
		<input type="submit" name="actualizar" value="Actualizar" >			
	</form>		
	<form action="consultarimput.html" method="post">
		<input type="submit" name="consultar" value="Consultar" >	
	</form>
</body>

</html>