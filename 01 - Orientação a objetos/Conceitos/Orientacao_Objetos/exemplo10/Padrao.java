package Orientacao_Objetos.exemplo10;

public class Padrao {
    public void valeTransporte(double salario) {
        System.out.println("Vale-transporte: R$" + salario * 0.06);
    }

    public void valeAlimentacao(double salario) {
        System.out.println("Vale-alimentação: R$" + salario * 0.1);
    }
}
