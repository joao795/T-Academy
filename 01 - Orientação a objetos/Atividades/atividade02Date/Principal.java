package atividade02Date;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.Scanner;

public class Principal {
    public static void main(String[] args) {
        Scanner s = new Scanner(System.in);
        ArrayList<Produto> produtos = new ArrayList<>();

        System.out.println("Opções:\n1. Cadastrar novo produto\n2. Listar produtos cadastrados\n3. Sair");   
        int opcao;

        String nome;
        float valor;
        int qtdEstoque;

        do {
            System.out.print("opcão: ");
            opcao = s.nextInt();
            switch (opcao) {
                case 1:
                System.out.print("nome do produto: ");
                nome = s.next();
                System.out.print("valor do produto: ");
                valor = s.nextFloat();
                System.out.print("quantidade em estoque: ");
                qtdEstoque = s.nextInt();
                Produto p = new Produto(nome, valor, qtdEstoque, LocalDate.now());
                produtos.add(p);
                break;
                case 2:
                for (Produto p1: produtos) {
                    System.out.println(p1.getNome() + ", R$" + p1.getValor() + 
                    ", " + p1.getQtdEstoque() + " em estoque.\n" + p1.getHora());
                }
                break;
                default:
                System.out.println("Opção inválida!");
            }

        } while (opcao != 3);
        
        s.close();

    }  
}
