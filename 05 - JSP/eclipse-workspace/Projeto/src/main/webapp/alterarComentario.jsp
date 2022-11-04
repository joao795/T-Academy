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
		String conteudo = request.getParameter("comentario");
		int codigo = Integer.parseInt(request.getParameter("codigoComentario"));
		
		Conexao c = new Conexao();
		
		String sql = "update comentario set conteudo = ? where codigo = ?";
		
		PreparedStatement p = c.efetuarConexao().prepareStatement(sql);
		
		p.setString(1, conteudo);
		p.setInt(2, codigo);
		
		p.execute();
		
		response.sendRedirect("index.jsp");
	
	%>
</body>
</html>