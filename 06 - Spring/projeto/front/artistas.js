//artistas de artistas
let artistas = [];

window.onload = function() {
    obterArtistas();
}

function obterArtistas() {
    fetch("http://localhost:8080/artistas")
    .then(retorno => retorno.json())
    .then(Artistas => artistas = Artistas)
    .then(() => listarArtistas());
}

function listarArtistas() {
    let tabela = document.getElementById("tabelaArtistas");
    tabela.innerHTML="";

    for(let i = 0; i < artistas.length; i++){
        let linha = tabela.insertRow(-1);

        let colunaCodigo = linha.insertCell(0); 
        let colunaNome = linha.insertCell(1); 
        let colunaSelecionar = linha.insertCell(2);

        colunaCodigo.innerText = artistas[i].codigo; 
        colunaNome.innerText = artistas[i].nome;
        colunaSelecionar.innerHTML = `<button onclick="selecionarArtista(${artistas[i].codigo})" class="btn btn-primary">Selecionar</button>`; 

    }
}

function cadastrarArtista() {
    let nome = document.getElementById("nomeArtista").value;  

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
            artistas.push(retorno_convertido);
            listarArtistas();
        })
    }
}

function selecionarArtista(codigo) {
    fetch(`http://localhost:8080/artistas/${codigo}`)
    .then(retorno => retorno.json())
    .then(retorno_convertido => {

        //desabilitar o botão de cadastro
        document.getElementById("btnCadastrarArtista").style.display = "none";

        //exibir os botões de alteração e exclusão
        document.getElementById("btnAlterarArtista").style.display = "inline-block";
        document.getElementById("btnRemoverArtista").style.display = "inline-block";

        //preencher os inputs
        document.getElementById("codigoArtista").value = retorno_convertido.codigo;
        document.getElementById("nomeArtista").value = retorno_convertido.nome;

    });
}

function removerArtista() {

    //obter o código que está no input hidden
    let codigo = parseInt(document.getElementById("codigoArtista").value);

    //requisição 
    fetch(`http://localhost:8080/artistas/${codigo}`, {method: "DELETE"})
    .then(() => {

        //obter a posição no artistas referente ao produto que será removido
        let posicaoArtistas = artistas.findIndex(objLinha => 
            {return objLinha.codigo == codigo
        });

        //remover produto do artistas
        artistas.splice(posicaoArtistas, 1);

        //atualizar a tabela
        listarArtistas();

        formularioPadrao();
    })
}

function alterarArtista() {
    let codigo = parseInt(document.getElementById("codigoArtista").value);
    let nome = document.getElementById("nomeArtista").value;

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
            let posicaoArtistas = artistas.findIndex(objLinha => {
                return objLinha.codigo == codigo;
            })

            //alterar o produto no artistas
            artistas[posicaoArtistas] = retorno_convertido;

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
    document.getElementById("codigoArtista").value = "";
    document.getElementById("nomeArtista").value = "";

    //visibilidade dos botões
    document.getElementById("btnCadastrarArtista").style.display = "inline-block";
    document.getElementById("btnAlterarArtista").style.display = "none";
    document.getElementById("btnRemoverArtista").style.display = "none";
}

function pesquisarArtista(termo) {
    fetch(`http://localhost:8080/artistas/pesquisar/${termo}`)
    .then(retorno => retorno.json())
    .then(listaArtistas => artistas = listaArtistas)
    .then(() => listarArtistas());
}