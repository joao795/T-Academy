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
<title>Postagem</title>

<!-- CSS only -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">

<!-- JavaScript Bundle with Popper -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>

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
	
			int codigo = Integer.parseInt(request.getParameter("codigo"));
		
			String sql = "select * from postagem where codigo = ?";
						
			PreparedStatement p = c.efetuarConexao().prepareStatement(sql);
			p.setInt(1, codigo);
			
			//Statement s = c.efetuarConexao().createStatement();
			
			ResultSet r = p.executeQuery();
			
			while (r.next()) {
				if (session.getAttribute("administrador") != null && (int) session.getAttribute("administrador") == 1) { 
				
		%>
			<form action="alterar.jsp" style="text-align: center;" class="formulario">
			<div class="mb-3">
				<input type="text" name="codigo" value="<% out.print(r.getInt(1)); %>" readonly>
			</div>
			<div class="mb-3">
				<input type="text" name="novoTitulo" value="<% out.print(r.getString(2)); %>" required maxlength="20">
			</div>
			<div class="mb-3">
				<textarea name="novoConteudo" rows="5" cols="5" class="input-group mb-3" maxlength="255" minlength="5"><% out.print(r.getString(3)); %></textarea>
			</div>
			<div class="mb-3">
				<input type="submit" class="btn btn-warning btn-sm" value="Alterar">
			</div>
			</form>
			Deixe seu comentário<br>
			
			<%
				}
				else {
					
			%>
			
			<div class="mb-3">
				<h1><% out.print(r.getString(2)); %></h1>
			</div>
			<div class="mb-3">
				<% out.print(r.getString(3)); %>
			</div>
			Deixe seu comentário<br>
			
			<%		
				}
				
				String usuario = (String) session.getAttribute("usuario");
				if (usuario == null) {
					
			%>
			
			<%out.print("Para deixar comentários é necessário ter uma conta. Clique");%> 
		<a href="location.href='login.jsp'">aqui</a>
		<%out.print("para fazer login ou criar uma conta.");%>
		
		<%
		Conexao cc = new Conexao();
		//int codigoc = Integer.parseInt(request.getParameter("codigo"));
		
		String sqlc = "select * from comentario where postagem = ? and aprovado = 1";
		//Statement sc = cc.efetuarConexao().createStatement();
		PreparedStatement pc = cc.efetuarConexao().prepareStatement(sqlc);
		
		pc.setInt(1, codigo);
		ResultSet rc = pc.executeQuery();
		
		while (rc.next()) {
			
	%>
		<div class="mb-3">
		<% out.print(rc.getString(2)); %>:<br>
		<% out.print(rc.getString(3)); %>
		</div>
		
		
		<%
				}	
				}
				else {
					int banido = (int) session.getAttribute("banido");
					if (banido == 1) {
						out.print("Você foi banido e não pode mais deixar comentários >:(");
					}
					else {
		%>
			
				<form action="comentar.jsp" style="text-align: center;" class="formulario">
				<input type="text" name="codigo" value="<% out.print(r.getInt(1)); %>" readonly><br><br>
		<div class="mb-3">
		<label for="comentario">Seu comentário:</label>
			</div>
			<div class="mb-3">
			<input type="text" name="usuario" readonly value="<% out.print((String) session.getAttribute("usuario")); %>"><br><br>
			<textarea name="comentario" rows="10" cols="10" class="input-group mb-3" maxlength="255" minlength="5"></textarea>
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
			
			String sqlc = "select * from comentario where postagem = ? and aprovado = 1";
			//Statement sc = cc.efetuarConexao().createStatement();
			PreparedStatement pc = cc.efetuarConexao().prepareStatement(sqlc);
			
			pc.setInt(1, codigo);
			ResultSet rc = pc.executeQuery();
			
			while (rc.next()) {
				if ((int) session.getAttribute("administrador") == 0) {
				
		%>
			
			<br>
			<% out.print(rc.getString(2)); %>:<br>
			<% out.print(rc.getString(3)); %><br><br>
			
		<%
				}
				else {
					
		%>
					<div class="mb-3">
						<% out.print(rc.getString(2)); %>:
					</div>
				<form action="alterarComentario.jsp" style="text-align: center;" class="formulario">
				<div class="mb-3">
					<input type="text" name="codigoComentario" value="<% out.print(rc.getInt(1)); %>" readonly>
				</div>
				<div class="mb-3">
					<textarea name="comentario" rows="5" cols="5" class="input-group mb-3" maxlength="255" minlength="5"><% out.print(rc.getString(3)); %></textarea>
				<input type="submit" class="btn btn-warning btn-sm" value="Alterar">
				</div>
				</form>
	<%
				}
			}
		}
	}
		%>
</body>
</html>