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
<link rel="stylesheet" href="/geoserver/style.css" type="text/css" />
<link rel="stylesheet"
	href="https://fonts.googleapis.com/icon?family=Material+Icons">
<link rel="stylesheet"
	href="https://code.getmdl.io/1.3.0/material.pink-light_blue.min.css" />
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/proj4js/2.5.0/proj4.js"></script>
<script src="https://epsg.io/32721.js"></script>
<script
	src="http://svn.osgeo.org/metacrs/proj4js/trunk/lib/proj4js-compressed.js"></script>
<script
	src="https://cdn.rawgit.com/openlayers/openlayers.github.io/master/en/v5.3.0/build/ol.js"></script>
<link rel="stylesheet"
	src="https://cdn.rawgit.com/openlayers/openlayers.github.io/master/en/v5.3.0/css/ol.css"></link>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css"
	integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO"
	crossorigin="anonymous">
<meta content="width=device-width, initial-scale=1" name="viewport" />
<link rel="stylesheet" href="home.css">
<script src="qrcode.js"></script>
<script src='https://npmcdn.com/@turf/turf/turf.min.js'></script>
</head>
<body>
	<jsp:include page="header.jsp" />
	<%
		List<DtZona> zonas = (ArrayList<DtZona>) request.getAttribute("lstZonas");
		System.out.println("obtube la lista de zonas");
	%>
	<div id="container">
		<div class="align-content-center pt-2">
			<div class="py-5 text-center" style="color: #35CA97;">
				<h2>Ingresar nuevo gestor</h2>
			</div>

			<!-- 	Para llamar a la funcion desde el boton -->
			<form action="servletAltaGestor" method="post" name="altaGestor"
				onsubmit="return validate()">

				<div class="row justify-content-center">
					<div class="col-12 col-md-6 col-lg-4">
						<label for="titu">Nombre *</label> <input type="text"
							class="form-control" id="titu" name="email" required="true">
					</div>
					<div class="col-12 col-md-6 col-lg-4">
						<label for="pwd">Apellido *</label> <input type="text"
							class="form-control" id="pwd" name="pswd" required="true">

					</div>
				</div>

				<div class="row justify-content-center  mt-4">
					<div class="col-12 col-md-6 col-lg-4"></div>
					<div class="col-12 col-md-6 col-lg-4"></div>
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
									
										<%
								      		System.out.println("antes del for");
											for (DtZona dtz : zonas) {
										%>
										<label class="form-check-label"><input
											class="form-check-label mr-2" type="radio" id="padre"
											title="obtenerCategoria" name="cat"
											value="<%=Long.toString(dtz.getId())%>"><%=Long.toString(dtz.getId())%></label>
										<br>
										<%
												}
										%>
									</div> 

								</div>
							</div>
						</div>
					</div>


					<div class="form-check col-12 col-md-6 col-lg-4">
						<div class="col">
							<label for="pwd">CI *</label> <input type="text"
								class="form-control" id="pwdd" name="pwdd" required="true">
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

	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"
		integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49"
		crossorigin="anonymous"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"
		integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy"
		crossorigin="anonymous"></script>

	<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"
		integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"
		crossorigin="anonymous"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"
		integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
		crossorigin="anonymous"></script>
</body>
</html>