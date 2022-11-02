import javax.swing.JOptionPane;

public class Atividade01String {
    public static void main(String[] args) {
        String palavra = JOptionPane.showInputDialog("Informe a palavra:");
        String nova = "";

        for (int i = 0; i < palavra.length(); i++) {
            String letra = String.valueOf(palavra.charAt(i));
            if (i % 2 == 0) {
                letra = letra.toLowerCase();
                nova += letra;
            }
            else {
                letra = letra.toUpperCase();
                nova += letra;
            }
        }

        JOptionPane.showMessageDialog(null, nova);
    }
}