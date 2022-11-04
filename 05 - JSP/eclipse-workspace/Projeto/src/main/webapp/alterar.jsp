<%@page import="java.sql.PreparedStatement"%>
<%@page import="pacote.Conexao"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>

<link rel="stylesheet" href="estilos.css">

<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<%
		String titulo = request.getParameter("novoTitulo");
		String conteudo = request.getParameter("novoConteudo");	
		int codigo = Integer.parseInt(request.getParameter("codigo"));
		
		Conexao c = new Conexao();
		
		String sql = "update postagem set titulo = ?, conteudo = ? where codigo = ?";
		
		PreparedStatement p = c.efetuarConexao().prepareStatement(sql);
		
		p.setString(1, titulo);
		p.setString(2, conteudo);
		p.setInt(3, codigo);
		
		p.execute();
		
		response.sendRedirect("index.jsp");
	%>
		
</body>
</html>ml>