obterProdutos();

function obterProdutos() {
    fetch("http://localhost:8080")
    .then(retorno => retorno.json())
    .then(produtos => console.table(produtos))
}