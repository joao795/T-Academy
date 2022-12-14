<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="pacote.Conexao"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import = " java.util.* " %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%		
		String usuario = request.getParameter("usuario");
		String senha = request.getParameter("senha");
		
		Conexao c = new Conexao();
		
		String sql = "select count(*) from usuario where nome = ? and senha = ?";
		String sqlAdmin = "select nome from usuario where administrador = 1";
		
		PreparedStatement p = c.efetuarConexao().prepareStatement(sql);
		
		p.setString(1, usuario);
		p.setString(2, senha);
		
		ResultSet r = p.executeQuery();
		
		while (r.next()) {
			if (r.getInt(1) > 0) {
					sql = "select administrador from usuario where nome = ?";
					p = c.efetuarConexao().prepareStatement(sql);
					
					p.setString(1, usuario);
					ResultSet rAdmin = p.executeQuery();
					
					while (rAdmin.next()) {
						if (rAdmin.getInt(1) == 1) {
							sql = "select * from usuario where nome = ? and senha = ?";
							p = c.efetuarConexao().prepareStatement(sql);
							
							p.setString(1, usuario);
							p.setString(2, senha);
							
							session.setAttribute("usuario", usuario);
							session.setAttribute("administrador", 1);
							session.setAttribute("banido", 0);
						}
						else {
							sql = "select banido from usuario where nome = ?";
							p = c.efetuarConexao().prepareStatement(sql);
							
							p.setString(1, usuario);
							ResultSet rBanido = p.executeQuery();
							
							while (rBanido.next()) {
								if (rBanido.getInt(1) == 1) {
									sql = "select * from usuario where nome = ? and senha = ?";
									p = c.efetuarConexao().prepareStatement(sql);
									
									p.setString(1, usuario);
									p.setString(2, senha);
									
									session.setAttribute("usuario", usuario);
									session.setAttribute("administrador", 0);
									session.setAttribute("banido", 1);
								}
								else {
									sql = "select * from usuario where nome = ? and senha = ?";
									p = c.efetuarConexao().prepareStatement(sql);
									
									p.setString(1, usuario);
									p.setString(2, senha);
									
									session.setAttribute("usuario", usuario);
									session.setAttribute("administrador", 0);
									session.setAttribute("banido", 0);
								}
							}
							
							
						}			
					}
								
				p.execute();
				
				response.sendRedirect("index.jsp");
				
			}
			else {
				response.sendRedirect("login.jsp");
			}
		}
	%>
	
		
</body>
</html>