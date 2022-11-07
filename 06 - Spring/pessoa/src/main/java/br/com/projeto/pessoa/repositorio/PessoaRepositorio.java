package br.com.projeto.pessoa.repositorio;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import br.com.projeto.pessoa.modelo.PessoaModelo;

@Repository
public interface PessoaRepositorio extends CrudRepository<PessoaModelo, Long> {
    //retornar todos os registros com uma determinada idade
    Iterable<PessoaModelo> findByIdade(int idade);

    //listar os registros através da coluna nome (A - Z)
    Iterable<PessoaModelo> findByOrderByNome();

    //listar os registros através da coluna nome (Z - A)
    Iterable<PessoaModelo> findByOrderByNomeDesc();

    //listar todas as pessoas com uma determinada idade em ordem decrescente de nome
    Iterable<PessoaModelo> findByIdadeOrderByNomeDesc(int idade);

    //listar pessoas cujos nomes possuem determinado termo
    Iterable<PessoaModelo> findByNomeContaining(String termo);

    //listar pessoas cujos nomes iniciam com determinado termo
    Iterable<PessoaModelo> findByNomeStartsWith(String termo);

    //listar pessoas cujos nomes finalizam com determinado termo
    Iterable<PessoaModelo> findByNomeEndsWith(String termo);

    //método para retornar a soma das idades (JPQL)
    @Query(value = "select sum(idade) from pessoas", nativeQuery = true)
    int somaIdades();

    //método para retornar pessoas com idade superior a 20 anos
    @Query(value = "select * from pessoas where idade >= ?", nativeQuery = true)
    Iterable<PessoaModelo> idadeSuperior(int idade);
}
