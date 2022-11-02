package Orientacao_Objetos.exemplo05;

import javax.swing.JOptionPane;

public class Cargo extends Colaborador {
    private String cargo;
    private double salario;

    private void obterDadosCargo() {
        cargo = JOptionPane.showInputDialog("Informe o cargo");
        salario = Integer.parseInt(JOptionPane.showInputDialog("Informe o salário"));
    }

    public Cargo() {
        obterDadosColaborador();
        obterDadosCargo();

        System.out.println("Nome: " + nome);
        System.out.println("Idade: " + idade);
        System.out.println("Cargo: " + cargo);
        System.out.println("Salário: " + salario);
    }
}
