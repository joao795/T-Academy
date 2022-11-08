package br.com.exemplo02.modelo;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import java.util.List;

@Entity
@Table(name = "postagens")
public class PostagemModelo {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int codigo;
    private String titulo;
    private String texto;
    @OneToMany
    @JoinColumn(name = "codigo_postagem")
    private List<ComentarioModelo> comentarios;

    

    public int getCodigo() {
        return codigo;
    }
    public void setCodigo(int codigo) {
        this.codigo = codigo;
    }
    public String getTitulo() {
        return titulo;
    }
    public void setTitulo(String titulo) {
        this.titulo = titulo;
    }
    public String getTexto() {
        return texto;
    }
    public void setTexto(String texto) {
        this.texto = texto;
    }
    public List<ComentarioModelo> getComentarios() {
        return comentarios;
    }
    public void setComentarios(List<ComentarioModelo> comentarios) {
        this.comentarios = comentarios;
    }

    
}
