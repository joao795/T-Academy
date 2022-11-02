package atividade08POO;

import java.util.ArrayList;
import java.util.Scanner;

public class Professor extends Pessoa {
    Scanner s = new Scanner(System.in);

    ArrayList<Turma> turmas = new ArrayList<>();

    public Professor(String email, String senha) {
        super(email, senha);
    }

    public void cadastrarAvaliacao(Aluno a, Avaliacao av) {
        a.getAvaliacoes().add(av);
    }

    public void removerAvaliacao(Aluno a, Avaliacao av) {
        a.getAvaliacoes().remove(av);
    }

    public void listarAvaliacoes() {
        for (Turma t: turmas) {
            for (Aluno a: t.getAlunos()) {
                for (Avaliacao av: a.getAvaliacoes()) {
                    System.out.println("Avaliação do(a) aluno(a) " + a.getNome() 
                    + ", turma " + t.getNumero() + ", nota " + av.getNota());
                }
            }
        }
    }
    
    public void informarNota(Avaliacao av) {
        System.err.print("Informe a nota: ");
        av.setNota(s.nextFloat());
    }

    public void alterarSenha() {
        System.out.println("Informe a senha: ");
        this.setSenha(s.next());
    }

    public void alterarSenhaAluno(Aluno a) {
        System.out.println("Informe a senha do aluno: ");
        a.setSenha(s.next());
    }
}
