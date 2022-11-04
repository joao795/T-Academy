<%@page import="java.sql.PreparedStatement"%>
<%@page import="pacote.Conexao"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		String nomeUsuario = request.getParameter("nomeUsuario");
		String senhaUsuario = request.getParameter("senhaUsuario");
		String emailUsuario = request.getParameter("email");
		
		Conexao c = new Conexao();
		
	
			String sql = "insert into usuario values(null, ?, ?, ?, 0, 0)";
			
			PreparedStatement p = c.efetuarConexao().prepareStatement(sql);
			
			p.setString(1, nomeUsuario);
			p.setString(2, emailUsuario);
			p.setString(3, senhaUsuario);
			
			p.execute();
					
		
		response.sendRedirect("login.jsp");
		
	%>
</body>
</html></html>