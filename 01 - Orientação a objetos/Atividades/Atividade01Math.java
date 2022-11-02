import java.util.Scanner;
import java.lang.Math;

public class Atividade01Math {
    public static void main(String[] args) {
        System.out.println("Escolha uma operação:" +
        "\n1. soma" +
        "\n2. subtração" +
        "\n3. multiplicação" +
        "\n4. divisão" +
        "\n5. seno" +
        "\n6. cosseno" +
        "\n7. tangente" +
        "\n8. log" +
        "\n9. raiz quadrada" +
        "\n10. raiz cúbica");

        Scanner s = new Scanner(System.in);
        int op = s.nextInt();
        double n1;
        double n2;
        double resultado = 0;

        switch (op) {
            case 1:
            System.out.println("Informe um valor:");
            n1 = s.nextInt();
            System.out.println("Informe outro valor:");
            n2 = s.nextInt();
            resultado = n1 + n2;
            break;
            case 2:
            System.out.println("Informe um valor:");
            n1 = s.nextInt();
            System.out.println("Informe outro valor:");
            n2 = s.nextInt();
            resultado = n1 + n2;
            break;
            case 3:
            System.out.println("Informe um valor:");
            n1 = s.nextInt();
            System.out.println("Informe outro valor:");
            n2 = s.nextInt();
            resultado = n1 * n2;
            break;
            case 4:
            System.out.println("Informe um valor:");
            n1 = s.nextInt();
            System.out.println("Informe outro valor:");
            n2 = s.nextInt();
            resultado = n1 / n2;
            break;
            case 5:
            System.out.println("Informe um valor:");
            n1 = s.nextInt();
            resultado = Math.sin(n1);
            break;
            case 6:
            System.out.println("Informe um valor:");
            n1 = s.nextInt();
            resultado = Math.cos(n1);
            break;
            case 7:
            System.out.println("Informe um valor:");
            n1 = s.nextInt();
            resultado = Math.tan(n1);
            break;
            case 8:
            System.out.println("Informe um valor:");
            n1 = s.nextInt();
            resultado = Math.log(n1);
            break;
            case 9:
            System.out.println("Informe um valor:");
            n1 = s.nextInt();
            resultado = Math.sqrt(n1);
            break;
            case 10:
            System.out.println("Informe um valor:");
            n1 = s.nextInt();
            resultado = Math.cbrt(n1);
            break;
        }
        System.out.println("RESULTADO: " + resultado);
        s.close();
    }
}
