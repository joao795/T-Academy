package br.com.tdd;


public class CalculosTeste {
    @Test(expected = NumberFormatException.class)
    public void efetuarTeste() {
        Calculos c = new Calculos();
        double resultado = c.divisao("10", "2");

        assertEquals(resultado, 5);
    }

    @Test
    public void testeControle() {
        Controle c = new Controle();
        assertEquals(c.retornaNome("Ana"), null);
    }

}
