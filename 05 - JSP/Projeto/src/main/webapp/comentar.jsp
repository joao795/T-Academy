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
		String nome = request.getParameter("nome");
		String conteudo = request.getParameter("comentario");
		int codigo = Integer.parseInt(request.getParameter("codigo"));
		
		//out.print(titulo + "<br>" + conteudo);
		
		Conexao c = new Conexao();
		
		String sql = "insert into comentario values(null, ?, ?, ?)";
		
		PreparedStatement p = c.efetuarConexao().prepareStatement(sql);
		
		p.setString(1, nome);
		p.setString(2, conteudo);
		p.setInt(3, codigo);
		
		p.execute();
		
		response.sendRedirect("index.jsp");
	%>
</body>
</html>
</body>
</html>