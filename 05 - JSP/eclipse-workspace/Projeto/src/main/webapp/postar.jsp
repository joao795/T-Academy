<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="pacote.Conexao"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Nova postagem</title>

<!-- CSS only -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">

<!-- JavaScript Bundle with Popper -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>

</head>
<body>
	<nav class="navbar navbar-expand-lg bg-light">
  <div class="container-fluid">
    <a class="navbar-brand" href="#">Blog do Jo�o</a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarSupportedContent">
      <ul class="navbar-nav me-auto mb-2 mb-lg-0">
        <li class="nav-item">
          <a class="nav-link active" aria-current="page" href="index.jsp">Inicio</a>
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
            <li><a class="dropdown-item" href="usuarios.jsp">Usu�rios</a></li>
            <li><a class="dropdown-item" href="comentarios.jsp">Coment�rios</a></li>
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
		String usuario = (String) session.getAttribute("usuario");
	
		if (session.getAttribute("administrador") != null) {
		int admin = (int) session.getAttribute("administrador");
		if (admin == 1) {
	%>

	<form action="cadastrarPostagem.jsp" style="text-align: center;" class="formulario">
		<div class="mb-3">
			<label for="nomePostagem">T�tulo da postagem:</label>
			<input type="text" name="nomePostagem" class="input-group mb-3" maxlength="20" minlength="1">
		</div>
		<div class="mb-3">
			<label for="conteudoPostagem">Conte�do da postagem:</label>
			<textarea name="conteudoPostagem" rows="10" cols="10" class="input-group mb-3" maxlength="255" minlength="10"></textarea>
		</div>
		<div class="mb-3">
			<input type="submit" value="Postar" class="btn btn-primary">
		</div>		
	</form>
	
	<%
		}
		else {
			out.print("Voc� precisa ser o administrador para fazer postagens :(");
		}
	}
	else {
		out.print("Voc� precisa ser o administrador para fazer postagens :(");
	}

	%>
	
	<link rel="stylesheet" href="estilos.css">
</body>