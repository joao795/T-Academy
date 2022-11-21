import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Produto } from '../modelo/Produto';

@Injectable({
  providedIn: 'root'
})
export class ProdutoService {

  //construtor
  constructor(private http:HttpClient) { }

  //selecionar todos os produtos da API
  selecionar() {
    return this.http.get<Produto[]>('http://localhost:3000/produtos');
  }

}
