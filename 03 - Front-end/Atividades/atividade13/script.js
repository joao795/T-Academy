let dados = []
let qtdHomens = 0
let qtdMulheres = 0
let qtdAprovados = 0
let qtdReprovados = 0

let qtdTotal = 0

function cadastrar() {
    let nome = document.getElementById('nome').value
    let nota1 = parseFloat(document.getElementById('nota1').value)
    let nota2 = parseFloat(document.getElementById('nota2').value)
    let genero = document.getElementById('genero').value 

    let media = (nota1 + nota2) / 2

    if (nome == '') {
        alert('Favor infomrar um nome.')
    }
    else if (nota1 == '' || nota2 == '') {
        alert('Favor informar duas notas.')
    }
    else {
        qtdTotal++

        if (genero == 'masculino') {
            qtdHomens++
        }   
        else {
            qtdMulheres++
        }

        if (media >= 7) {
            qtdAprovados++
        }
        else {
            qtdReprovados++
        }

        let obj = {
            'nome': nome,
            'nota1': nota1,
            'nota2': nota2,
            'media': media,
            'genero': genero
        }

        dados.push(obj)
        selecionarGenero()
        selecionarSituacao()
        selecionarMelhorAluno(obj)
    }   
}

function selecionarGenero() {
    let porcentagemHomens = (qtdHomens / qtdTotal) * 100
    let porcentagemMulheres = (qtdMulheres / qtdTotal) * 100

    document.getElementById('qtdHomens').innerText = qtdHomens
    document.getElementById('qtdMulheres').innerText = qtdMulheres 

    document.getElementById('porcentagemHomens').innerText = porcentagemHomens
    document.getElementById('porcentagemMulheres').innerText = porcentagemMulheres
}

function selecionarSituacao() {
    let porcentagemAprovados = (qtdAprovados / qtdTotal) * 100
    let porcentagemReprovados = (qtdReprovados / qtdTotal) * 100

    document.getElementById('qtdAprovados').innerText = qtdAprovados
    document.getElementById('qtdReprovados').innerText = qtdReprovados

    document.getElementById('porcentagemAprovados').innerText = porcentagemAprovados
    document.getElementById('porcentagemReprovados').innerText = porcentagemReprovados
}

function selecionarMelhorAluno(obj) {
    let maiorMedia = 0
    let melhorAluno

    if (obj.media > maiorMedia) {
        maiorMedia = obj.media 
        melhorAluno = obj 
    }

    document.getElementById('nomeMelhorAluno').innerText = melhorAluno.nome
    document.getElementById('mediaMelhorAluno').innerText = melhorAluno.media
}