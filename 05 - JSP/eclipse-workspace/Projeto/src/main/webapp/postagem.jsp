<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="pacote.Conexao"%>
<%@page import="java.sql.Statement"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>

<!-- CSS only -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">

<link rel="stylesheet" href="estilos.css">
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
        </li>
        <li class="nav-item">
          <a class="nav-link" href="postar.jsp">Nova postagem</a>
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
	
			int codigo = Integer.parseInt(request.getParameter("codigo"));
		
			String sql = "select * from postagem where codigo = ?";
						
			PreparedStatement p = c.efetuarConexao().prepareStatement(sql);
			p.setInt(1, codigo);
			
			//Statement s = c.efetuarConexao().createStatement();
			
			ResultSet r = p.executeQuery();
			
			while (r.next()) {
				
		%>
			
			<div style="text-align: center;">
				<h1><% out.print(r.getString(2)); %></h1><br>
				<% out.print(r.getString(3)); %>
			</div>
			<div>
				Deixe seu comentário
				<form action="comentar.jsp" style="text-align: center;" class="formulario">
				<input type="text" name="codigo" value="<% out.print(r.getInt(1)); %>" readonly>
		<div class="mb-3">
			<label for="nome">Seu nome:</label>
			<input type="text" name="nome" class="input-group mb-3">
		</div>
		<div class="mb-3">
			<label for="comentario">Seu comentário:</label>
			<textarea name="comentario" rows="10" cols="10" class="input-group mb-3"></textarea>
		</div>
		<div class="mb-3">
			<input type="submit" value="Postar" class="btn btn-primary">
		</div>		
	</form>			
			</div>
			
		
		<%
			}
			
			Conexao cc = new Conexao();
			//int codigoc = Integer.parseInt(request.getParameter("codigo"));
			
			String sqlc = "select * from comentario where postagem = ?";
			//Statement sc = cc.efetuarConexao().createStatement();
			PreparedStatement pc = cc.efetuarConexao().prepareStatement(sqlc);
			
			pc.setInt(1, codigo);
			ResultSet rc = pc.executeQuery();
			
			while (rc.next()) {
				
		%>
		
			<% out.print(rc.getString(2)); %>:<br>
			<% out.print(rc.getString(3)); %><br><br>
			
		<%
			}
		%>
</body>
</html>