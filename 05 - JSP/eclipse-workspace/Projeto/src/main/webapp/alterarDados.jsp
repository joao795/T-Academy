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
		//String usuario = (String) session.getAttribute("usuario");

		String novoEmail = request.getParameter("email");
		String novaSenha = request.getParameter("senhaUsuario");
	
		Conexao c = new Conexao();
		
		String sql = "update usuario set email = ?, senha = ? where nome like ?";
		
		PreparedStatement p = c.efetuarConexao().prepareStatement(sql);
		
		p.setString(1, novoEmail);
		p.setString(2, novaSenha);
		p.setString(3, (String) session.getAttribute("usuario"));
		
		p.execute();
		
		response.sendRedirect("index.jsp");
		
	%>
</body>
</html></html>