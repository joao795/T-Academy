function retornarHorario() {
    let cidade = document.getElementById('cidade').value
    let horario = []
    horario = document.getElementById('hora').value.split(':')
    let resultado = parseInt(horario[0])
    let retorno = document.getElementById('retorno')

    switch(cidade) {
        case 'lisboa':
            resultado += 4
        break 
        case 'ny':
            resultado -= 1
        break 
        case 'mexico':
            resultado -= 2
        break 
        case 'toquio':
            resultado += 12
        break 
        case 'berlim': 
            resultado += 5
        break
        default:

    }
        
    retorno.innerText = resultado + ':' + horario[1]  
}