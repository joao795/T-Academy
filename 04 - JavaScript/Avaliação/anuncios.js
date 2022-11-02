function gerarAnunciosIndex() {
    let numeros = []

    for (let i = 0; i < 12; i++) {
        let idImg = 'img' + i
        let idNome = 'nome' + i 
        let idValor = 'valor' + i 
        //let idEstoque = 'estoque' + i
    
        let img = document.getElementById(idImg)
        let nome = document.getElementById(idNome)
        let valor = document.getElementById(idValor)
        //let estoque = document.getElementById(idEstoque)
    
        let cdProduto = Math.floor((Math.random() * 30))
        while (numeros.includes(cdProduto)) {
            cdProduto = Math.floor((Math.random() * 30))
        }
        
        img.innerHTML = '<img src="' + produtos[cdProduto].img + '">'
        nome.innerHTML = produtos[cdProduto].nome 
        valor.innerHTML = 'R$' + produtos[cdProduto].valor + ',00'
        //estoque.innerHTML = produtos[cdProduto].estoque + ' em estoque' 
    
        numeros.push(cdProduto)
    }
}

function gerarAnunciosInformatica() {
    let numeros = []

    for (let i = 0; i < 10; i++) {
        let idImg = 'img' + i
        let idNome = 'nome' + i 
        let idValor = 'valor' + i 
        //let idEstoque = 'estoque' + i

        let img = document.getElementById(idImg)
        let nome = document.getElementById(idNome)
        let valor = document.getElementById(idValor)
        //let estoque = document.getElementById(idEstoque)

        let cdProduto = Math.floor((Math.random() * 30))
        while (produtos[cdProduto].segmento != 'informática' 
        || numeros.includes(cdProduto)) {
            cdProduto = Math.floor((Math.random() * 30))
        } 
               
        img.innerHTML = '<img src="' + produtos[cdProduto].img + '">'
        nome.innerHTML = produtos[cdProduto].nome 
        valor.innerHTML = 'R$' + produtos[cdProduto].valor + ',00'
        //estoque.innerHTML = produtos[cdProduto].estoque + ' em estoque' 

        numeros.push(cdProduto)
      
    }
}

function gerarAnunciosBebidas() {
    let numeros = []

    for (let i = 0; i < 10; i++) {
        let idImg = 'img' + i
        let idNome = 'nome' + i 
        let idValor = 'valor' + i 
        //let idEstoque = 'estoque' + i

        let img = document.getElementById(idImg)
        let nome = document.getElementById(idNome)
        let valor = document.getElementById(idValor)
        //let estoque = document.getElementById(idEstoque)

        let cdProduto = Math.floor((Math.random() * 30))
        while (produtos[cdProduto].segmento != 'bebidas' 
        || numeros.includes(cdProduto)) {
            cdProduto = Math.floor((Math.random() * 30))
        } 
               
        img.innerHTML = '<img src="' + produtos[cdProduto].img + '">'
        nome.innerHTML = produtos[cdProduto].nome 
        valor.innerHTML = 'R$' + produtos[cdProduto].valor + ',00'
        //estoque.innerHTML = produtos[cdProduto].estoque + ' em estoque' 

        numeros.push(cdProduto)
      
    }
}

function gerarAnunciosRoupas() {
    let numeros = []

    for (let i = 0; i < 10; i++) {
        let idImg = 'img' + i
        let idNome = 'nome' + i 
        let idValor = 'valor' + i 
        //let idEstoque = 'estoque' + i

        let img = document.getElementById(idImg)
        let nome = document.getElementById(idNome)
        let valor = document.getElementById(idValor)
        //let estoque = document.getElementById(idEstoque)

        let cdProduto = Math.floor((Math.random() * 30))
        while (produtos[cdProduto].segmento != 'roupas' 
        || numeros.includes(cdProduto)) {
            cdProduto = Math.floor((Math.random() * 30))
        } 
               
        img.innerHTML = '<img src="' + produtos[cdProduto].img + '">'
        nome.innerHTML = produtos[cdProduto].nome 
        valor.innerHTML = 'R$' + produtos[cdProduto].valor + ',00'
        //estoque.innerHTML = produtos[cdProduto].estoque + ' em estoque' 

        numeros.push(cdProduto)
      
    }
}