package br.com.projeto.modelo;

import java.util.List;

import javax.persistence.Entity;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.JoinColumn;
import javax.persistence.Table;

@Entity
@Table(name = "playlists")
public class PlaylistModelo {
    private long codigo;

    @ManyToMany
    @JoinTable(
        name = "tabela_auxiliar",
        joinColumns = {@JoinColumn(name = "codigo_playlist", referencedColumnName = "codigo")},
        inverseJoinColumns = {@JoinColumn(name = "codigo_musica", referencedColumnName = "codigo")}
    )
    private List<MusicaModelo> musicas;

    public long getCodigo() {
        return codigo;
    }

    public void setCodigo(long codigo) {
        this.codigo = codigo;
    }

    public List<MusicaModelo> getMusicas() {
        return musicas;
    }

    public void setMusicas(List<MusicaModelo> musicas) {
        this.musicas = musicas;
    }

    
}
