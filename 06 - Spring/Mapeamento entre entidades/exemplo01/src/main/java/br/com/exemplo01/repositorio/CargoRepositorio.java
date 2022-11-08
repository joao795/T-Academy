package br.com.exemplo01.repositorio;

import org.springframework.data.repository.CrudRepository;

import br.com.exemplo01.modelo.CargoModelo;

public interface CargoRepositorio extends CrudRepository<CargoModelo, Long> {
    
}
