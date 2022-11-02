package atividade06POO;

public class Principal {
    public static void main(String[] args) {
        Vetor v = new Vetor(4, 2, 5, 1, 3);

        System.out.println(v.menorParaMaior());
        System.out.println(v.maiorParaMenor());
        System.out.println(v.soma());
        System.out.println(v.media());
        System.out.println(v.maiorOuIgualAMedia());
    }
}
