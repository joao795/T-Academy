package Orientacao_Objetos.exemplo01;

import javax.swing.JOptionPane;

public class Pessoa {
    String nome;
    int idade;
    double altura;

    void obterDados() {
        //nome = JOptionPane.showInputDialog("Informe seu nome");
        //idade = Integer.parseInt(JOptionPane.showInputDialog("Infome sua idade")); 
        //altura = Double.parseDouble(JOptionPane.showInputDialog("Informe sua altura"));
        nome = "João";
        idade = 22;
        altura = 1.78;
    }

    void retornarDados() {
        String mensagem = "Nome: " + nome;
        mensagem += "\nIdade: " + idade;
        mensagem += "\nAltura: " + altura;
        
        JOptionPane.showMessageDialog(null, mensagem);
    }
}
