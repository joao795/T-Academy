//vetor de Musicas
let musicas = [];
let musicasNomes = [];

window.onload = function() {
    obterMusicas();
}

function obterMusicas() {
    fetch("http://localhost:8080/musicas")
    .then(retorno => retorno.json())
    .then(Musicas => musicas = Musicas)
    .then(() => listarMusicas());
}

function pesquisarMusica(termo) {
    fetch(`http://localhost:8080/musicas/pesquisar/${termo}`)
    .then(retorno => retorno.json())
    .then(Musicas => musicas = Musicas)
    .then(() => listarMusicas());
}

function listarMusicas() {
    let tabela = document.getElementById("tabelaMusicas");
    tabela.innerHTML="";

    for(let i = 0; i < musicas.length; i++){
        let linha = tabela.insertRow(-1);

        let colunaCodigo = linha.insertCell(0); 
        let colunaNome = linha.insertCell(1); 
        //let colunaArtista = linha.insertCell(2);
        let colunaLink = linha.insertCell(2);
        let colunaSelecionar = linha.insertCell(3);

        colunaCodigo.innerText = musicas[i].codigo; 
        colunaNome.innerText = musicas[i].nome;
        //colunaArtista.innerText = musicas[i].codigo_artista;
        colunaLink.innerText = musicas[i].link;
        colunaSelecionar.innerHTML = `<button onclick="selecionarMusica(${musicas[i].codigo})" class="btn btn-primary">Selecionar</button>`; 

    }
}

function cadastrarMusica() {
    let nome = document.getElementById("nomeMusica").value;  
    let artista = parseInt(document.getElementById("artistaMusica").value);  
    let link = document.getElementById("linkMusica").value;  

    let codigo = parseInt(document.getElementById("codigoMusica").value);

    if (nome.length == 0) {
        alert("O nome da música deve possuir pelo menos um caracter.");
    }
    else if (artista <= 0 || isNaN(artista)) {
        alert("Informe um código de artista válido.");
    }
    else if (link.length == 0) {
        alert("O link deve possuir pelo menos um caracter.");
    }
    else {
        let obj = {
            "nome": nome,
            "link": link
        }

        fetch("http://localhost:8080/musicas", {
        method: "POST",
        headers: {
            "accept": "application/json",
            "content-type": "application/json"
        },
        body: JSON.stringify(obj)
        })
        .then(retorno => retorno.json())
        .then(retorno_convertido => {
            musicas.push(retorno_convertido);
            listarMusicas();
        })

        let musica = {
            "codigo": codigo,
            "nome": nome
        }

        fetch(`http://localhost:8080/artistas/${artista}`, {
            method: "PUT",
            headers: {
                "accept": "application/json",
                "content-type": "application/json"
            },
            body: JSON.stringify(musica)
        })
        .then(retorno => retorno.json())
        .then(retorno_convertido => {

            console.log(retorno_convertido);

        })
        
    }

    formularioPadrao();

}

function selecionarMusica(codigo) {
    fetch(`http://localhost:8080/musicas/${codigo}`)
    .then(retorno => retorno.json())
    .then(retorno_convertido => {

        //desabilitar o botão de cadastro
        document.getElementById("btnCadastrarMusica").style.display = "none";

        //exibir os botões de alteração e exclusão
        document.getElementById("btnAlterarMusica").style.display = "inline-block";
        document.getElementById("btnRemoverMusica").style.display = "inline-block";

        //preencher os inputs
        document.getElementById("codigoMusica").value = retorno_convertido.codigo;
        document.getElementById("nomeMusica").value = retorno_convertido.nome;
        document.getElementById("linkMusica").value = retorno_convertido.link

    });
}

function removerMusica() {

    //obter o código que está no input hidden
    let codigo = parseInt(document.getElementById("codigoMusica").value);

    //requisição 
    fetch(`http://localhost:8080/musicas/${codigo}`, {method: "DELETE"})
    .then(() => {

        //obter a posição no musicas referente ao produto que será removido
        let posicaomusicas = musicas.findIndex(objLinha => 
            {return objLinha.codigo == codigo
        });

        //remover produto do musicas
        musicas.splice(posicaomusicas, 1);

        //atualizar a tabela
        listarMusicas();

        formularioPadrao();
    })
}

function alterarMusica() {
    let codigo = parseInt(document.getElementById("codigoMusica").value);
    let nome = document.getElementById("nomeMusica").value;
    let artista = parseInt(document.getElementById("artistaMusica").value);
    let link = document.getElementById("linkMusica").value;

    if (nome.length == 0) {
        alert("O nome da música deve possuir pelo menos um caracter.");
    }
    else if (artista <= 0 || isNaN(artista)) {
        alert("Informe um código de artista válido.");
    }
    else if (link.length == 0) {
        alert("O link deve possuir pelo menos um caracter.");
    }
    else {
        let obj = {
            "codigo": codigo,
            "nome": nome,
            "link": link
        }

        fetch("http://localhost:8080/musicas", {
            method: "PUT",
            headers: {
                "accept": "application/json",
                "content-type": "application/json"
            },
            body: JSON.stringify(obj)
        })
        .then(retorno => retorno.json())
        .then(retorno_convertido => {
            let posicaomusicas = musicas.findIndex(objLinha => {
                return objLinha.codigo == codigo;
            })

            //alterar o produto no musicas
            musicas[posicaomusicas] = retorno_convertido;

            //atualizar a tabela
            listarMusicas();

            //limpar o formulário
            formularioPadrao();
        })

        let musica = {
            "codigo": codigo,
            "nome": nome
        }

        fetch(`http://localhost:8080/artistas/${artista}`, {
            method: "PUT",
            headers: {
                "accept": "application/json",
                "content-type": "application/json"
            },
            body: JSON.stringify(musica)
        })
        .then(retorno => retorno.json())
        .then(retorno_convertido => {

            console.log(retorno_convertido);

        })
    }
}

//função para limpar os campos e modificar a visibilidade dos botões
function formularioPadrao() {
    //limpar os inputs
    document.getElementById("codigoMusica").value = "";
    document.getElementById("nomeMusica").value = "";
    document.getElementById("artistaMusica").value = "";
    document.getElementById("linkMusica").value = "";

    //visibilidade dos botões
    document.getElementById("btnCadastrarMusica").style.display = "inline-block";
    document.getElementById("btnAlterarMusica").style.display = "none";
    document.getElementById("btnRemoverMusica").style.display = "none";
}