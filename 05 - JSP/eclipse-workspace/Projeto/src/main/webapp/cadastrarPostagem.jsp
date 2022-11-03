<%@page import="pacote.Conexao"%>
<%@page import="java.sql.PreparedStatement"%>
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
		int admin = (int) session.getAttribute("administrador");
		if (admin == 1) {
			String titulo = request.getParameter("nomePostagem");
			String conteudo = request.getParameter("conteudoPostagem");
			
			//out.print(titulo + "<br>" + conteudo);
			
			Conexao c = new Conexao();
			
			String sql = "insert into postagem values (null, ?, ?)";
			
			PreparedStatement p = c.efetuarConexao().prepareStatement(sql);
			
			p.setString(1, titulo);
			p.setString(2, conteudo);
			
			p.execute();
			
			response.sendRedirect("index.jsp");
			
		}
		else {
			out.print("Você precisa ser o administrador para fazer postagens :(");
		}
			
	%>
</body>
</html>