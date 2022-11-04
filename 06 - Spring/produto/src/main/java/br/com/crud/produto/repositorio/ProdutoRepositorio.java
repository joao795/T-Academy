package main.java.br.com.crud.produto.repositorio;

import java.util.Optional;

import org.springframework.data.repository.CrudRepository;

import main.java.br.com.crud.produto.modelo.ProdutoModelo;

public interface ProdutoRepositorio extends CrudRepository<ProdutoModelo, Integer> {

    ProdutoModelo deleteById(int codigo);

    Optional<ProdutoModelo> findById(int codigo);
    
}
