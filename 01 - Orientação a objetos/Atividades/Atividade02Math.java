import java.lang.Math;

import javax.swing.JOptionPane;

public class Atividade02Math {
    public static void main(String[] args) {
        double valor = Math.round(Math.random() * 100);
        double palpite = Double.parseDouble(JOptionPane.showInputDialog("Seu palpite:"));

        int contador = 1;

        while (palpite != valor) {
            contador++;
            if (Math.max(valor, palpite) - Math.min(valor, palpite) <= 10) {
                palpite = Double.parseDouble(JOptionPane.showInputDialog("Está perto."));
            }
            else if (Math.max(valor, palpite) - Math.min(valor, palpite) <= 20) {
                palpite = Double.parseDouble(JOptionPane.showInputDialog("Está longe."));
            }
            else {
                palpite = Double.parseDouble(JOptionPane.showInputDialog("Muito longe."));
            }
            
        }

        System.out.println(contador);

        if (contador == 1) {
            JOptionPane.showMessageDialog(null, "Nossa! Acertou na mosca");
        }
        else if (contador <= 5) {
            JOptionPane.showMessageDialog(null, "Parabéns! Você é bom de adivinhação");
        }
        else if (contador <= 10) {
            JOptionPane.showMessageDialog(null, "Muito bom, continue assim");
        }
        else if (contador <= 20) {
            JOptionPane.showMessageDialog(null, "Podia ser melhor, continue tentando");
        }
        else {
            JOptionPane.showMessageDialog(null, "Meio lerdo você, hein?");
        }       
    }
}
