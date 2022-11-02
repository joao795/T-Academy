create database atividadeExtra02;

use atividadeExtra02;

create table alunos(
	codigo_aluno int primary key auto_increment,
    nome_aluno varchar(30) not null,
    nota1_aluno double not null,
    nota2_aluno double not null,
    media_aluno double,
    situacao_aluno varchar(15)
);

create trigger gerar_media
after insert on alunos
for each row
set new.media_aluno = (nota1_aluno + nota2_aluno) / 2;

create trigger gerar_situacao
after insert on alunos
for each row
set new.situacao_aluno = if (media_aluno > 7, 'Aprovado', 'Reprovado');

drop trigger gerar_media;
drop trigger gerar_situacao;
drop table alunos;

create table produtos(
	codigo_produto int primary key auto_increment,
    nome_produto varchar(30) not null,
    valor_produto double not null,
    valor_promocional double
);

create trigger cadastrar_valor_promocional
after insert on produtos
for each row
set new.valor_promocional = valor_produto * 0.9;

insert into produtos values(null, 'Laptop Acer', 4000);

drop trigger cadastrar_valor_promocional;
drop table produtos;

create table produtos(
	codigo_produto int primary key auto_increment,
    nome_produto varchar(30) not null,
    segmento_produto varchar(20)
);

create table qtd_segmentos(
	nome_segmento varchar(30),
    quantidade_segmento int
);

insert into qtd_segmentos values
('Informática', 0),
('Roupas', 0),
('Construção', 0);

insert into produtos values
(null, 'Laptop Acer', 'Informática'),
(null, 'Moletom azul', 'Roupas'),
(null, 'Prédio', 'Construção');

create trigger cadastrar_produto
after insert on produtos
for each row
set new.qtd_segmentos.nome_segmento = produtos.segmento_produto
set new.






