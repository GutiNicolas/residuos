<%@page import="java.util.ArrayList"%>
<%@page import="datatypes.DtZona"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">

<meta charset="UTF-8">
<title>Reciclando</title>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">
<link href="https://fonts.googleapis.com/css?family=Roboto"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.3.1/css/all.css"
	integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU"
	crossorigin="anonymous">
<link rel="stylesheet" href="home.css">

<style>
body {
	font-family: 'Roboto', sans-serif;
}
</style>
</head>
<body>
	<jsp:include page="header.jsp" />
			
	<%
 
			List<DtZona> zonas = (ArrayList<DtZona>) request.getAttribute("lstZonas");
			System.out.println("obtube la lista de zonas");
	%>		
			
	<div class="container">
		<div class="row col-12">
			<h2 style="color: #fff;"><strong>0</strong></h2>
		</div>
		<div class="row col-12 justify-content-center">
			<br>
			<span style="color: #00bfdf;"><i class="fas fa-truck fa-3x py-15"></i></span>
		</div>
		<div class="row justify-content-center col-12">
			<h2 style="color: #00bfdf;"><strong>Registrar un camión</strong></h2>
		</div>
	</div>
	
	<div class="container">
		<div class="row justify-content-center col-12">	
		<form action="Camiones" method="post">
				<div class="form-group">
					<label for="mat">Matrícula</label> <input type="text"
						class="form-control" id="formMat" name="mat">


					<div class="form-group">
						<label for="sel1">Zona:</label> <select class="form-control"
							id="sel1" name="idZona">

							<%
		      	System.out.println("antes del for");
					for (DtZona dtz : zonas) {
			%>
							<option name="optId"><%=dtz.getId()%></option>
							<%
					}
			%>
						</select>
					</div>

					<div class="col-12 justify-content-center">
						<button type="submit" class="btn btn-info" style="background-color: #51cf92; color: #fff; border-color: #51cf92">Enviar</button>
					</div>
			</form>
		</div>
	</div>

<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
</body>
</html>