import { Component } from '@angular/core';
import { FormControl, FormGroup } from '@angular/forms';
import { Produto } from '../modelo/Produto';

@Component({
  selector: 'app-produto',
  templateUrl: './produto.component.html',
  styleUrls: ['./produto.component.css']
})
export class ProdutoComponent {
  //vetor de produtos
  vetor:Produto[] = [];

  //objeto do tipo produto
  //p = new Produto;

  //formulário
  formulario = new FormGroup({
    nome: new FormControl(),
    valor: new FormControl()
  });

  //função para retornar os valores contidos no formulário
  testarFormulario():void {
    console.log(this.formulario.value);
  }

  //cadastrar um produto
  cadastrar():void {
    //objeto do tipo produto
    let p = new Produto();

    //passr os dados do formulário para o objeto p
    p.nome = this.formulario.value.nome;
    p.valor = this.formulario.value.valor;

    //cadastrar o produto no vetor
    this.vetor.push(p);

    //limpar campos de formulário
    this.formulario.reset();

    //console
    console.log(this.vetor);

  }

}
