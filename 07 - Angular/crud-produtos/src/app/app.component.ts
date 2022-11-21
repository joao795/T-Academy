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

  //função para exibir uma mensagem
  mensagem():void {
    alert('Hello, world!');
    
  }
}
