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
    senha varchar(20)
);

drop table usuario;

insert into postagem values(null, "aa", "bb");
insert into comentario values(null, "João", "bom", 1);

insert into comentario_aprovado values(
(select codigo from comentario where codigo = 1),
(select nome from comentario where nome = "João"),
(select conteudo from comentario where conteudo = "bom"),
(select postagem from comentario where postagem = 1)
);