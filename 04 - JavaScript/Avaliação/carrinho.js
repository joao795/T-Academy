let carrinho = []

window.onload = function() {
    gerarCarrinho()
}

function adicionarAoCarrinho(indice) {
    let produtosLocal = JSON.parse(localStorage.getItem('produtos')) 
    let itens = JSON.parse(localStorage.getItem('carrinho')) 

    let idNome = 'nome' + indice
    let nome = document.getElementById(idNome).innerText

    let idAviso = 'aviso' + indice 
    let aviso = document.getElementById(idAviso)

    loop:
    for (let i = 0; i < produtosLocal.length; i++) {
        if (nome == produtosLocal[i].nome) {
            for (let i = 0; i < itens.length; i++) {
                if (nome == itens[i].nome) {
                    aviso.classList.remove('alert-success')
                    aviso.innerHTML = ''
                    aviso.classList.add('alert-danger')
                    aviso.innerText = 'Produto já adicionado'
                    break loop
                }
                
            }
            itens.push(produtosLocal[i])
            aviso.classList.remove('alert-danger')
            aviso.classList.add('alert-success')
            aviso.innerText = 'Adicionado ao carrinho'
            break loop                                     
        }    
    } 

    localStorage.setItem('carrinho', JSON.stringify(itens))
    localStorage.setItem('produtos', JSON.stringify(produtosLocal))     
}

function gerarCarrinho() {
    let itens = JSON.parse(localStorage.getItem('carrinho'))
    let total = 0
    let divCarrinho = document.getElementById('carrinho')

    divCarrinho.innerHTML = ''

    if (itens.length == 0) {
        divCarrinho.innerHTML = 'O carrinho está vazio :('
    }
    else {
        for (let i = 0; i < itens.length; i++) {
            divCarrinho.innerHTML += "<div><img src='" + itens[i].img + "'><br>"
            + itens[i].nome + '<br>R$' + itens[i].valor + ',00<br>' 
            + itens[i].quantidade + ' no carrinho<br>'
            + "<button class='btn btn-success btn-sm verde' onclick='aumentarItem(" + i + ")'>+1</button>"
            + "<button class='btn btn-danger btn-sm vermelho' onclick='diminuirItem(" + i + ")'>-1</button>"
            + "<button class='btn btn-danger btn-sm remover' onclick='removerItem(" + i + ")'>Remover</button></div><br>"
            total += parseInt(itens[i].valor) * itens[i].quantidade                                
        }

        divCarrinho.innerHTML += '<br>Total: R$' + total + ',00'
        + "<br><button class='btn btn-primary'>Finalizar compra</button>"
        console.log(itens.length)

    }
  
    localStorage.setItem('carrinho', JSON.stringify(itens))
}

function aumentarItem(indice) {
    let itens = JSON.parse(localStorage.getItem('carrinho'))

    loop:
    for (let i = 0; i < produtos.length; i++) {        
        if (produtos[i].estoque == 0) {
            break loop
        }
        if (produtos[i].nome == itens[indice].nome) {
            if (itens[indice].quantidade <= produtos[i].estoque) {
                itens[indice].quantidade++
            }
        }
    }

    localStorage.setItem('carrinho', JSON.stringify(itens))
    gerarCarrinho()
}

function diminuirItem(indice) {
    let itens = JSON.parse(localStorage.getItem('carrinho'))

    if (itens[indice].quantidade > 0) {
        loop:
        for (let i = 0; i < produtos.length; i++) {
            if (produtos[i].nome == itens[indice].nome) {
                //TODO
            }
            if (produtos[i].quantidade == 0) {
                break loop
            }
        }

        itens[indice].quantidade--
    }
    
    localStorage.setItem('carrinho', JSON.stringify(itens))
    gerarCarrinho()
}

function removerItem(indice) {
    let itens = JSON.parse(localStorage.getItem('carrinho'))

    itens.splice(indice, 1)
    localStorage.setItem('carrinho', JSON.stringify(itens))

    location.reload()
}