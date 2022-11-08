package br.com.projeto.repositorio;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import br.com.projeto.modelo.PlaylistModelo;

@Repository
public interface PlaylistRepositorio extends CrudRepository<PlaylistModelo, Long> {
    
}
