import javax.swing.JOptionPane;

public class Atividade02String {
    public static void main(String[] args) {
        String verbo = JOptionPane.showInputDialog("Informe o verbo:");

        String[] novo = verbo.split("ar");

        String mensagem = "Eu " + novo[0] + "o" +
        "\nTu " + novo[0] + "as" +
        "\nEle " + novo[0] + "a" +
        "\nNós " + novo[0] + "amos" +
        "\nVós " + novo[0] + "ais" +
        "\nEles " + novo[0] + "am";

        JOptionPane.showMessageDialog(null, mensagem);
    } 
}
