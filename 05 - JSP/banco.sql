create database banco;

use banco;

create table postagem(
	codigo int primary key auto_increment,
    titulo varchar(20),
    conteudo varchar(255)
);

create table comentario(
	codigo int primary key auto_increment,
    nome varchar(20),
    conteudo varchar(255),
    postagem int,
    foreign key (postagem) references postagem(codigo),
    aprovado int
);

create table usuario(
    codigo int primary key auto_increment,
    nome varchar(20),
    email varchar(20),
    senha varchar(20),
    banido int,
    administrador int
);

insert into usuario values(null, "joao", "joao@gmail.com", "123", 0, 1);
insert into usuario values(null, "brena", "brena@gmail.com", "123", 0, 0);
insert into usuario values(null, "matheus", "matheus@gmail.com", "123", 0, 0);

insert into postagem values(null, "primeira postagem", "conteudo da primeira postagem");
insert into postagem values(null, "segunda postagem", "conteudo da segunda postagem");
insert into postagem values(null, "terceira postagem", "conteudo da terceira postagem");
insert into postagem values(null, "quarta postagem", "conteudo da quarta postagem");
insert into postagem values(null, "quinta postagem", "conteudo da quinta postagem");
insert into postagem values(null, "sexta postagem", "conteudo da sexta postagem");
insert into postagem values(null, "sétima postagem", "conteudo da sétima postagem");
insert into postagem values(null, "oitava postagem", "conteudo da oitava postagem");
insert into postagem values(null, "nona postagem", "conteudo da nona postagem");
insert into postagem values(null, "décima postagem", "conteudo da décima postagem");
insert into postagem values(null, "uma postagem", "conteudo de uma postagem");