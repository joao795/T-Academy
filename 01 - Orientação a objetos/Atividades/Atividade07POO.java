

import java.util.Scanner;

public class Atividade07POO {
    public static void main(String[] args) {
        Scanner s = new Scanner(System.in);
    
        boolean acertouONavio = false;
        boolean acertouTresBombas = false;
        int bombas = 0;

        int[][] matriz = new int[10][10];

        int navio1 = (int) Math.round(Math.random() * 10 - 1);
        int navio2 = (int) Math.round(Math.random() * 10 - 1);

        int bomba11 = (int) Math.round(Math.random() * 10 - 1);
        int bomba12 = (int) Math.round(Math.random() * 10 - 1);
        int bomba21 = (int) Math.round(Math.random() * 10 - 1);
        int bomba22 = (int) Math.round(Math.random() * 10 - 1);
        int bomba31 = (int) Math.round(Math.random() * 10 - 1);
        int bomba32 = (int) Math.round(Math.random() * 10 - 1);

        matriz[navio1][navio2] = 1;
        matriz[bomba11][bomba12] = 2;
        matriz[bomba21][bomba22] = 2;
        matriz[bomba31][bomba32] = 2;

        while (!acertouONavio && !acertouTresBombas) {
            System.out.print("Escolha uma casa: ");
            int casa1 = s.nextInt();
            int casa2 = s.nextInt();
            if (matriz[casa1][casa2] == 1) {
                System.out.println("Acertou o navio!");
                acertouONavio = true;
            }
            else if (matriz[casa1][casa2] == 2) {
                System.out.println("Acertou uma bomba!");
                bombas++;
                if (bombas == 3) {
                    acertouTresBombas = true;
                }
            }
            else {
                System.out.println("Errou!");;
            }
        }
        System.out.println("Parabéns, você venceu!");
        s.close();
    }
}
