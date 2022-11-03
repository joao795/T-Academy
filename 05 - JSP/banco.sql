create database banco;

use banco;

create table postagem(
	codigo int primary key auto_increment,
    titulo varchar(20),
    conteudo varchar(255)
);

drop table postagem;

create table comentario(
	codigo int primary key auto_increment,
    nome varchar(20),
    conteudo varchar(255),
    postagem int,
    foreign key (postagem) references postagem(codigo)
);

create table comentario_aprovado(
    codigo int primary key auto_increment,
    nome varchar(20),
    conteudo varchar(255),
    postagem int,
    foreign key (postagem) references postagem(codigo) 
);

drop table comentario;

create table usuario(
    codigo int primary key auto_increment,
    nome varchar(20),
    senha varchar(20)
);

drop table usuario;