function calcular() {
    let nota1 = document.getElementById('nota1').value
    let nota2 = document.getElementById('nota2').value 
    let resultado = document.getElementById('resultado')

    if (nota1 == '' || nota2 == '') {
        resultado.innerText = 'ERRO: digite duas notas.'
    }
    else {
        let media = (parseFloat(nota1) + parseFloat(nota2)) / 2

        resultado.innerText = 'Média: ' + media
    }   
}