package Orientacao_Objetos.exemplo01;

import java.util.ArrayList;

public class Principal {
    public static void main(String[] args) {
        //Pessoa p = new Pessoa();
        //p.obterDados();
        //p.retornarDados();

        ArrayList<Pessoa> dados = new ArrayList<>();

        for (int i = 0; i < 3; i++) {
            Pessoa p = new Pessoa();
            p.obterDados();
            dados.add(p);
        }

        for (int i = 0; i < dados.size(); i++) {
            System.out.println(dados.get(i).nome);
            System.out.println(dados.get(i).idade);
            System.out.println(dados.get(i).altura);
            System.err.println("----------");
        }
    }
}