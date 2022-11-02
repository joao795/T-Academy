function retornarSigno() {
    var data = new Date(document.getElementById('nasc').value)
    let signo = document.getElementById('signo')
    
    switch(data.getMonth()) {
        case 0:
            if (data.getDay() <= 20) {
                signo.innerText = 'Capricórnio'
            }
            else {
                signo.innerText = 'Aquário'
            }
            
        break 
        case 1:
            if (data.getDay() <= 19) {
                signo.innerText = 'Aquário'
            }
            else {
                signo.innerText = 'Peixes'
            }
            
        break 
        case 2:
            if (data.getDay() <= 20) {
                signo.innerText = 'Peixes'
            }
            else {
                signo.innerText = 'Áries'
            }           
        break 
        case 3:
            if (data.getDay() <= 20) {
                signo.innerText = 'Áries'
            }
            else {
                signo.innerText = 'Touro'
            }
            
        break 
        case 4:
            if (data.getDay() <= 21) {
                signo.innerText = 'Touro'
            }
            else {
                signo.innerText = 'Gêmeos'
            }
            
        break
        case 5:
            if (data.getDay() <= 21) {
                signo.innerText = 'Touro'
            }
            else {
                signo.innerText = 'Gêmeos'
            }
        break 
        case 6:
            if (data.getDay() <= 21) {
                signo.innerText = 'Gêmeos'
            }
            else {
                signo.innerText = 'Câncer'
            }
        break 
        case 7:
            if (data.getDay() <= 22) {
                signo.innerText = 'Câncer'
            }
            else {
                signo.innerText = 'Leão'
            }
        break
        case 8:
            if (data.getDay() <= 23) {
                signo.innerText = 'Leão'
            }
            else {
                signo.innerText = 'Virgem'
            }
        break 
        case 9:
            if (data.getDay() <= 23) {
                signo.innerText = 'Virgem'
            }
            else {
                signo.innerText = 'Libra'
            }
        break 
        case 10:
            if (data.getDay() <= 22) {
                signo.innerText = 'Libra'
            }
            else {
                signo.innerText = 'Escorpião'
            }
        break
        case 11:
            if (data.getDay() <= 22) {
                signo.innerText = 'Escorpião'
            }
            else {
                signo.innerText = 'Sagitário'
            }
        break
    }  
}