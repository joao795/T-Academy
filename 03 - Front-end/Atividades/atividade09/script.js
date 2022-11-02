function calcularTabuada() {
    let num = document.getElementById('num').value 
    let tabuada = document.getElementById('tabuada')

    tabuada.innerHTML = num * 1 + '<br>'
    + num * 2 + '<br>' + num * 3 + '<br>'
    + num * 4 + '<br>' + num * 5 + '<br>'
    + num * 6 + '<br>' + num * 7 + '<br>'
    + num * 8 + '<br>' + num * 9 + '<br>'
    + num * 10
}