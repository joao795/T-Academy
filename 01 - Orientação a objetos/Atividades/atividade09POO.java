import java.util.Random;
import java.util.Scanner;

public class atividade09POO {
    public static void main(String[] args) {
        Scanner s = new Scanner(System.in);
        char[][] matriz = new char[3][3];
        int jogada = 1;
        String tabuleiro = obterTabuleiro(matriz);

        System.out.println("Opções:\n1. Jogar com um amigo\n2. Jogar contra o computador");
        int opcao = s.nextInt();

        for (int i = 0; i < 3; i++) {
            for (int j = 0; j < 3; j++) {
                matriz[i][j] = '-';
                tabuleiro += matriz[i][j];
            }
            if (i < 2) {
                tabuleiro += "\n";
            }
        }

        System.out.println(tabuleiro);
        boolean venceu = false;

        Random r = new Random();
        int linha;
        int coluna;

        if (opcao == 1) {
            while (!venceu) {
                if (jogada % 2 == 0) {
                    linha = r.nextInt(2);
                    coluna = r.nextInt(2);
                    if (matriz[linha][coluna] == '-') {
                        matriz[linha][coluna] = 'O';
                        System.out.println(obterTabuleiro(matriz));
                    }                
                }
                else {
                    linha = s.nextInt();
                    coluna = s.nextInt();
                    while (matriz[linha][coluna] != '-') {
                        linha = s.nextInt();
                        coluna = s.nextInt();  
                    }                      
                    matriz[linha][coluna] = 'X';
                }
                loop:
                for (int i = 0; i < 3; i++) {
                    if ((matriz[0][i] != 'X' && matriz[1][i] != 'X' && matriz[2][i] != 'X')
                    && (matriz[i][0] != 'X' && matriz[i][1] != 'X' && matriz[i][2] != 'X')) {
                        venceu = false;
                        break loop;
                    }
                    if ((matriz[0][i] != 'O' && matriz[1][i] != 'O' && matriz[2][i] != 'O')
                    && (matriz[i][0] != 'O' && matriz[i][1] != 'O' && matriz[i][2] != 'O')) {
                        venceu = false;
                        break loop;
                    }
                    venceu = true;
                }
                jogada++;
            }
        }
        else {
            while (!venceu) {
                if (jogada % 2 == 0) {
                    //TODO
                    linha = r.nextInt(2);
                    coluna = r.nextInt(2);
                    if (matriz[linha][coluna] == '-') {
                        matriz[linha][coluna] = 'O';
                        System.out.println(obterTabuleiro(matriz));
                    }                
                }
                else {
                    linha = s.nextInt();
                    coluna = s.nextInt();
                    if (matriz[linha][coluna] == '-') {
                        matriz[linha][coluna] = 'X';
                        System.out.println(obterTabuleiro(matriz));
                    }     
                }
                loop:
                for (int i = 0; i < 3; i++) {
                    if ((matriz[0][i] != 'X' && matriz[1][i] != 'X' && matriz[2][i] != 'X')
                    && (matriz[i][0] != 'X' && matriz[i][1] != 'X' && matriz[i][2] != 'X')) {
                        venceu = false;
                        break loop;
                    }
                    if ((matriz[0][i] != 'O' && matriz[1][i] != 'O' && matriz[2][i] != 'O')
                    && (matriz[i][0] != 'O' && matriz[i][1] != 'O' && matriz[i][2] != 'O')) {
                        venceu = false;
                        break loop;
                    }
                    venceu = true;
                }
                jogada++;       
            }

        }

        System.out.println("VENCEDOR!");

        s.close();
    }

    public static String obterTabuleiro(char[][] matriz) {
        String tabuleiro = "";
        for (int i = 0; i < 3; i++) {
            for (int j = 0; j < 3; j++) {
                tabuleiro += matriz[i][j];
            }
            if (i < 2) {
                tabuleiro += "\n";
            }
        }
        return tabuleiro;
    }
}
