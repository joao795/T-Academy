function acao() {
    let email = document.getElementById('email').value 
    let senha = document.getElementById('senha').value

    if (email == '') {
        alert('Favor informar um E-mail.')
    }
    else if (senha == '') {
        alert('Favor informar uma senha.')
    }
    else {
        document.getElementById('bemvindo').style.display = 'block'
    }
}