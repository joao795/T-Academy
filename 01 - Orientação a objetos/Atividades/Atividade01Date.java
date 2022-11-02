import java.time.LocalDateTime;

public class Atividade01Date {
    public static void main(String[] args) {
        LocalDateTime agora = LocalDateTime.now();

        int dia = agora.getDayOfMonth();
        int mes = agora.getMonthValue();
        int ano = agora.getYear();
        int horas = agora.getHour();
        int minutos = agora.getMinute();

        System.out.println(dia + "/" + mes + "/" + ano + " - " + horas + ":" + minutos);    
        
        String[] dias0 = {"um", "dois", "três", "quatro", "cinco", "seis", "sete", "oito", "nove", "dez"};
        String[] dias10 = {"dez", "onze", "doze", "treze", "quatorze", "quize", "dezesseis", "dezessete", "dezoito", "dezenove"};
        String diaString;

        if (dia < 10) {
            diaString = dias0[dia - 1];
        }
        else if (dia < 20) {
            diaString = dias10[dia - 11];
        }
        else if (dia < 30) {
            if (dia == 20) {
                diaString = "vinte";
            }
            else {
                diaString = "vinte e " + dias0[dia - 21];
            }
        }
        else {
            if (dia == 30) {
                diaString = "trinta";
            }
            else {
                diaString = "trinta e " + dias0[dia - 31];
            }
        }

        System.out.println(mes);
        String mesString = "";

        switch (mes) {
            case 1:
            mesString = "Janeiro";
            break;
            case 2:
            mesString = "Fevereiro";
            break;
            case 3:
            mesString = "Março";
            break;
            case 4:
            mesString = "Abril";
            break;
            case 5:
            mesString = "Maio";
            break;
            case 6:
            mesString = "Junho";
            break;
            case 7:
            mesString = "Julho";
            break;
            case 8:
            mesString = "Agosto";
            break;
            case 9:
            mesString = "Setembro";
            break;
            case 10:
            mesString = "Outubro";
            break;
            case 11:
            mesString = "Novembro";
            break;
            case 12:
            mesString = "Dezembro";
            break;
        }

        String anoString = dias0[(ano / 1000) - 1] + " mil";
        int resto = ano % 1000;
        if (resto != 0) {
            if (resto < 10) {
                anoString += " e " + dias0[resto - 1];
            }
            else if (resto == 10) {
                anoString += " e dez";
            }
            else if (resto < 20) {
                anoString += " e " + dias10[resto - 11];
            }
            else if (resto == 20) {
                anoString += " e vinte";
            }
            else {
                anoString += " e vinte e " + dias0[resto - 21]; 
            }
        } 

        System.out.println(anoString);

        System.out.println((diaString + " de " + mesString + " de " + anoString).toUpperCase());
    }
}