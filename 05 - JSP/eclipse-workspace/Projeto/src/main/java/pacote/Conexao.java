package pacote;
import java.sql.Connection;
import java.sql.DriverManager;

public class Conexao {
	public Connection c = null;
	
	public Connection efetuarConexao() {
		try {
			c = DriverManager.getConnection("jdbc:mysql://localhost/banco", "root", "admin");
			System.out.println("Conexão efetuada com sucesso!");
		}
		catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return c;
	}
}
