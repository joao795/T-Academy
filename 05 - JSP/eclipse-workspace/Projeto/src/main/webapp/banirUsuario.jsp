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
		int codigo = Integer.parseInt(request.getParameter("codigo"));
		
		Conexao c = new Conexao();
		
		String sql = "update usuario set banido = 1 where codigo = ?";
		
		PreparedStatement p = c.efetuarConexao().prepareStatement(sql);
		p.setInt(1, codigo);
		
		p.execute();
		
		response.sendRedirect("usuarios.jsp");
	%>
</body>
</html>