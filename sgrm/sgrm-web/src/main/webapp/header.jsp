<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<% if (request.getSession().getAttribute("usulogueado")==null) { %>
			<jsp:include page="header_anonimo.html" />
			
		<%} else {
			if ((request.getSession().getAttribute("rol").toString().equals("admin"))) {
		%>
			<jsp:include page="header_admin.html" />
			
		<%}	else {%>
			<jsp:include page="header_final.html" />
		<%}} %>

</body>
</html>