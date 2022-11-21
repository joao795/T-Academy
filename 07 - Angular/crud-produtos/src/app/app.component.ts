import { Component } from '@angular/core';
import { RouterOutlet } from '@angular/router';

@Component({
  selector: 'app-root',
  templateUrl: './app.component.html',
  styleUrls: ['./app.component.css']
})
export class AppComponent {
  //criar variáveis
  texto:string = 'Hello, Angular!';
  exibir:boolean = true;
  nomes:string[] = ['João', 'Eula', 'Matheus', 'Brena', 'Sophia'];
  clientes:any[] = [
    {'nome': 'João', 'idade': 22},
    {'nome': 'Eula', 'idade': 23},
    {'nome': 'Matheus', 'idade': 20},
    {'nome': 'Brena', 'idade': 21},
    {'nome': 'Sophia', 'idade': 22}
  ];

  //função para exibir uma mensagem
  mensagem():void {
    alert('Hello, world!');
    
  }

  //função pra exibir ou ocultar o quadrado
  exibirOcultar():void {
    this.exibir = !this.exibir;
  }

}
