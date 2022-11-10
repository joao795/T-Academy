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

import br.com.projeto.modelo.PlaylistModelo;
import br.com.projeto.repositorio.PlaylistRepositorio;

@RestController
@CrossOrigin(origins = "*")
@RequestMapping("/playlists")
public class PlaylistControle {
    @Autowired
    private PlaylistRepositorio acao;

    @PostMapping("")
    public PlaylistModelo cadastrar(@RequestBody PlaylistModelo obj) {
        return acao.save(obj);
    }

    @GetMapping("")
    public Iterable<PlaylistModelo> selecionar() {
        return acao.findAll();
    }

    @PutMapping("")
    public PlaylistModelo alterar(@RequestBody PlaylistModelo obj) {
        return acao.save(obj);
    }

    @GetMapping("{codigo}")
    public Optional<PlaylistModelo> pesquisar(@PathVariable long codigo) {
        return acao.findById(codigo);
    }

    @DeleteMapping("{codigo}")
    public void remover(@PathVariable long codigo) {
        acao.deleteById(codigo);
    }

    @GetMapping("/pesquisarPlaylist/{termo}")
    public Iterable<PlaylistModelo> nomeContem(@PathVariable String termo) {
        return acao.findByNomeContaining(termo);
    }

}
