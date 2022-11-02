package atividade03POO;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;

public class Classe {
    public String obterDiaAnterior(String dataString) {
        DateTimeFormatter f = DateTimeFormatter.ofPattern( "dd/MM/uuuu" );
        LocalDate data = LocalDate.parse(dataString , f );

        if (data.getYear() % 4 == 0) {
            if (data.getMonthValue() == 3) {
                if (data.getDayOfMonth() == 1) {
                    return "29/02/" + data.getYear();
                }
                else {
                    return data.getDayOfMonth() - 1 + "/03/" + data.getYear();
                }
            }
            else if (data.getMonthValue() == 1) {
                if (data.getDayOfMonth() == 1) {
                    return "31/12/" + (data.getYear() - 1);
                }
                else {
                    return data.getDayOfMonth() - 1 + "/" + (data.getMonthValue() - 1) + "/" + data.getYear(); 
                }
            }
            else {
                if (data.getMonthValue() < 8) {
                    if (data.getMonthValue() % 2 == 0) {
                        if (data.getDayOfMonth() == 1) {
                            return "31/" + (data.getMonthValue() - 1) + "/" + data.getYear();
                        }
                        else {
                            return data.getDayOfMonth() - 1 + "/" + (data.getMonthValue() - 1) + "/" + data.getYear();
                        }
                    }
                    else {
                        if (data.getDayOfMonth() == 1) {
                            return "30/" + (data.getMonthValue() - 1) + "/" + data.getYear();
                        }
                        else {
                            return data.getDayOfMonth() - 1 + "/" + (data.getMonthValue() - 1) + "/" + data.getYear(); 
                        }
                    }
                }
                else {
                    if (data.getMonthValue() % 2 == 0) {
                        if (data.getDayOfMonth() == 1) {
                            return "30/" + (data.getMonthValue() - 1) + "/" + data.getYear();
                        }
                        else {
                            return data.getDayOfMonth() - 1 + "/" + data.getMonthValue() + "/" + data.getYear();
                        }
                    }
                    else {
                        if (data.getDayOfMonth() == 1) {
                            return "31/" + (data.getMonthValue() - 1) + "/" + data.getYear();
                        }
                        else {
                            return data.getDayOfMonth() - 1 + "/" + data.getMonthValue() + "/" + data.getYear(); 
                        }
                    }
                }
            }
        }
        else {
            if (data.getMonthValue() == 3) {
                if (data.getDayOfMonth() == 1) {
                    return "28/02/" + data.getYear();
                }
                else {
                    return data.getDayOfMonth() - 1 + "/03/" + data.getYear();
                }
            }
            else if (data.getMonthValue() == 1) {
                if (data.getDayOfMonth() == 1) {
                    return "31/12/" + data.getYear();
                }
                else {
                    return data.getDayOfMonth() - 1 + "/" + (data.getMonthValue() - 1) + "/" + data.getYear(); 
                }
            }
            else {
                if (data.getMonthValue() < 8) {
                    if (data.getMonthValue() % 2 == 0) {
                        if (data.getDayOfMonth() == 1) {
                            return "31/" + (data.getMonthValue() - 1) + "/" + data.getYear();
                        }
                        else {
                            return data.getDayOfMonth() - 1 + "/" + (data.getMonthValue() - 1) + "/" + data.getYear();
                        }
                    }
                    else {
                        if (data.getDayOfMonth() == 1) {
                            return "30/" + (data.getMonthValue() - 1) + "/" + data.getYear();
                        }
                        else {
                            return data.getDayOfMonth() - 1 + "/" + (data.getMonthValue() - 1) + "/" + data.getYear(); 
                        }
                    }
                }
                else {
                    if (data.getMonthValue() % 2 == 0) {
                        if (data.getDayOfMonth() == 1) {
                            return "30/" + (data.getMonthValue() - 1) + "/" + data.getYear();
                        }
                        else {
                            return data.getDayOfMonth() - 1 + "/" + data.getMonthValue() + "/" + data.getYear();
                        }
                    }
                    else {
                        if (data.getDayOfMonth() == 1) {
                            return "31/" + (data.getMonthValue() - 1) + "/" + data.getYear();
                        }
                        else {
                            return data.getDayOfMonth() - 1 + "/" + data.getMonthValue() + "/" + data.getYear(); 
                        }
                    }
                }               
            }
        }
    }
}
