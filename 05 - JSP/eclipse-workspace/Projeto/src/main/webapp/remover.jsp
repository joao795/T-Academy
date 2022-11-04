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
		int codigo = Integer.parseInt(request.getParameter("codigo"));
		
		Conexao c = new Conexao();
		
		String sqlComentarios = "delete from comentario where postagem = ?";
		String sql = "delete from postagem where codigo = ?";
		
		PreparedStatement p = c.efetuarConexao().prepareStatement(sqlComentarios);
		p.setInt(1, codigo);
		
		p.execute();
		
		p = c.efetuarConexao().prepareStatement(sql);
		p.setInt(1, codigo);
		
		p.execute();
		
		response.sendRedirect("removerPostagem.jsp");
	%>
</body>
</html>