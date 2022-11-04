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
		String usuario = (String) session.getAttribute("usuario");

		String novoUsuario = request.getParameter("nomeUsuario");
		String novaSenha = request.getParameter("senhaUsuario");
	
		Conexao c = new Conexao();
		
		String sql = "update usuario set nome = ?, senha = ? where nome like ?";
		
		PreparedStatement p = c.efetuarConexao().prepareStatement(sql);
		
		p.setString(1, novoUsuario);
		p.setString(2, novaSenha);
		p.setString(3, (String) session.getAttribute("usuario"));
		
		p.execute();
	
		//request.getSession().removeAttribute("usuario");
		request.getSession().setAttribute("usuario", usuario);
		
		response.sendRedirect("index.jsp");
		
	%>
</body>
</html></html>