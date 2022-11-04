package main.java.br.com.crud.produto.modelo;

import javax.annotation.Generated;
import javax.persistence.Entity;

@Entity
@Table(name = "produtos")
public class ProdutoModelo {
    
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY) 
    private int codigo;
    private String nome;
    private double valor;

    public int getCodigo() {
        return codigo;
    }

    public void setCodigo(int codigo) {
        this.codigo = codigo;
    }

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public double getValor() {
        return valor;
    }

    public void setValor(double valor) {
        this.valor = valor;
    }
}
