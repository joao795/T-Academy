let qtdProdutos = 0

function contar(checkbox) {
    let total = document.getElementById('total')
    let item = document.getElementById(checkbox)

    if (item.checked) {
        qtdProdutos++                
    }
    else {
        qtdProdutos-- 
    }

    total.innerText = qtdProdutos + ' itens selcionados.'
}