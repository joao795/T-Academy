package atividade08POO;

import java.util.ArrayList;
import java.util.Scanner;

public class Aluno extends Pessoa {
    Scanner s = new Scanner(System.in);

    private ArrayList<Avaliacao> avaliacoes = new ArrayList<>();
    private Turma turma;

    public Aluno(String email, String senha, Turma turma) {
        super(email, senha);
        this.turma = turma;
    }

    public ArrayList<Avaliacao> getAvaliacoes() {
        return avaliacoes;
    }

    public void setAvaliacoes(ArrayList<Avaliacao> avaliacoes) {
        this.avaliacoes = avaliacoes;
    }

    public void consultarAvaliacoes() {
        for (Avaliacao av: avaliacoes) {
            System.out.println("Nota: " + av.getNota());
        }
    }

    public void alterarSenha() {
        System.out.println("Informe a senha: ");
        this.setSenha(s.next());
    }

    public Turma getTurma() {
        return turma;
    }

    public void setTurma(Turma turma) {
        this.turma = turma;
    }   
}
