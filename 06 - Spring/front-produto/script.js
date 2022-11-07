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
        colunaSelecionar.innerHTML = `<button onclick="selecionar(${vetor[i].codigo})" class="btn btn-primary">Selecionar</button>`; 

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
        .then(retorno_convertido => {
            vetor.push(retorno_convertido);
            listarProdutos();
        })
    }
}

function selecionar(codigo) {
    fetch(`http://localhost:8080/${codigo}`)
    .then(retorno => retorno.json())
    .then(retorno_convertido => {

        //desabilitar o botão de cadastro
        document.getElementById("btnCadastrar").style.display = "none";

        //exibir os botões de alteração e exclusão
        document.getElementById("btnAlterar").style.display = "inline-block";
        document.getElementById("btnRemover").style.display = "inline-block";

        //preencher os inputs
        document.getElementById("codigo").value = retorno_convertido.codigo;
        document.getElementById("nome").value = retorno_convertido.nome;
        document.getElementById("valor").value = retorno_convertido.valor;

    });
}

function remover() {

    //obter o código que está no input hidden
    let codigo = parseInt(document.getElementById("codigo").value);

    //requisição 
    fetch(`http://localhost:8080/${codigo}`, {method: "DELETE"})
    .then(() => {

        //obter a posição no vetor referente ao produto que será removido
        let posicaoVetor = vetor.findIndex(objLinha => 
            {return objLinha.codigo == codigo
        });

        //remover produto do vetor
        vetor.splice(posicaoVetor, 1);

        //atualizar a tabela
        listarProdutos();
    })
}

function alterar() {
    let codigo = parseInt(document.getElementById("codigo").value);
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
            "codigo": codigo,
            "nome": nome,
            "valor": valor
        }

        fetch("http://localhost:8080", {
            method: "PUT",
            headers: {
                "accept": "application/json",
                "content-type": "application/json"
            },
            body: JSON.stringify(obj)
        })
        .then(retorno => retorno.json())
        .then(retorno_convertido => {
            let posicaoVetor = vetor.findIndex(objLinha => {
                return objLinha.codigo == codigo;
            })

            //alterar o produto no vetor
            vetor[posicaoVetor] = retorno_convertido;

            //atualizar a tabela
            listarProdutos();

            //limpar o formulário
            formularioPadrao();
        })
    }
}

//função para limpar os campos e modificar a visibilidade dos botões
function formularioPadrao() {
    //limpar os inputs
    document.getElementById("codigo").value = "";
    document.getElementById("nome").value = "";
    document.getElementById("valor").value = "";

    //visibilidade dos botões
    document.getElementById("btnCadastrar").style.display = "inline-block";
    document.getElementById("btnAlterar").style.display = "none";
    document.getElementById("btnRemover").style.display = "none";
}