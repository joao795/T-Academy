create database atividadeExtra;

use atividadeExtra;

create table marcas(
	codigo_marca int primary key auto_increment,
    nome_marca varchar(30)
);

create table produtos(
	codigo_produto int primary key auto_increment,
    nome_produto varchar(30),
	codigo_marca int,
    foreign key(codigo_marca) references marcas(codigo_marca)
);

# --------------Primeiro item--------------------------------------------------

create view view_01 as
select
	p.nome_produto,
    m.nome_marca
from produtos p 
inner join marcas m
on p.codigo_marca = m.codigo_marca;

create view view_02 as
select *
from produtos 
inner join marcas;

# ----------------------------------------------------------------------------

create table professores(
	codigo_professor int primary key auto_increment,
    nome_professor varchar(20)
);

create table alunos(
	codigo_aluno int primary key auto_increment,
    nome_aluno varchar(30),
    nome_turma varchar(10)
);

create table alunos_professores(
    codigo_aluno int,
    foreign key(codigo_aluno) references alunos(codigo_aluno),
    codigo_professor int,
    foreign key(codigo_professor) references professores(codigo_professor)
);

# --------------Segundo item--------------------------------------------------

create view view_03 as
select 
	a.nome_aluno,
    p.nome_professor
from alunos_professores ap 
join alunos a
on ap.codigo_aluno = a.codigo_aluno
join professores p 
on ap.codigo_professor = p.codigo_professor;

create view view_04 as
select *
from alunos_professores
join alunos
join professores;

create view view_05 as
select 
	a.nome_aluno
from alunos_professores pa 
join alunos a
on pa.codigo_aluno = a.codigo_aluno
join professores p 
on pa.codigo_professor = p.codigo_professor
where a.nome_aluno like '%a%';

# ----------------------------------------------------------------------------

drop table alunos_professores;

create table cursos(
	codigo_curso int primary key auto_increment,
    nome_curso varchar(20),
    valor_curso double
);

create table materias(
	codigo_materia int primary key auto_increment,
    nome_materia varchar(20)
);

create table cursos_materias(
    codigo_curso int,
    foreign key(codigo_curso) references cursos(codigo_curso),
	codigo_materia int,
    foreign key(codigo_materia) references materias(codigo_materia)
);

# --------------Terceiro item--------------------------------------------------

create view view_06 as
select 
	a.nome_aluno,
    p.nome_professor,
    c.nome_curso,
    m.nome_materia
from cursos_materias cm 
join cursos c
on cm.codigo_curso = c.codigo_curso
join alunos a
join professores p 
join materias m;

create view view_07 as
select 
	*
from cursos_materias cm 
join cursos c
on cm.codigo_curso = c.codigo_curso
join alunos
join professores 
join materias;

# ----------------------------------------------------------------------------

drop table cursos_materias;

create table turmas(
	codigo_turma int primary key auto_increment,
    nome_turma varchar(2)
);

create table turnos(
	codigo_turno int primary key auto_increment,
    nome_turno varchar(20)
);

create table turmas_turnos(
	codigo_turma int,
    foreign key(codigo_turma) references turmas(codigo_turma),
    codigo_turno int,
    foreign key(codigo_turno) references turnos(codigo_turno)
);

# --------------Quarto item--------------------------------------------------

create view view_08 as
select 
	*
from turmas_turnos tt
join turma ta
on tt.codigo_turma = ta.codigo_turma
join turno tu
on tt.codigo_turno = tu.codigo_turno
join cursos 
join alunos 
join professores 
join materias;

create view view_09 as
select 
	a.nome_aluno,
    p.nome_professor,
    ta.nome_turma,
    tu.nome_turma,
    c.nome_curso,
    m.nome_materia
from turmas_turnos tt
join turma ta
on tt.codigo_turma = ta.codigo_turma
join turno tu
on tt.codigo_turno = tu.codigo_turno
join cursos c
join alunos a
join professores p
join materias m;

create view view_10 as
select 
	a.nome_aluno,
    p.nome_professor,
    ta.nome_turma,
    tu.nome_turma,
    c.nome_curso,
    m.nome_materia
from turmas_turnos tt
join turma ta
on tt.codigo_turma = ta.codigo_turma
join turno tu
on tt.codigo_turno = tu.codigo_turno
join cursos c
where a.nome_aluno like '%a'
and p.nome_professor like '%o%';
join alunos a
join professores p
join materias m;