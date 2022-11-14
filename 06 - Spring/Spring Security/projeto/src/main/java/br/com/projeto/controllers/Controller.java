package br.com.projeto.controllers;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class Controller {
    @GetMapping("")
    public String main() {
        return "Rota pública.";
    }

    @GetMapping("/admin")
    public String admin() {
        return "Rota exclusiva para o administrador.";
    }

    @GetMapping("/user") 
    public String user() {
        return "Rota exclusiva para o usuário comum.";
    }

    @GetMapping("/all")
    public String all() {
        return "Rota exclusiva para administradores e usuários comuns.";
    }
}
