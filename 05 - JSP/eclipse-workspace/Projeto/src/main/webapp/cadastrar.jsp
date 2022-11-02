<%@page import="java.sql.PreparedStatement"%>
<%@page import="pacote.Conexao"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<%
		String nomeUsuario = request.getParameter("nomeUsuario");
	
		Conexao c = new Conexao();
		
		String sql = "insert into usuario values(null, ?)";
		
		PreparedStatement p = c.efetuarConexao().prepareStatement(sql);
		
		p.setString(1, nomeUsuario);
		
		p.execute();
		
		response.sendRedirect("index.jsp");
	%>
</body>
</html></html>