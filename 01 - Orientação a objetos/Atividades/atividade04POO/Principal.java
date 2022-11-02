package atividade04POO;

public class Principal {
    public static void main(String[] args) {
        Termo t = new Termo("ooo99ppp   /a:");
        System.out.println(t.getQtdVogais() + t.getQtdConsoantes() + t.getQtdNumeros() + t.getQtdEspacos() + t.getQtdCaracteresEspciais());
    }
}
