let joao = 0
let ralf = 0
let brena = 0
let eula = 0
let nulo = 0
let total = 0

function votar() {
    let candidato = document.getElementById('candidato').value 
    total++

    switch(candidato) {
        case 'joao':
            joao++
        break
        case 'ralf':
            ralf++
        break 
        case 'brena':
            brena++ 
        break 
        case 'eula':
            eula++
        break
        case 'nulo':
            nulo++
        break
    }
}

function contarVotos() {
    let resultado = document.getElementById('resultado')
    let vencedor = Math.max(joao, ralf, brena, eula)
    let nomeVencedor

    switch(vencedor) {
        case joao:
            nomeVencedor = 'João'
        break 
        case ralf: 
            nomeVencedor = 'Ralf'
        break 
        case brena:
            nomeVencedor = 'Brena'
        break 
        case eula:
            nomeVencedor = 'Eula'
        break
    }

    resultado.innerHTML = 'João conseguiu ' + joao + ' votos.' + '<br>'
    + 'Ralf conseguiu ' + ralf + ' votos.' + '<br>' 
    + 'Brena conseguiu ' + brena + ' votos.' + '<br>'
    + 'Eula conseguiu ' + eula + ' votos.' + '<br>'
    + 'Houve ' + nulo + ' votos nulos.' + '<br>'
    + 'No total, ' + total + ' pessoas votaram.' + '<br>'
    + 'O vencedor é ' + nomeVencedor + '.'
}