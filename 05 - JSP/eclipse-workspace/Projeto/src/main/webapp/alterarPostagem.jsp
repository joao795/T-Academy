<%@page import="java.sql.ResultSet"%>
<%@page import="pacote.Conexao"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
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

<!-- JavaScript Bundle with Popper -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
</head>
<body>
	<nav class="navbar navbar-expand-lg bg-light">
  <div class="container-fluid">
    <a class="navbar-brand" href="#">Blog do Joao</a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarSupportedContent">
      <ul class="navbar-nav me-auto mb-2 mb-lg-0">
        <li class="nav-item">
          <a class="nav-link active" aria-current="page" href="index.jsp">Inicio</a>
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
         <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
            Administrador
          </a>
        <ul class="dropdown-menu">
            <li><a class="dropdown-item" href="usuarios.jsp">Usuarios</a></li>
            <li><a class="dropdown-item" href="comentarios.jsp">Comentarios</a></li>
          </ul>
      </ul>
      <form class="d-flex" role="search" action="pesquisa.jsp">
        <input name="termo" class="form-control me-2" type="search" placeholder="Pesquisar" aria-label="Search">
        <button class="btn btn-outline-success" type="submit">Pesquisar</button>
      </form>
    </div>
  </div>
</nav>
	<%
		int admin = (int) session.getAttribute("administrador");
		if (admin == 1) {
	%>
	<form action="alterar.jsp" class="formulario">
		<label for="codigo">Codigo da postagem:</label><br>
		<input type="number" name="codigo"><br>
		<label for="novoTitulo">Novo titulo:</label><br>	
		<input type="text" name="novoTitulo"><br>
		<label for="novoConteudo">Novo conteudo:</label><br>
		<textarea name="novoConteudo" rows="10" cols="10" class="input-group mb-3"></textarea><br>	
		 <br>
		 <input type="submit" class="btn btn-warning btn-sm" value="Alterar">
	</form>
	
	<%
		}
		else {
			out.print("Você precisa ser o administrador para alterar postagens :(");
		}
	%>
</body>
</html>