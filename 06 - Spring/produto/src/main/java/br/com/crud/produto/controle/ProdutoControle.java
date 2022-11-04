package main.java.br.com.crud.produto.controle;

import java.util.Optional;

import main.java.br.com.crud.produto.modelo.ProdutoModelo;
import main.java.br.com.crud.produto.repositorio.ProdutoRepositorio;

@RestController
@CrossOrigin(origins = "*")
public class ProdutoControle {

    @Autowired
    private ProdutoRepositorio pr;

    @GetMapping("")
    public Iterable<ProdutoModelo> listar() {
        return pr.findAll();
    }

    @PostMapping("")
    public ProdutoModelo cadastrar(@RequestBody ProdutoModelo obj) {
        return pr.save(obj);
    }

    @PutMapping("")
    public ProdutoModelo alterar(@RequestBody ProdutoModelo obj) {
        return pr.save(obj);
    }

    @DeleteMapping("{codigo}")
    public ProdutoModelo remover(@PathVariable int codigo) {
        return pr.deleteById(codigo);
    }

    @GetMapping("codigo")
    public Optional<ProdutoModelo> filtrar(@PathVariable int codigo) {
        return pr.findById(codigo);
    }
}
