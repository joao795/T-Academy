<%@page import="java.sql.PreparedStatement"%>
<%@page import="pacote.Conexao"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<nav class="navbar navbar-expand-lg bg-light">
  <div class="container-fluid">
    <a class="navbar-brand" href="#">Navbar</a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarSupportedContent">
      <ul class="navbar-nav me-auto mb-2 mb-lg-0">
        <li class="nav-item">
          <a class="nav-link active" aria-current="page" href="index.jsp">Início</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="crud.jsp">Nova postagem</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="removerPostagem.jsp">Remover postagem</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="alterarPostagem.jsp">Alterar postagem</a>
        </li>
      </ul>
    </div>
  </div>
</nav>
	<%
		Conexao c = new Conexao();
		String pesquisa = request.getParameter("termo");
	
		String sql = "select * from postagem where titulo like '%?%'";
		//Statement s = c.efetuarConexao().createStatement();
		
		PreparedStatement p = c.efetuarConexao().prepareStatement(sql);
		
		p.setString(1, pesquisa);
		
		ResultSet r = p.executeQuery();
		
		while (r.next()) {
			out.print(r.getString(2));
			out.print(r.getString(3));
		}
		
	%>
		
</body>
</html>