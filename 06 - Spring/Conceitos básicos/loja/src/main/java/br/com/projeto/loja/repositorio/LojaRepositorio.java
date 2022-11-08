package br.com.projeto.loja.repositorio;

import org.springframework.data.repository.CrudRepository;

import br.com.projeto.loja.modelo.LojaModelo;

/**
 * LojaRepositorio
 */
public interface LojaRepositorio extends CrudRepository<LojaModelo, Long>{

}