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
    foreign key (postagem) references postagem(codigo),
    aprovado int
);

drop table comentario;

create table usuario(
    codigo int primary key auto_increment,
    nome varchar(20),
    senha varchar(20),
    banido int,
    administrador int
);

insert into usuario values(null, "joao", "123", 0, 1);
insert into usuario values(null, "brena", "123", 0, 0);
insert into usuario values(null, "matheus", "123", 0, 0);

select * from usuario;
drop table usuario;