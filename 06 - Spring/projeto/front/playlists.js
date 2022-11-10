//playlists de playlists
let playlists = [];

window.onload = function() {
    obterPlaylists();
}

function obterPlaylists() {
    fetch("http://localhost:8080/playlists")
    .then(retorno => retorno.json())
    .then(Playlists => playlists = Playlists)
    .then(() => listarPlaylists());
}

function listarPlaylists() {
    let tabela = document.getElementById("tabelaPlaylists");
    tabela.innerHTML = "";

    for (let i = 0; i < playlists.length; i++){
        let linha = tabela.insertRow(-1);

        let colunaCodigo = linha.insertCell(0); 
        let colunaNome = linha.insertCell(1); 
        let colunaSelecionar = linha.insertCell(2);

        colunaCodigo.innerText = playlists[i].codigo; 
        colunaNome.innerText = playlists[i].nome;
        colunaSelecionar.innerHTML = `<button onclick="selecionarPlaylist(${playlists[i].codigo})" class="btn btn-primary">Selecionar</button>`; 

    }
}

function cadastrarPlaylist() {
    let nome = document.getElementById("nomePlaylist").value;

    if (nome.length == 0) {
        alert("O nome do playlist deve possuir pelo menos um caracter.");
    }
    else {
        let obj = {
            "nome": nome
        }

        fetch("http://localhost:8080/playlists", {
            method: "POST",
            headers: {
                "accept": "application/json",
                "content-type": "application/json"
            },
            body: JSON.stringify(obj)
        })
        .then(retorno => retorno.json())
        .then(retorno_convertido => {
            playlists.push(retorno_convertido);
            listarPlaylists();
        })
    }
}

function selecionarPlaylist(codigo) {
    fetch(`http://localhost:8080/playlists/${codigo}`)
    .then(retorno => retorno.json())
    .then(retorno_convertido => {

        //desabilitar o botão de cadastro
        document.getElementById("btnCadastrarPlaylist").style.display = "none";

        //exibir os botões de alteração e exclusão
        document.getElementById("btnAlterarPlaylist").style.display = "inline-block";
        document.getElementById("btnRemoverPlaylist").style.display = "inline-block";

        //preencher os inputs
        document.getElementById("codigoPlaylist").value = retorno_convertido.codigo;
        document.getElementById("nomePlaylist").value = retorno_convertido.nome;

    });
}

function removerPlaylist() {

    //obter o código que está no input hidden
    let codigo = parseInt(document.getElementById("codigoPlaylist").value);

    //requisição 
    fetch(`http://localhost:8080/playlists/${codigo}`, {method: "DELETE"})
    .then(() => {

        //obter a posição no playlists referente ao produto que será removido
        let posicaoplaylists = playlists.findIndex(objLinha => 
            {return objLinha.codigo == codigo
        });

        //remover produto do playlists
        playlists.splice(posicaoplaylists, 1);

        //atualizar a tabela
        listarPlaylists();

        formularioPadrao();
    })
}

function alterarPlaylist() {
    let codigo = parseInt(document.getElementById("codigoPlaylist").value);
    let nome = document.getElementById("nomePlaylist").value;

    if (nome.length == 0) {
        alert("O nome do playlist deve possuir pelo menos um caracter.");
    }
    else {
        let obj = {
            "codigo": codigo,
            "nome": nome
        }

        fetch("http://localhost:8080/playlists", {
            method: "PUT",
            headers: {
                "accept": "application/json",
                "content-type": "application/json"
            },
            body: JSON.stringify(obj)
        })
        .then(retorno => retorno.json())
        .then(retorno_convertido => {
            let posicaoplaylists = playlists.findIndex(objLinha => {
                return objLinha.codigo == codigo;
            })

            //alterar o produto no playlists
            playlists[posicaoplaylists] = retorno_convertido;

            //atualizar a tabela
            listarPlaylists();

            //limpar o formulário
            formularioPadrao();
        })
    }
}

//função para limpar os campos e modificar a visibilidade dos botões
function formularioPadrao() {
    //limpar os inputs
    document.getElementById("codigoPlaylist").value = "";
    document.getElementById("nomePlaylist").value = "";

    //visibilidade dos botões
    document.getElementById("btnCadastrarPlaylist").style.display = "inline-block";
    document.getElementById("btnAlterarPlaylist").style.display = "none";
    document.getElementById("btnRemoverPlaylist").style.display = "none";
}

function pesquisarPlaylist(termo) {
    fetch(`http://localhost:8080/playlists/pesquisar/${termo}`)
    .then(retorno => retorno.json())
    .then(listaplaylists => playlists = listaplaylists)
    .then(() => listarplaylists());
}