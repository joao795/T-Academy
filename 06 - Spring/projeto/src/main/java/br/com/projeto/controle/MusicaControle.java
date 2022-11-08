package br.com.projeto.controle;

import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import br.com.projeto.modelo.MusicaModelo;
import br.com.projeto.repositorio.MusicaRepositorio;

@RestController
@RequestMapping("/musicas")
public class MusicaControle {
    @Autowired
    private MusicaRepositorio acao;

    @PostMapping("")
    public MusicaModelo cadastrar(@RequestBody MusicaModelo obj) {
        return acao.save(obj);
    }

    @GetMapping("")
    public Iterable<MusicaModelo> selecionar() {
        return acao.findAll();
    }

    @PutMapping("")
    public MusicaModelo alterar(@RequestBody MusicaModelo obj) {
        return acao.save(obj);
    }

    @GetMapping("{codigo}")
    public Optional<MusicaModelo> pesquisar(@PathVariable long codigo) {
        return acao.findById(codigo);
    }

    @DeleteMapping("{codigo}")
    public void remover(@PathVariable long codigo) {
        acao.deleteById(codigo);
    }
}
