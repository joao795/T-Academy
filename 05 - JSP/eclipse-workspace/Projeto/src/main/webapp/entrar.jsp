<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import = " java.util.* " %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<%	
		if (request.getParameter("usuario") != null
			&& !request.getParameter("usuario").isEmpty()) {
			session.setAttribute("usuario", request.getParameter("usuario"));
			response.sendRedirect("index.jsp");
		}
		else {
			response.sendRedirect("login.jsp");
		}
	
		
	%>
</body>
</html>