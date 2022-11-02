package Orientacao_Objetos.exemplo05;

import javax.swing.JOptionPane;

public class Colaborador {
    protected String nome;
    protected int idade;

    protected void obterDadosColaborador() {
        nome = JOptionPane.showInputDialog("Informe o nome");
        idade = Integer.parseInt(JOptionPane.showInputDialog("Informe a idade"));
    }
}
