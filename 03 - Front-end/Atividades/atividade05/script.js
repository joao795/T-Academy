function calcular() {
    let moeda1 = document.getElementById('moeda1')
    let moeda2 = document.getElementById('moeda2')
    let retorno = document.getElementById('retorno')
    let valor = parseFloat(document.getElementById('valor').value)

    if (moeda1.value == 'default' || moeda2.value == 'default') {
        retorno.innerText = 'ERRO: escolha duas moedas.'
    }
    else {
        if (moeda1.value == 'real') {
            if (moeda2.value == 'dolar') {
                retorno.innerText = valor / 5
            }
            else if (moeda2.value == 'real') {
                retorno.innerText = valor
            }
            else {
                retorno.innerText = valor / 10
            }
        }
        else if (moeda1.value == 'dolar') {
            if (moeda2.value == 'real') {
                retorno.innerText = valor * 5 
            }
            else if (moeda2.value == 'dolar') {
                retorno.innerText = valor
            }
            else {
                retorno.innerText = valor / 2
            }
        }
        else {
            if (moeda2.value == 'real') {
                retorno.innerText = valor * 10
            }
            else if (moeda2.value == 'euro') {
                retorno.innerText = valor
            }
            else {
                retorno.innerText = valor * 2
            }
        }
    }
}