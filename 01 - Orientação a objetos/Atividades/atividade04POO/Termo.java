package atividade04POO;

public class Termo {
    private String termo;

    public int getQtdVogais() {
        termo = this.getTermo().toLowerCase();
        int cont = 0;
        for (int i = 0; i < termo.length(); i++) {
            if (termo.charAt(i) == 'a' || termo.charAt(i) == 'e'
            || termo.charAt(i) == 'i' || termo.charAt(i) == 'o'
            || termo.charAt(i) == 'u') {
                cont++;
            }
        }
        return cont;
    }

    public int getQtdConsoantes() {
        termo = this.getTermo().toLowerCase();
        int cont = 0;
        for (int i = 0; i < termo.length(); i++) {
            if (Character.isLetter(termo.charAt(i)) && termo.charAt(i) != 'a' && termo.charAt(i) != 'e'
            && termo.charAt(i) != 'i' && termo.charAt(i) != 'o'
            && termo.charAt(i) != 'u') {
                cont++;
            }
        }
        return cont;
    }

    public int getQtdNumeros() {
        int cont = 0;
        for (int i = 0; i < termo.length(); i++) {
            if (Character.isDigit(this.getTermo().charAt(i))) {
                cont++;
            }
        }
        return cont;
    }

    public int getQtdEspacos() {
        int cont = 0;
        for (int i = 0; i < termo.length(); i++) {
            if (Character.isWhitespace(this.getTermo().charAt(i))) {
                cont++;
            }
        }
        return cont;
    }

    public int getQtdCaracteresEspciais() {
        int cont = 0;
        for (int i = 0; i < termo.length(); i++) {
            if (!Character.isDigit(this.getTermo().charAt(i))
            && !Character.isLetter(this.getTermo().charAt(i))
            && !Character.isWhitespace(this.getTermo().charAt(i))) {
                cont++;
            }
        }
        return cont;
    }

    public Termo(String termo) {
        this.termo = termo;
    }

    private String getTermo() {
        return termo;
    }
}
