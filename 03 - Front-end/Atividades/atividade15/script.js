let marcas = []
let produtos = []
let cont = 3

function enviar() {
    let email = document.getElementById('email')
    let senha = document.getElementById('senha') 

    if (email.value == 'usuario@dominio.com' && senha.value == '12345') {
        document.getElementById('marcas').style.display = 'block'
        document.getElementById('produtos').style.display = 'block'
        document.getElementById('login').style.display = 'none'
        document.getElementById('finalizar').style.display = 'block'
    }
    else {
        cont--
        alert('E-mail ou senha incorretos. Restam ' + cont + ' tentativas.')
        if (cont == 0) {
            let botao = document.getElementById('botaoLogin')
            botao.disabled = true
        }
    }
}

function voltar() {
    document.getElementById('marcas').style.display = 'none'
    document.getElementById('produtos').style.display = 'none'
    document.getElementById('login').style.display = 'block'
    document.getElementById('finalizar').style.display = 'none'
}

function cadastrarMarca() {
    let nome = document.getElementById('nomeMarca').value

    let marcaExiste = false

    for (let i = 0; i < marcas.length; i++) {
        if (nome.toLowerCase() == marcas[i].nome.toLowerCase()) {
            marcaExiste = true
            break
        } 
    }

    if (nome == '') {
        alert('Informe um nome, babaca.')
    }
    else if (marcaExiste) {
        alert('Você já cadastrou essa marca, babaca.')
    }
    else {
        let obj = {
            'nome': nome
        }

        marcas.push(obj)
        selecionarMarcas()
    }
}

function cadastrarProduto() {
    let nome = document.getElementById('nomeProduto').value
    let marca = document.getElementById('marcaProduto').value
    let valor = document.getElementById('valor').value

    let marcaExiste = false
    let produtoExiste = false

    for (let i = 0; i < marcas.length; i++) {
        if (marca.toLowerCase() == marcas[i].nome.toLowerCase()) {
            marcaExiste = true
            break
        } 
    }

    for (let i = 0; i < produtos.length; i++) {
        if (nome.toLowerCase() == produtos[i].nome.toLowerCase()) {
            produtoExiste = true
            break
        }
    }

    if (nome == '' || marca == '' || valor == '') {
        alert('Informe um nome, uma marca e um valor, babaca.')
    }
    else if (produtoExiste) {
        alert('Você já cadastrou esse produto, babaca.')
    }
    else if (!marcaExiste) {
        alert('Essa marca não exite, babaca.')
    }
    else {
        let obj = {
            'nome': nome,
            'marca': marca,
            'valor': valor
        }

        produtos.push(obj)
        selecionarProdutos()
    }
}

function selecionarMarcas() {
    let tabela = document.getElementById('tabelaMarcas')

    tabela.innerHTML = ''

    for (let i = 0; i < marcas.length; i++) {
        let linha = tabela.insertRow(-1)

        let col1 = linha.insertCell(0)
        let col2 = linha.insertCell(1)

        col1.innerHTML = marcas[i].nome
        col2.innerHTML = "<button class='botao' onclick='removerMarca(" + i + ")'>Remover</button>"
    }
}

function selecionarProdutos() {
    let tabela = document.getElementById('tabelaProdutos')

    tabela.innerHTML = ''

    for (let i = 0; i < produtos.length; i++) {
        let linha = tabela.insertRow(-1)

        let col1 = linha.insertCell(0)
        let col2 = linha.insertCell(1)
        let col3 = linha.insertCell(2)
        let col4 = linha.insertCell(3)

        col1.innerHTML = produtos[i].nome
        col2.innerHTML = produtos[i].marca
        col3.innerHTML = produtos[i].valor
        col4.innerHTML = "<button class='botao' onclick='removerProduto(" + i + ")'>Remover</button>"
    }
}

function removerMarca(indice) {
    let marcaEstaVazia = true

    for (let i = 0; i < produtos.length; i++) {
        if (marcas[i].nome.toLowerCase() == produtos[i].marca.toLowerCase()) {
            alert('Essa marca ainda possui produtos, babaca.')
            marcaEstaVazia = false
        }
    } 

    if (marcaEstaVazia) {
        marcas.splice(indice, 1)
        selecionarMarcas()
    }
}

function removerProduto(indice) {
    produtos.splice(indice, 1)
    selecionarProdutos()
}