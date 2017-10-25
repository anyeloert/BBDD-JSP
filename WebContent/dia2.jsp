<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<h3>Registrar Artículo</h3>
	<form action="resultadoForm.jsp" method="post">
		Descripcion<br> <input type="text" name="descripcion" required="required"> <br> 
		Precio<br> 
		<input	type="number" name="precio" step="0.01" required="required"><br>
		<br>
		<br> 
			 <input type="reset" name="limpiar" value="Limpiar">
			 <input type="submit" name="guardar" value="Registrar">
		<br />
		<br />		
		<br /> Otras Acciones<br />		<br />		
	</form>
	<form action="Actualizarimput.html" method="post">	
			 <input type="submit" name="actualizar" value="Actualizar" >			
	</form><br />			
	<form action="Borrarimput.html" method="post">	
		<input type="submit" name="borrar" value="Borrar" >			
	</form><br />		
	<form action="consultarimput.html" method="post">
		<input type="submit" name="consultar" value="Consultar" >	
	</form>
</body>
</html>