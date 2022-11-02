public class Atividade02POO {
    private float valorInvestido;
    private int tempo;
    private float taxa;

    public float obterTaxaMensal() {
        return this.getTaxa() / this.getTempo();
    }

    public float getValorInvestido() {
        return valorInvestido;
    }

    public void setValorInvestido(float valorInvestido) {
        this.valorInvestido = valorInvestido;
    }

    public int getTempo() {
        return tempo;
    }

    public void setTempo(int tempo) {
        this.tempo = tempo;
    }

    public float getTaxa() {
        return taxa;
    }

    public void setTaxa(float taxa) {
        this.taxa = taxa;
    }    
}
