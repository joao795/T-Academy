function pesquisar(termo) {
    for (let i = 0; i < 12; i++) {
        let idImg = 'img' + i
        let idNome = 'nome' + i  
        let idValor = 'valor' + i
        let idBotao = 'botao' + i

        let img = document.getElementById(idImg)
        let nome = document.getElementById(idNome)
        let valor = document.getElementById(idValor)
        let botao = document.getElementById(idBotao)

        img.innerHTML = ''
        nome.innerHTML = '' 
        valor.innerHTML = ''
        botao.innerHTML = ''
    }
    
    let cont = 0

    loop:
    for (let i = 0; i < 30; i++) {
        if (produtos[i].nome.toLowerCase().includes(termo.toLowerCase())) {
            let idImg = 'img' + cont
            let idNome = 'nome' + cont  
            let idValor = 'valor' + cont
            let idBotao = 'botao' + cont
        
            let img = document.getElementById(idImg)
            let nome = document.getElementById(idNome)
            let valor = document.getElementById(idValor)
            let botao = document.getElementById(idBotao)
            
            img.innerHTML = '<img src="' + produtos[i].img + '">'
            nome.innerHTML = produtos[i].nome 
            valor.innerHTML = 'R$' + produtos[i].valor + ',00'
            botao.innerHTML = 
            "<button class='btn btn-primary btn-sm' onclick='adicionarAoCarrinho(" + cont + ")'>Adicionar ao carrinho</button>"          

            cont++

            if (cont == 12) {
                break loop
            }
        }
        
    }   
}

function pesquisarInformatica(termo) {
    for (let i = 0; i < 10; i++) {
        let idImg = 'img' + i
        let idNome = 'nome' + i  
        let idValor = 'valor' + i
        let idBotao = 'botao' + i

        let img = document.getElementById(idImg)
        let nome = document.getElementById(idNome)
        let valor = document.getElementById(idValor)
        let botao = document.getElementById(idBotao)

        img.innerHTML = ''
        nome.innerHTML = '' 
        valor.innerHTML = '' 
        botao.innerHTML = ''
    }
    
    let cont = 0

    loop:
    for (let i = 0; i < 30; i++) {
        if (produtos[i].nome.toLowerCase().includes(termo.toLowerCase())
        && produtos[i].segmento == 'informática') {
            let idImg = 'img' + cont
            let idNome = 'nome' + cont  
            let idValor = 'valor' + cont
            let idBotao = 'botao' + cont
        
            let img = document.getElementById(idImg)
            let nome = document.getElementById(idNome)
            let valor = document.getElementById(idValor)
            let botao = document.getElementById(idBotao)
            
            img.innerHTML = '<img src="' + produtos[i].img + '">'
            nome.innerHTML = produtos[i].nome 
            valor.innerHTML = 'R$' + produtos[i].valor + ',00'
            botao.innerHTML = 
            "<button class='btn btn-primary btn-sm' onclick='adicionarAoCarrinho(" + cont + ")'>Adicionar ao carrinho</button>"          

            cont++

            if (cont == 12) {
                break loop
            }
        }
        
    }   
}

function pesquisarRoupas(termo) {
    for (let i = 0; i < 10; i++) {
        let idImg = 'img' + i
        let idNome = 'nome' + i  
        let idValor = 'valor' + i
        let idBotao = 'botao' + i

        let img = document.getElementById(idImg)
        let nome = document.getElementById(idNome)
        let valor = document.getElementById(idValor)
        let botao = document.getElementById(idBotao)

        img.innerHTML = ''
        nome.innerHTML = '' 
        valor.innerHTML = ''
        botao.innerHTML = ''
    }
    
    let cont = 0

    loop:
    for (let i = 0; i < 30; i++) {
        if (produtos[i].nome.toLowerCase().includes(termo.toLowerCase())
        && produtos[i].segmento == 'roupas') {
            let idImg = 'img' + cont
            let idNome = 'nome' + cont  
            let idValor = 'valor' + cont
            let idBotao = 'botao' + cont
        
            let img = document.getElementById(idImg)
            let nome = document.getElementById(idNome)
            let valor = document.getElementById(idValor)
            let botao = document.getElementById(idBotao)
            
            img.innerHTML = '<img src="' + produtos[i].img + '">'
            nome.innerHTML = produtos[i].nome 
            valor.innerHTML = 'R$' + produtos[i].valor + ',00' 
            botao.innerHTML = 
            "<button class='btn btn-primary btn-sm' onclick='adicionarAoCarrinho(" + cont + ")'>Adicionar ao carrinho</button>"          

            cont++

            if (cont == 12) {
                break loop
            }
        }
        
    }   
}

function pesquisarBebidas(termo) {
    for (let i = 0; i < 10; i++) {
        let idImg = 'img' + i
        let idNome = 'nome' + i  
        let idValor = 'valor' + i
        let idBotao = 'botao' + i

        let img = document.getElementById(idImg)
        let nome = document.getElementById(idNome)
        let valor = document.getElementById(idValor)
        let botao = document.getElementById(idBotao)

        img.innerHTML = ''
        nome.innerHTML = '' 
        valor.innerHTML = ''    
        botao.innerHTML = ''  
    }

    let cont = 0

    loop:
    for (let i = 0; i < 30; i++) {
        if (produtos[i].nome.toLowerCase().includes(termo.toLowerCase())
        && produtos[i].segmento == 'bebidas') {
            let idImg = 'img' + cont
            let idNome = 'nome' + cont  
            let idValor = 'valor' + cont
            let idBotao = 'botao' + cont
        
            let img = document.getElementById(idImg)
            let nome = document.getElementById(idNome)
            let valor = document.getElementById(idValor)
            let botao = document.getElementById(idBotao)
            
            img.innerHTML = '<img src="' + produtos[i].img + '">'
            nome.innerHTML = produtos[i].nome 
            valor.innerHTML = 'R$' + produtos[i].valor + ',00' 
            botao.innerHTML = 
            "<button class='btn btn-primary btn-sm' onclick='adicionarAoCarrinho(" + cont + ")'>Adicionar ao carrinho</button>"          

            cont++

            if (cont == 12) {
                break loop
            }
        }
        
    }   
}