function exibirDescricao() {
    let cidade = document.getElementById('menu')
    let descricao = document.getElementById('descricao')

    switch(cidade.value) {
        case 'blumenau':
            descricao.innerText = 'Blumenau é um município do estado de Santa Catarina, Região Sul do Brasil. Localiza-se na microrregião homônima e na Mesorregião do Vale do Itajaí.'
        break;
        case 'gaspar':
            descricao.innerText = 'Gaspar é um município brasileiro do estado de Santa Catarina, região Sul. Localiza-se na região do Vale do Itajaí, entre Blumenau e Itajaí.'
        break;
        case 'pomerode':
            descricao.innerText = 'Pomerode é um município do estado de Santa Catarina, no Brasil. Localizado na Mesorregião do Vale do Itajaí e na Microrregião de Blumenau, é conhecido por ser "A cidade mais alemã do Brasil".'
        break;
        case 'timbo':
            descricao.innerText = 'Timbó é um município brasileiro do estado de Santa Catarina. Localiza-se a 26°4924 de latitude sul e 49°1618 de longitude oeste, a uma altitude de 68 metros.'
        break;
        case 'itajai':
            descricao.innerText = 'Itajaí é um município brasileiro localizado no estado de Santa Catarina, na Região Sul do Brasil, distante 94 km da capital catarinense, Florianópolis.'
        break;
        case 'jaragua':
            descricao.innerText = 'Jaraguá do Sul é um município brasileiro do estado de Santa Catarina. Localiza-se a uma latitude 26º2909 sul e a uma longitude 49º0401 oeste, estando a uma altitude de 30 metros.'
        break;
        case 'ilhota':
            descricao.innerText = 'Pelos últimos censos, Ilhota teve pouco acréscimo na população, pois muitos habitantes acabaram se mudando para cidades próximas, como Blumenau e Gaspar, por serem maiores e por oferecerem mais oportunidades de emprego.'
        break;
        default:
            descricao.innerText = ''
        break;
    }
}