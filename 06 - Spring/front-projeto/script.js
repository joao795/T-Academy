// vetor de artistas
let vetor = [];

window.onload = function() {
    obterArtistas();
}

function obterArtistas() {
    fetch("http://localhost:8080/artistas")
    .then(retorno => retorno.json())
    .then(artistas => vetor = artistas)
    .then(() => listarArtistas());
}

function pesquisarArtista(termo) {
    fetch(`http://localhost:8080/pesquisarArtista/${termo}`)
    .then(retorno => retorno.json())
    .then(artistas => vetor = artistas)
    .then(() => listarArtistas());
}

function listarArtistas(){
    let tabela = document.getElementById("tabela");
    tabela.innerHTML="";

    for(let i = 0; i < vetor.length; i++){
        let linha = tabela.insertRow(-1);

        let colunaCodigo = linha.insertCell(0); 
        let colunaNome = linha.insertCell(1); 
        let colunaSelecionar = linha.insertCell(2);

        colunaCodigo.innerText = vetor[i].codigo; 
        colunaNome.innerText = vetor[i].nome;
        colunaSelecionar.innerHTML = `<button onclick="selecionarArtista(${vetor[i].codigo})" class="btn btn-primary">Selecionar</button>`; 

    }
}

function cadastrarArtista() {
    let nome = document.getElementById("nome").value;  

    if (nome.length == 0) {
        alert("O nome do artista deve possuir pelo menos um caracter.");
    }
    else {
        let obj = {
            "nome": nome
        }

        fetch("http://localhost:8080/artistas", {
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
            listarArtistas();
        })
    }
}

function selecionarArtista(codigo) {
    fetch(`http://localhost:8080/artistas/${codigo}`)
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

    });
}

function removerArtista() {

    //obter o código que está no input hidden
    let codigo = parseInt(document.getElementById("codigo").value);

    //requisição 
    fetch(`http://localhost:8080/artistas/${codigo}`, {method: "DELETE"})
    .then(() => {

        //obter a posição no vetor referente ao produto que será removido
        let posicaoVetor = vetor.findIndex(objLinha => 
            {return objLinha.codigo == codigo
        });

        //remover produto do vetor
        vetor.splice(posicaoVetor, 1);

        //atualizar a tabela
        listarArtistas();
    })
}

function alterarArtista() {
    let codigo = parseInt(document.getElementById("codigo").value);
    let nome = document.getElementById("nome").value;

    if (nome.length == 0) {
        alert("O nome do artista deve possuir pelo menos um caracter.");
    }
    else {
        let obj = {
            "codigo": codigo,
            "nome": nome
        }

        fetch("http://localhost:8080/artistas", {
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
            listarArtistas();

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

    //visibilidade dos botões
    document.getElementById("btnCadastrar").style.display = "inline-block";
    document.getElementById("btnAlterar").style.display = "none";
    document.getElementById("btnRemover").style.display = "none";
}