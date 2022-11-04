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
<title>Resultado da pesquisa</title>

<!-- CSS only -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">

<!-- JavaScript Bundle with Popper -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
</head>
<body>
<nav class="navbar navbar-expand-lg bg-light">
  <div class="container-fluid">
    <a class="navbar-brand" href="#">Blog do João</a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarSupportedContent">
      <ul class="navbar-nav me-auto mb-2 mb-lg-0">
        <li class="nav-item">
          <a class="nav-link active" aria-current="page" href="index.jsp">Início</a>
        <li class="nav-item">
          <a class="nav-link" href="login.jsp">Login</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="cadastro.jsp">Cadastro</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="dados.jsp">Alterar dados</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="sair.jsp">Sair</a>
        </li>
        <%
        	if (session.getAttribute("administrador") != null) {
        		int admin = (int) session.getAttribute("administrador");
        		if (admin == 1) {
        	
        %>
         <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
            Administrador
          </a>
        <ul class="dropdown-menu">
            <li><a class="dropdown-item" href="usuarios.jsp">Usuários</a></li>
            <li><a class="dropdown-item" href="comentarios.jsp">Comentários</a></li>
            <li><a class="dropdown-item" href="postar.jsp">Nova postagem</a></li>
            <li><a class="dropdown-item" href="removerPostagem.jsp">Remover postagem</a></li>
            <li><a class="dropdown-item" href="alterarPostagem.jsp">Alterar postagem</a></li>
      </ul>
      <%
        		}
        	}
      %>
      <form class="d-flex" role="search" action="pesquisa.jsp">
        <input name="termo" class="form-control me-2" type="search" placeholder="Pesquisar" aria-label="Search">
        <button class="btn btn-outline-success" type="submit">Pesquisar</button>
      </form>
    </div>
  </div>
</nav>
    </div>
  </div>
</nav>
	<%
		Conexao c = new Conexao();
		String pesquisa = request.getParameter("termo");
	
		String sql = "select * from postagem where titulo like ?";
		//Statement s = c.efetuarConexao().createStatement();
		
		PreparedStatement p = c.efetuarConexao().prepareStatement(sql);
		
		p.setString(1, "%" + pesquisa + "%");
		
		ResultSet r = p.executeQuery();
		
		while (r.next()) {
		
	%>
	
	<form action="postagem.jsp" style="text-align: center; padding: 20px;">
			<div class="mb-3">
				<input type="text" name="codigo" value="<% out.print(r.getInt(1)); %>" readonly>
			</div>
			<div class="mb-3">
				<h1><% out.print(r.getString(2)); %></h1>
				<% out.print(r.getString(3)); %>
			</div>
			<div class="mb-3">
				<input type="submit" class="btn btn-primary btn-sm" value="Ver mais">
			</div>	

	</form>
	
	<%
		}
	%>
		
</body>
</html>