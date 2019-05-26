<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.util.ArrayList"%>
<!DOCTYPE html>
<html>
<head>
<!-- <meta charset="ISO-8859-1"> -->
	<title>Alta Gestor</title>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
	<link rel="icon" type="image/png" href="resources/assets/images/icons/favicon.ico"/>
	<link rel="stylesheet" type="text/css" href="resources/assets/vendor/bootstrap/css/bootstrap.min.css">
	<link rel="stylesheet" type="text/css" href="resources/assets/fonts/font-awesome-4.7.0/css/font-awesome.min.css">
	<link rel="stylesheet" type="text/css" href="resources/assets/vendor/animate/animate.css">	
	<link rel="stylesheet" type="text/css" href="resources/assets/vendor/css-hamburgers/hamburgers.min.css">
	<link rel="stylesheet" type="text/css" href="resources/assets/vendor/select2/select2.min.css">
	<link rel="stylesheet" type="text/css" href="resources/assets/css/util.css">
	<link rel="stylesheet" type="text/css" href="resources/assets/css/main.css">

	<link href="https://fonts.googleapis.com/css?family=Roboto" rel="stylesheet">
	
	<style>
	     body {
        font-family: 'Roboto', sans-serif;
      }
	
	</style>
<title>Insert title here</title>
</head>
<body>
	<div class="container-fluid">
		<div class="align-content-center pt-2">
			<div class="py-5 text-center" style="color: #35CA97;">
				<h2>Ingresar nuevo gestor</h2>
			</div>

			<!-- 	Para llamar a la funcion desde el boton -->
			<form action="servletAltaGestor" method="post" name="altaGestor" onsubmit="return validate()">

				<div class="row justify-content-center">
					<div class="col-12 col-md-6 col-lg-4">
						<label for="titu">Nombre *</label> <input type="text"
							class="form-control" id="titu" name="email" required="true">
					</div>
					<div class="col-12 col-md-6 col-lg-4">
						<label for="pwd">Apellido *</label> <input type="text"
							class="form-control" id="pwd"
							name="pswd" required="true">

					</div>
				</div>

				<div class="row justify-content-center  mt-4">
					<div class="col-12 col-md-6 col-lg-4">
						
					</div>
					<div class="col-12 col-md-6 col-lg-4">
					<!-- 	<label for="pwd">Re-enter password *</label> <input type="password"
							class="form-control" id="pwd" placeholder="Ingresar Contrasea"
							name="pswd" required="true"> -->
					</div>
				</div>

				
				<div class="row justify-content-center  mt-4">

					<div class="form-check col-12 col-md-6 col-lg-4">
						
						<div id="accordion">
							<div class="card">
								<div class="card-header bg-white" id="headingOne">
									<h5 class="mb-0">
										<button class="btn btn-link" data-toggle="collapse"
											data-target="#collapseOne" aria-expanded="true"
											aria-controls="collapseOne" style="text-decoration: none">
											<h5 style="text-decoration: none; color: #35CA97;">Zonas</h5>
										</button>
									</h5>
								</div>

								<div id="collapseOne" class="collapse"
									aria-labelledby="headingOne" data-parent="#accordion">
									<div class="card-body">
										<%-- <%
											ArrayList<String> tree = (ArrayList<String>) request
													.getSession().getAttribute("tree");
											for (String nombreZona : tree) {
											/* while (it.hasNext()) { */
												/* Map.Entry pair = (Map.Entry) it.next(); */
										%>
										<label class="form-check-label"><input
											class="form-check-label mr-2" type="radio" id="padre"
											title="obtenerCategoria" name="cat"
											value="<%=pair.getKey().toString()%>"><%=pair.getKey().toString()%></label>
										<br>
										<%
											ArrayList<Zona> lstCategorias = (ArrayList<Zona>)->getValue();
												System.out.println(pair.getKey() + " = " + pair.getValue());
												for (DtCategorias dtCat : lstCategorias) {
										%>
										<label class="form-check-label ml-3"><input
											class="form-check-label mr-2" type="radio" id="hijo"
											title="obtenerCategoria" name="cat"
											value="<%=nombreZona%>"><%=nombreZona%></label>
										<br>
										<%
											}
									/* 			it.remove(); // avoids a ConcurrentModificationException */
										%> --%>
									</div>

								</div>
							</div>
						</div>
					</div>


					<div class="form-check col-12 col-md-6 col-lg-4">
						<div class="col">
							<img src="http://localhost:8181/geoserver/wms?bbox=551808,6133362,589385,6159930&styles=polygon,polygon&Format=image/png&request=GetMap&layers=sgrm:depto_p,sgrm:sig_comunales&width=550&height=250&srs=EPSG:32721">

						</div>
					</div>

				</div>

				<hr>
				<div class="row justify-content-center">
					<div class="mb-5">
						<button type="submit" id="confirmar" class="btn btn-info"
							style="background-color: #35CA97; border-color: #35CA97">Ingresar
							gestor</button>
					</div>
				</div>

			</form>
		</div>
	</div>

	<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"
		integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"
		crossorigin="anonymous"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"
		integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
		crossorigin="anonymous"></script>
</body>
</html>