function retornarMenorNumero() {
    let num1 = document.getElementById('num1').value 
    let num2 = document.getElementById('num2').value 
    let num3 = document.getElementById('num3').value 
    let maior
    let resultado = document.getElementById('resultado')

    if (num1 > num2) {
        if (num1 > num3) {
            maior = num1 
        }
        else {
            maior = num3 
        }
    }
    else if (num2 > num3) {
        if (num2 > num1) {
            maior = num2    
        }
        else {
            maior = num1
        }
    }
    else if (num3 > num2) {
        maior = num3 
    }
    else {
        maior = num2
    }

    resultado.innerText = 'Maior número: ' + maior
}