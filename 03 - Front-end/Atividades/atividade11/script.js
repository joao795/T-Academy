let produtos = []

function cadastrar() {
    let nome = document.getElementById('nome').value
    let marca = document.getElementById('marca').value
    let valor = document.getElementById('valor').value 

    if(nome == '') {
        alert('Favor informar um nome.')
        nome.focus()
    } 
    else if(marca == '') {
        alert('Favor informar uma marca.')
        marca.focus()
    } 
    else if(valor == '') {
        alert('Favor informar um valor.')
        valor.focus()
    }
    else {
        let obj = {
            'nome': nome,
            'marca': marca,
            'valor': valor
        }
    
        produtos.push(obj)
        selecionar()
    }

}

function selecionar() {
    let tabela = document.getElementById('tabela')
    for (let i = 0; i < produtos.length; i++) {
        let linha = tabela.insertRow(-1)

        let col1 = linha.insertCell(0)
        let col2 = linha.insertCell(1)
        let col3 = linha.insertCell(2)

        col1.innerHTML = produtos[i].nome
        col2.innerHTML = produtos[i].marca 
        col3.innerHTML = produtos[i].valor
    }
}