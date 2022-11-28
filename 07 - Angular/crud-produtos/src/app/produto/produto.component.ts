import { Component, Input } from '@angular/core';
import { FormControl, FormGroup } from '@angular/forms';
import { Produto } from '../modelo/Produto';
import { ProdutoService } from '../servicos/produto.service';

@Component({
  selector: 'app-produto',
  templateUrl: './produto.component.html',
  styleUrls: ['./produto.component.css']
})
export class ProdutoComponent {
  //construtor
  constructor(private servico:ProdutoService) { }

  //vetor de produtos
  vetor:Produto[] = [];

  //objeto do tipo produto
  //p = new Produto;

  //formulário
  formulario = new FormGroup({
    id: new FormControl(),
    nome: new FormControl(),
    departamento: new FormControl(),
    endereco: new FormControl(),
    email: new FormControl()
  });

  //inicialização (executa após carregar todo o componente)
  ngOnInit() {
    this.selecionar();
  }

  //função para retornar os valores contidos no formulário
  testarFormulario():void {
    console.log(this.formulario.value);
  }

  //cadastrar um produto
  alterar():void {
    //objeto do tipo produto
    let p = new Produto();

    //passar os dados do formulário para o objeto p
    p.id = this.formulario.value.id;
    p.nome = this.formulario.value.nome;
    p.departamento = this.formulario.value.departamento;
    p.endereco = this.formulario.value.endereco;
    p.email = this.formulario.value.email;

    console.log(p);

    //executar o ser(vi?)ço
    this.servico.alterar(p.id, p)
    .subscribe(retorno => {
      this.formulario.reset();
    })

    //console
    //console.log(this.vetor);

  }

  //remover um produto
  remover(id:number):void {

    alert('Você quer mesmo excluir esse funcionário? (●´⌓`●)');

    //remover produto no back-end
    this.servico.remover(id)
    .subscribe(() => {
      //posicao do vetor em que está determinado ID
      let pesquisaId = this.vetor.findIndex(obj => {return obj.id === id});

      //remover produto do vetor
      this.vetor.splice(pesquisaId, 1);

    });

  }

  //obter todos os produtos que estão na API
  selecionar():void {
    this.servico.selecionar()
    .subscribe({
      next: retorno => this.vetor = retorno
      //error: () => alert('Falha ao listar')
    });
  }

  // selecionarFuncionario(id:number):void {
  //   const nome = <HTMLInputElement>document.getElementById("nome");

  //   let obj = {
  //     'id': 0,
  //     'nome': 'João',
  //     'departamento': 'R&D',
  //     'endereco': 'R. Conrado Balsini, 77',
  //     'email': 'jsouza8816@gmail.com'
  //   }

  //   for (let i = 0; i < this.vetor.length; i++) {
  //     if (this.vetor[i].id === id) {
  //       obj = this.vetor[i];
  //     }
  //   }

    
    

  // }

}
