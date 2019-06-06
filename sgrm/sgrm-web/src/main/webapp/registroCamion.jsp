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
<title>Insert title here</title>
</head>
<body>
			
	<%
 
			List<DtZona> zonas = (ArrayList<DtZona>) request.getAttribute("lstZonas");
			System.out.println("obtube la lista de zonas");
	%>		
			
	<div class="container">
		<div class="row justify-content-center">
		<h1>Registrar Camión</h1>
		</div>
	</div>	
	<div class="container">
		<div class="row justify-content-center">	
		<form action="Camiones" method="post">
		  
		
		  <div class="form-group">
		    <label for="mat">Matrícula</label>
		    <input type="text" class="form-control" id="formMat" name="mat" >
		  
		
		<div class="form-group">
      <label for="sel1">Zona:</label>
      <select class="form-control" id="sel1" name="idZona">
      
      <%
		      	System.out.println("antes del for");
					for (DtZona dtz : zonas) {
			%>
			
				<option name="optId" ><%=dtz.getId()%></option>
				
			
			<%
					}
			%>
      </select>
    </div>
		
		<div class="col-sm-10">
      		<button type="submit" class="btn btn-primary">Enviar</button>
    	</div>
    	</form>
		</div>
		
	</div>


<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
</body>
</html>