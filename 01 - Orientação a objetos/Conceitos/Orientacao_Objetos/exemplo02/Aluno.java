package Orientacao_Objetos.exemplo02;

import javax.swing.JOptionPane;

public class Aluno {
    private String nome;
    private double nota1, nota2;
    

    private void obterDados() {
        nome = JOptionPane.showInputDialog("Informe o nome");
        nota1 = Double.parseDouble(JOptionPane.showInputDialog("Primeira nota"));
        nota2 = Double.parseDouble(JOptionPane.showInputDialog("Segunda nota"));
    }

    private double media() {
        return (nota1 + nota2) / 2;
    }

    private String situacao(double media) {
        return media >= 7 ? "aprovado(a)" : "reprovado(a)";
    }

    private void mensagem() {
        JOptionPane.showMessageDialog(null, nome + " obteve a média " + media() + " e está " + situacao(media()) + ".");
    }

    public void iniciar() {
        obterDados();
        mensagem();
    }
}
