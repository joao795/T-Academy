package atividade01POO;

import java.util.ArrayList;
import java.util.Scanner;

public class Contato {
    private String nome;
    private String email;
    private int telefone;
    private ArrayList<Contato> contatos = new ArrayList<>();
    private Scanner s = new Scanner(System.in);

    public void cadastrar(Contato c) {
        contatos.add(c);
    }

    public void listar() {
        for (Contato c: contatos) {
            System.out.println("Nome: " + c.getNome() + 
            "\nE-mail: " + c.getEmail() + "\nTelefone: " + c.getTelefone());
        }
    }

    public void alterar() {
        System.out.print("Número do contato a ser alterado: ");
        int numero = s.nextInt();
        for (int i = 0; i < contatos.size(); i++) {
            if (numero == i) {
                System.out.print("Novo nome: ");
                this.setNome(s.next());
                System.out.print("Novo e-mail: ");
                this.setEmail(s.next());
                System.out.println("Novo telefone: ");
                this.setTelefone(s.nextInt());
                break;
            }
        }      
    }

    public void remover() {
        System.out.print("Número do contato a ser removido: ");
        int numero = s.nextInt();
        int cont = 0;
        for (Contato c: contatos) {
            if (numero == cont) {
                contatos.remove(c);
                break;
            }           
            cont++;
        }
    }

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public int getTelefone() {
        return telefone;
    }

    public void setTelefone(int telefone) {
        this.telefone = telefone;
    }
}
