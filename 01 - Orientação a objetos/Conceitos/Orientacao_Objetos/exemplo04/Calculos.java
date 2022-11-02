package Orientacao_Objetos.exemplo04;

public class Calculos {
    private static int contador = 0;

    public Calculos() {
        contador++;
        System.out.println(contador);
    }

    public static void soma(int n1, int n2) {
        System.out.println(n1 + n2);
    }
}
