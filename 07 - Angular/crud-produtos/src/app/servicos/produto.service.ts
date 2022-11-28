import { Injectable } from '@angular/core';

import { HttpClient } from '@angular/common/http';
import { Produto } from '../modelo/Produto';

@Injectable({
  providedIn: 'root'
})
export class ProdutoService {

  // Construtor
  constructor(private http:HttpClient) { }

  // Selecionar todos os produtos da API
  selecionar(){
    return this.http.get<Produto[]>('https://bu.furb.br/mcardoso/progWeb/apiRestAval.php/cadastro');
  }

  // Remover produto através do ID
  remover(id:number){
    return this.http.delete('https://bu.furb.br/mcardoso/progWeb/apiRestAval.php/cadastro/'+id);
  }

  // Cadastrar um produto
  alterar(id:number, p:Produto){
    return this.http.put<Produto>('https://bu.furb.br/mcardoso/progWeb/apiRestAval.php/cadastro/' + id, p);
  }

}
