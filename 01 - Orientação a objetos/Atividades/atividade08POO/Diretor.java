package atividade08POO;

import java.util.ArrayList;
import java.util.Scanner;

public class Diretor extends Pessoa {
    private Scanner s = new Scanner(System.in);

    private ArrayList<Professor> professores = new ArrayList<>();
    private ArrayList<Aluno> alunos = new ArrayList<>();
    private ArrayList<Turma> turmas = new ArrayList<>();

    public Diretor(String email, String senha) {
        super(email, senha);
    }

    public void cadastrarProfessor(Professor p) {
        professores.add(p);
    }

    public void alterarProfessor() {
       //TODO
    }

    public void removerProfessor(Professor p) {
        professores.remove(p);
    }

    public void listarProfessores() {
        for (Professor p: professores) {
            System.out.println("Professor(a) " + p.getNome());
        }
    }

    public void cadastrarAluno(Aluno a) {
        alunos.add(a);
    }

    public void alterarAluno() {
        //TODO
    }

    public void removerAluno(Aluno a) {
        alunos.remove(a);
    }

    public void listarAlunos() {
        for (Aluno a: alunos) {
            System.out.println("Aluno(a) " + a.getNome());
        }
    }

    public void cadastrarTurma(Turma t) {
        turmas.add(t);
    }

    public void removerTurma(Turma t) {
        if (t.getAlunos().isEmpty()) {
            turmas.remove(t);
        }
        else {
            System.out.println("Só é possível remover uma turma vazia.");
        }
    }

    public void listarTurmas() {
        for (Turma t: turmas) {
            System.out.println("Turma de " + t.getDisciplina() 
            + " do professor " + t.getProfessor().getNome());
        }
    }

    public void estatisticas() {
        System.out.println("Quantidade de professores: " + professores.size()
        + "\nQuantidade de alunos: " + alunos.size()
        + "\nQuantidade de turmas: " + turmas.size());
    }

    public void alterarSenha(Pessoa p) {
        System.out.print("Nova senha para " + p.getNome() + ": ");
        p.setSenha(s.next());
    }
}
