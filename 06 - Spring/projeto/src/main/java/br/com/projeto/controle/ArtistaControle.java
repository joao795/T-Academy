package br.com.projeto.controle;

import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import br.com.projeto.modelo.ArtistaModelo;
import br.com.projeto.modelo.MusicaModelo;
import br.com.projeto.repositorio.ArtistaRepositorio;

@RestController
@CrossOrigin(origins = "*")
@RequestMapping("/artistas")
public class ArtistaControle {
    @Autowired
    private ArtistaRepositorio acao;

    @PostMapping("")
    public ArtistaModelo cadastrar(@RequestBody ArtistaModelo obj) {
        return acao.save(obj);
    }

    @GetMapping("")
    public Iterable<ArtistaModelo> selecionar() {
        return acao.findAll();
    }

    @PutMapping("")
    public ArtistaModelo alterar(@RequestBody ArtistaModelo obj) {
        return acao.save(obj);
    }

    @GetMapping("/{codigo}")
    public Optional<ArtistaModelo> pesquisar(@PathVariable long codigo) {
        return acao.findById(codigo);
    }

    @GetMapping("/pesquisar/{termo}")
    public Iterable<ArtistaModelo> nomeContem(@PathVariable String termo) {
        return acao.findByNomeContaining(termo);
    }

    @DeleteMapping("/{codigo}")
    public void remover(@PathVariable long codigo) {
        acao.deleteById(codigo);
    }

    @PutMapping("/{codigo}")
    public ArtistaModelo alterar(@PathVariable long codigo, @RequestBody MusicaModelo obj) {
        ArtistaModelo am = acao.findByCodigo(codigo);

        am.getMusicas().add(obj);

        acao.save(am);

        return am;
    }

}
