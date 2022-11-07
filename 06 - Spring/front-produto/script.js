// vetor de produtos
let vetor = [];

window.onload = function(){
    obterProdutos();
}

function obterProdutos(){
    fetch("http://localhost:8080")
    .then(retorno => retorno.json())
    .then(produtos => vetor = produtos)
    .then(() => listarProdutos());
}

function listarProdutos(){
    let tabela = document.getElementById("tabela");
    tabela.innerHTML="";

    for(let i = 0; i < vetor.length; i++){
        let linha = tabela.insertRow(-1);

        let colunaCodigo = linha.insertCell(0); 
        let colunaNome = linha.insertCell(1); 
        let colunaValor = linha.insertCell(2); 
        let colunaSelecionar = linha.insertCell(3);

        colunaCodigo.innerText = vetor[i].codigo; 
        colunaNome.innerText = vetor[i].nome;
        colunaValor.innerText = vetor[i].valor; 
        colunaSelecionar.innerHTML = `<button class="btn btn-primary">Selecionar</button>`; 

    }
}

function cadastrar() {
    let nome = document.getElementById("nome").value;
    let valor = parseInt(document.getElementById("valor").value);    

    if (nome.length < 5) {
        alert("O nome do produto deve possuir pelo menos 5 caracteres.");
    }
    else if (valor <= 0 || isNaN(valor)) {
        alert("Informe um valor válido.");
    }
    else {
        let obj = {
            "nome": nome,
            "valor": valor
        }

        fetch("http://localhost:8080", {
            method: "POST",
            headers: {
                "accept": "application/json",
                "content-type": "application/json"
            },
            body: JSON.stringify(obj)
        })
        .then(retorno => retorno.json())
        .then(retorno_convertido => console.log(retorno_convertido))
    }
}