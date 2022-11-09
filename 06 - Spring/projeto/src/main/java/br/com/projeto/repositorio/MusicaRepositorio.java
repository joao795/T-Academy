package br.com.projeto.repositorio;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import br.com.projeto.modelo.MusicaModelo;

@Repository
public interface MusicaRepositorio extends CrudRepository<MusicaModelo, Long> {
    Iterable<MusicaModelo> findByNomeContaining(String termo);
}
