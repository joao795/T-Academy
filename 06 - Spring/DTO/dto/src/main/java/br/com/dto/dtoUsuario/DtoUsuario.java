package br.com.dto.dtoUsuario;

import br.com.dto.modelo.UsuarioModelo;

public class DtoUsuario {
    private String nome;
    private String email;
    private String senha;
    private String nivel;

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
    public String getSenha() {
        return senha;
    }
    public void setSenha(String senha) {
        this.senha = senha;
    }
    public String getNivel() {
        return nivel;
    }
    public void setNivel(String nivel) {
        this.nivel = nivel;
    }

    //transformar em um objeto do tipo UsuarioModelo
    public UsuarioModelo transformarUsuarioModelo() {
        return new UsuarioModelo(nome, email, senha, nivel);
    } 

}
