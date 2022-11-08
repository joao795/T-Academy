package br.com.projeto.repositorio;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import br.com.projeto.modelo.ArtistaModelo;

@Repository
public interface ArtistaRepositorio extends CrudRepository<ArtistaModelo, Long> {
    ArtistaModelo findByCodigo(long codigo);
}
