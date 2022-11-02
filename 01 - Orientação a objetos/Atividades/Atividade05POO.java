import java.lang.Math;
import java.util.ArrayList;
import java.util.Scanner;

public class Atividade05POO {
    public static void main(String[] args) {
        String[] vetor = {"casa", "gato", "pato", "bola", "vaca", "sala", "vaso", "bota", "fogo", "gelo"};
        Scanner s = new Scanner(System.in);
        int indice = (int) Math.round(Math.random() * 10);
        String resposta = vetor[indice];
        int letras = 0;
        int erros = 0;
        char palpite;
        boolean teste;
        ArrayList<Character> palpites = new ArrayList<>();

        while (letras < 4 && erros < 7) {
            System.out.print("Escolha uma letra: ");
            palpite = s.next().charAt(0);
            if (palpites.contains(palpite)) {
                System.out.print("Você já fez esse palpite! Escolha uma nova letra: ");
                palpite = s.next().charAt(0);
            }
            teste = true;
            for (int i = 0; i < 4; i++) {
                if (palpite == resposta.charAt(i)) {
                    System.out.println("Palpite correto!");
                    palpites.add(palpite);
                    letras++;
                    teste = false;
                }
            }
            if (teste) {
                System.out.println("Errou!");
                palpites.add(palpite);
                erros++;
            }           
        }

        if (letras == 4) {
            System.out.println("Parabéns! A resposta era: " + resposta);
        }
        else {
            System.out.println("Você perdeu! A resposta era: " + resposta);
        }

        s.close();
    }
}
