let musicas = [];

window.onload = function() {
    obterPlaylist();
}

function obterPlaylist() {
    fetch(`http://localhost:8080/playlists${codigo}`)
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

        colunaCodigo.innerText = musicas[i].codigo; 
        colunaNome.innerText = musicas[i].nome;
        //colunaArtista.innerText = musicas[i].codigo_artista;
        colunaLink.innerText = musicas[i].link;
    }
}