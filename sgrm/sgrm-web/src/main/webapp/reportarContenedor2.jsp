<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insertar contenedor</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<!-- <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0"> -->
<!-- <meta name="apple-mobile-web-app-capable" content="yes"> -->
<!-- <meta content="width=device-width, initial-scale=1" name="viewport" /> -->
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

<link rel="stylesheet" href="home.css">
<script src="qrcode.js"></script>
<script src='https://npmcdn.com/@turf/turf/turf.min.js'></script>

<style>
body {
	font-family: 'Roboto', sans-serif;
}

button[type=submit] {
  background-color: #51cf92;
  border: none;
  color: white;
  width: -webkit-fill-available;
}
</style>

</head>
<body>
	<jsp:include page="header.jsp" />
	<div class="container">
		<div class="row col-12">
			<h2 style="color: #fff;"><strong>0</strong></h2>
		</div>
<%-- 		<h4 style="color: #0B0500">Reportar Estado del Contenedor  <%=request.getAttribute("idareportar") %></h4> --%>
		
		<div class="row col-12 justify-content-center">
			<br>
			<span style="color: #00bfdf;"><i class="fas fa-exclamation-triangle fa-3x py-15"></i></span>
		</div>
		<div class="row justify-content-center col-12 pb-15">
			<h2 style="color: #00bfdf;"><strong>Reportar Contenedor</strong></h2>
		</div>
	</div>
	<div class="container pt-15">
		<div class="row justify-content-center col-12 pt-15 mt-15">
			<form action="reportarContenedor" method="post">
<!-- 			<div class="row align-items-center col-12 col-md-6 col-sm"> -->
				<div class="form-group">  
<!-- 				  <label for="estadoCont">Estado en el que se encuentra</label> -->
<%-- 				  <input  type="text" id="idcont" name="idcont" value="<%=request.getAttribute("idareportar")%>"> --%>
			  
			    	<h5>Estado en el que se encuentra</h5>
			    	<select class="form-control is-invalid" id="estadoCont" name="estado" required >
			  		<option value="">Seleccionar...</option>
			      	<option value="0">Lleno</option>
			      	<option value="1">Roto</option>
			      	
			    	</select>
			    	<div class="invalid-feedback">Debe seleccionar un estado</div>
		    	 
				</div>
				
<!-- 			</div> -->
			<button type="submit" class="btn">Reportar</button>
			</form>
		</div>
	</div>

<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.6/umd/popper.min.js" integrity="sha384-wHAiFfRlMFy6i5SRaxvfOCifBUQy1xHdJ/yoi7FRNXMRBu5WHdZYu1hA6ZOblgut" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/js/bootstrap.min.js" integrity="sha384-B0UglyR+jN6CkvvICOB2joaf5I4l3gm9GU6Hc1og6Ls7i6U/mkkaduKaBhlAXv9k" crossorigin="anonymous"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>

</body>
</html>