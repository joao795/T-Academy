package br.com.dto.dtoUsuario;

import br.com.dto.modelo.UsuarioModelo;

public class RetornoDtoUsuario {
    private long codigo;
    private String nome;
    private String email;
    private String nivel;

    public RetornoDtoUsuario(UsuarioModelo um) {
        this.codigo = um.getCodigo();
        this.nome = um.getNome();
        this.email = um.getEmail();
        this.nivel = um.getNivel();
    }

    public long getCodigo() {
        return codigo;
    }
    public void setCodigo(long codigo) {
        this.codigo = codigo;
    }
    public String getNome() {
        return nome;
    }
    public void setNome(String nome) {
        this.nome = nome;
    }
    public String getEmail() {
        return email;
    }
    public void setEmail(String email) {
        this.email = email;
    }
    public String getNivel() {
        return nivel;
    }
    public void setNivel(String nivel) {
        this.nivel = nivel;
    }

    //método para retornar as características do JSON
    public static RetornoDtoUsuario retornoDto(UsuarioModelo um) {
        return new RetornoDtoUsuario(um);
    }
    
}
