//artistas de artistas
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
    tabela.innerHTML="";

    for(let i = 0; i < playlists.length; i++){
        let linha = tabela.insertRow(-1);

        let colunaCodigo = linha.insertCell(0); 
        let colunaNome = linha.insertCell(1); 
        let colunaVerMais = linha.insertCell(2);

        colunaCodigo.innerText = playlists[i].codigo; 
        colunaNome.innerText = playlists[i].nome;
        colunaVerMais.innerHTML = `<button onclick="verMais(${artistas[i].codigo})" class="btn btn-primary">Ver mais</button>`; 

    }
}