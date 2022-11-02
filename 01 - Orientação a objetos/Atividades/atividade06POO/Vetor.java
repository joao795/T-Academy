package atividade06POO;

public class Vetor {
    int[] numeros = new int[5];
    int tamanho = 0;

    public Vetor(int n1, int n2, int n3, int n4, int n5) {
        numeros[0] = n1;
        numeros[1] = n2;
        numeros[2] = n3;
        numeros[3] = n4;
        numeros[4] = n5;
    }

    public String maiorParaMenor() {
        int aux;
        for (int i = 0; i < 4; i++) {
            for (int j = i + 1; j < 5; j++) {
                if (numeros[j] > numeros[i]) {
                    aux = numeros[i];
                    numeros[i] = numeros[j];
                    numeros[j] = aux;
                }
            }           
        }        
        String str = "";
        for (int i = 0; i < 4; i++) {
            str += numeros[i] + ", ";
        }
        return str + numeros[4] + ".";
    }

    public String menorParaMaior() {
        int aux;
        for (int i = 0; i < 4; i++) {
            for (int j = i + 1; j < 5; j++) {
                if (numeros[j] < numeros[i]) {
                    aux = numeros[i];
                    numeros[i] = numeros[j];
                    numeros[j] = aux;
                }
            }           
        }        
        String str = "";
        for (int i = 0; i < 4; i++) {
            str += numeros[i] + ", ";
        }
        return str + numeros[4] + ".";
    }

    public int soma() {
        int soma = 0;
        for (int i = 0; i < numeros.length; i++) {
            soma += numeros[i];
        }
        return soma;
    }

    public int media() {
        int soma = 0;
        for (int i = 0; i < numeros.length; i++) {
            soma += numeros[i];
        }
        return soma / numeros.length;
    }

    public String maiorOuIgualAMedia() {
        int soma = 0;
        String str = "";
        for (int i = 0; i < numeros.length; i++) {
            soma += numeros[i];
        }
        for (int i = 0; i < numeros.length; i++) {
            if (numeros[i] >= soma / numeros.length) {
                str += numeros[i] + " ";
            }
        }
        return str;
    }
}
