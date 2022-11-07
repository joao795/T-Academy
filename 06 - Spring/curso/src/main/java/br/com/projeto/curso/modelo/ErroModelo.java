package br.com.projeto.curso.modelo;

import org.springframework.stereotype.Component;

@Component
public class ErroModelo {
    //atributo de mensagem
    private String mensagem;


    //getters e setters
    public String getMensagem() {
        return mensagem;
    }

    public void setMensagem(String mensagem) {
        this.mensagem = mensagem;
    } 
}
