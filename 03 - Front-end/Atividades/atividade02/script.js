function calcular(valor) {
    let resposta = document.getElementById('resposta')
    if (valor >= 100) {
        if (document.getElementById('vista').checked) {
            resposta.innerText = 'Valor com desconto: ' + valor * 0.9
        }
        else {
            resposta.innerText = 'O desconto só é dado para compras à vista. Valor a pagar: R$' + valor
        }
    }
    else {
        resposta.innerText = 'O desconto só é dado para compras de R$100,00 ou acima. Valor a pagar: R$' + valor
    }
}