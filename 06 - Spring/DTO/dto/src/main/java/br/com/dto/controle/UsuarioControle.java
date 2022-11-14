package br.com.dto.controle;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import br.com.dto.dtoUsuario.DtoUsuario;
import br.com.dto.dtoUsuario.RetornoDtoUsuario;
import br.com.dto.modelo.UsuarioModelo;
import br.com.dto.repositorio.UsuarioRepositorio;

@RestController
public class UsuarioControle {
    @Autowired
    private UsuarioRepositorio ur;

    @PostMapping("")
    public RetornoDtoUsuario cadastrar(@RequestBody DtoUsuario du) {
        UsuarioModelo um = ur.save(du.transformarUsuarioModelo());
        
        return RetornoDtoUsuario.retornoDto(um);
    }
}
