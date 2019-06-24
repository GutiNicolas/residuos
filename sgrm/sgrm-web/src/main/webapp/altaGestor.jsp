<%@page import="java.util.ArrayList"%>
<%@page import="datatypes.DtZona"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Alta Gestor</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0">
<meta name="apple-mobile-web-app-capable" content="yes">
<link rel="icon" type="image/png"
	href="resources/assets/images/icons/favicon.ico" />
<link rel="stylesheet"
	href="https://fonts.googleapis.com/icon?family=Material+Icons">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css"
	integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO"
	crossorigin="anonymous">
<style type="text/css">
body {
	font-family: 'Roboto', sans-serif;
}

button[type=submit], input[type=button], input[type=submit], input[type=reset] {
	background-color: #FFC735;
	border: none;
	color: white;
}
</style>


</head>
<body>
	<jsp:include page="header.jsp" />
		<% if (request.getSession().getAttribute("usulogueado")==null) { %>
		<div class="container mt-20"> 
			<jsp:include page="accesoDenegado.html" />
		</div>
	<% } else {
		if (!(request.getSession().getAttribute("rol").toString().equals("admin"))) { %>
			<div class="container"> 
				<jsp:include page="accesoDenegado.html" />
			</div>
		<%} else { %>
	<%
		List<DtZona> zonas = (ArrayList<DtZona>) request.getAttribute("lstZonas");
		System.out.println("obtuve la lista de zonas");
	%>
	<div class="container">
		<div class="row justify-content-center">
			<div class="col-12 col-md-4">
				<div class="align-content-center pt-2">
					<div class="py-3 text-center" style="color: #00bfdf">
						<h2><strong>Ingresar nuevo gestor</strong></h2>
					</div>

					<!-- 	Para llamar a la funcion desde el boton -->
					<form class="was-validated" action="servletAltaGestor" method="post" name="altaGestor"
						onsubmit="return validate()">

						<div class="form-group align-items-center">
								<label for="titu">Nombre</label>
								<input type="text" class="form-control" id="titu" name="email" required>
								<div class="invalid-feedback">
						          Campo obligatorio.
						        </div>
						</div>
						<div class="form-group align-items-center">
								<label for="pwd">Apellido</label>
								<input type="text" class="form-control" id="pwd" name="pswd" required>
								<div class="invalid-feedback">
						          Campo obligatorio.
						        </div>
						</div>
						
						<div class="form-group  align-items-center">
						    <label for="exampleFormControlSelect1">Seleccionar zona</label>
						    <select class="form-control" id="exampleFormControlSelect1" name="cat" required>
						    <option value="">Seleccionar... </option>
						     <%
								System.out.println("antes del for");
								for (DtZona dtz : zonas) {
							%>
						    	<option value="<%=Long.toString(dtz.getId())%>"><%=Long.toString(dtz.getId())%></option>
						    <%} %> 						
						    </select>
						</div>
							<div class="form-group align-items-center">
									<label for="pwd">CI</label>
									<input type="text" class="form-control" id="pwdd" name="pwdd" required>
									<div class="invalid-feedback">
							          Campo obligatorio.
							        </div>
							</div>
						</div>
						<hr>
						<div class="form-group align-items-center">
							<button type="submit" id="confirmar" class="btn btn-warning btn-block">
								Ingresar gestor</button>
						</div>

					</form>
				</div>
			</div>
		</div>
	</div>
<%}} %>
	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.6/umd/popper.min.js" integrity="sha384-wHAiFfRlMFy6i5SRaxvfOCifBUQy1xHdJ/yoi7FRNXMRBu5WHdZYu1hA6ZOblgut" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/js/bootstrap.min.js" integrity="sha384-B0UglyR+jN6CkvvICOB2joaf5I4l3gm9GU6Hc1og6Ls7i6U/mkkaduKaBhlAXv9k" crossorigin="anonymous"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>	
<script src='https://npmcdn.com/@turf/turf/turf.min.js'></script>
</body>
</html>