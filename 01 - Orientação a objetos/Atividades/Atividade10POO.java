import java.util.Scanner;

public class Atividade10POO {
    public static void main(String[] args) {
        Scanner s = new Scanner(System.in);

        int joao = 0;
        int matheus = 0;
        int gustavo = 0;
        int sophia = 0;

        int opcao;

        do {
            System.out.println("Escolha em quem votar:\nJoão - 1\nMatheus - 2\n Gustavo - 3\nSophia -4");
            opcao = s.nextInt();
            switch (opcao) {
                case 1:
                joao++;
                break;
                case 2:
                matheus++;
                break;
                case 3:
                gustavo++;
                break;
                case 4:
                sophia++;
                break;
                default:
                System.out.println("Não existe um candidato com esse número.");
            }
            System.out.println("Quer votar novamente?\n5. Sim\n6.Não");
            opcao = s.nextInt();
        } while (opcao != 6);

        int total = joao + matheus + gustavo + sophia;

        System.out.println("Total de votos: " + total);

        int[] candidatos = {joao, matheus, gustavo, sophia};
        int vencedor = 0;
        for (int i = 0; i < 4; i++) {
            if (candidatos[i] > vencedor) {
                vencedor = candidatos[i];
            }
        }

        System.out.println("O vencedor é: ");
        s.close();
    }
}
