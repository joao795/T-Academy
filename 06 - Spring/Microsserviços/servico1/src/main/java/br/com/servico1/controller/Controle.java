

@RestController
public class Controle {
    
    @GetMapping("/verificar/{numero}")
    public String parImpar(@PathVariable int numero) {
        return numero % 2 == 0 ? "O número é par." : "O número é ímpar.";
    }
}
