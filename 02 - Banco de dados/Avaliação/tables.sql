create database avaliacao;

use avaliacao;

create table professores(
    codigo_professor int primary key auto_increment,
    nome_professor varchar(30),
    nascimento_professor date,
    idade_professor int,
    cidade_professor int,
    foreign key(cidade_professor) references cidades(codigo_cidade)
);

update professores set nome_professor = 'Ralph' where codigo_professor = 1;
drop table professores;

create table cidades(
	codigo_cidade int primary key auto_increment,
    nome_cidade varchar(20),
    estado_cidade int,
    foreign key(estado_cidade) references estados(codigo_estado)
);

update cidades set estado_cidade = 1 where nome_cidade = 'Blumenau';
drop table cidades;

create table estados(
	codigo_estado int primary key auto_increment,
    nome_estado varchar(2)
);

update estados set nome_estado = 'Santa Catarina' where codigo_estado = 1;
drop table estados;

create table materias(
	codigo_materia int primary key auto_increment,
    nome_materia varchar(50),
    valor_materia double
);

update materia set nome_materia = 'POO' where codigo_materia = 1;
drop table materias;

create table materias_professores(
	codigo_professor int,
    foreign key(codigo_professor) references professores(codigo_professor),
    codigo_materia int,
    foreign key(codigo_professor) references materias(codigo_materia)
);

update materias_professores set codigo_professor = 3 where codigo_materia = 7;
drop table materias_professores;

create table alunos(
	codigo_aluno int primary key auto_increment,
    nome_aluno varchar(30),
    nascimento_aluno date,
    idade_aluno int,
    cidade_aluno int,
    foreign key(cidade_aluno) references cidades(codigo_cidade),
    nota1_aluno double,
    nota2_aluno double,
    media_aluno double,
    situacao_aluno varchar(10)
);

update alunos set nome_aluno = 'Brenda' where codigo_aluno = 3;
drop table alunos;

create table turmas(
	codigo_turma int primary key auto_increment,
    nome_turma varchar(2)
);

update turmas set nome_turma = 'A1' where codigo_turma = 1;
drop table turmas;

create table turmas_alunos(
	codigo_turma int,
    foreign key(codigo_turma) references turmas(codigo_turma),
    codigo_aluno int,
    foreign key(codigo_aluno) references alunos(codigo_aluno)
);

update turmas_alunos set codigo_turma = 7 where codigo_aluno = 3;
drop table turmas_alunos;

create table professores_turmas(
	codigo_professor int,
    foreign key(codigo_professor) references professores(codigo_professor),
	codigo_turma int,
    foreign key(codigo_turma) references turmas(codigo_turma)
);

update professores_turmas set codigo_professor = 1 where codigo_turma = 10;
drop table professores_turmas