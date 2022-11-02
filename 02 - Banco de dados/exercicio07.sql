create database exercicio07;

use exercicio07;

create table professores(
	codigo_professor int primary key auto_increment,
    nome_professor varchar(20)
);

create table cursos(
	codigo_curso int primary key auto_increment,
    nome_curso varchar(20),
    valor_curso double,
    codigo_professor int,
    foreign key(codigo_professor) references professores(codigo_professor)
);

create table alunos(
	codigo_aluno int primary key auto_increment,
    nome_aluno varchar(20),
    nascimento_aluno date,
    estado_aluno varchar(20),
    cidade_aluno varchar(40)
);

create table alunos_cursos(
	codigo_aluno int,
    foreign key(codigo_aluno) references alunos(codigo_aluno),
    codigo_curso int,
    foreign key(codigo_curso) references cursos(codigo_curso),
	status_curso varchar(20)
);

insert into professores values
(null, 'Larissa'),
(null, 'Daniel'),
(null, 'Gustavo');

insert into cursos values 
(null, 'Java', 1000, 1),
(null, 'C#', 1140, 1),
(null, 'Python', 900, 2),
(null, 'JavaScript', 900, 2),
(null, 'PHP', 950, 3);

insert into alunos values
(null, 'Aline', '1997-03-01', 'SC', 'Blumenau'),
(null, 'Mariana', '1993-08-28', 'SC', 'Joinville'),
(null, 'Gustavo', '2000-11-14', 'SP', 'Campinas'),
(null, 'Bianca', '1999-01-07', 'SC', 'Blumenau'),
(null, 'Ricardo', '2002-07-30', 'PR', 'Curitiba');

insert into alunos_cursos values
(1, 5, 'Concluído'),
(2, 4, 'Em andamento'),
(3, 3, 'Não iniciado'),
(4, 2, 'Em andamento'),
(5, 1, 'Concluído');

select a.nome_aluno, count(c.codigo_curso)
from alunos_cursos ac
join cursos c
on ac.codigo_curso = c.codigo_curso
join alunos a
on ac.codigo_aluno = a.codigo_aluno
group by a.nome_aluno;

select ac.status_curso, count(c.codigo_curso)
from alunos_cursos ac
join cursos c 
on ac.codigo_curso = c.codigo_curso
group by ac.status_curso;

select a.nome_aluno, c.nome_curso
from alunos_cursos ac
join alunos a
on ac.codigo_aluno = a.codigo_aluno
join cursos c
on ac.codigo_curso = c.codigo_curso
where ac.status_curso = 'Concluído'
and c.valor_curso >= 1000;

select count(nome_aluno), estado_aluno from alunos group by estado_aluno;

select a.nome_aluno, c.nome_curso
from alunos_cursos ac
join alunos a
on ac.codigo_aluno = a.codigo_aluno
join cursos c
on ac.codigo_curso = c.codigo_curso
where ac.status_curso = 'Não iniciado';

select c.nome_curso, c.valor_curso, count(a.codigo_aluno)
from alunos_cursos ac
join alunos a
on ac.codigo_aluno = a.codigo_aluno
join cursos c
on ac.codigo_curso = c.codigo_curso
where c.valor_curso =
(select max(valor_curso) from cursos);

select p.nome_professor, count(c.codigo_curso)
from cursos c
join professores p
on c.codigo_professor = p.codigo_professor
group by p.nome_professor;

select p.nome_professor, count(a.codigo_aluno)
from alunos_cursos ac
join alunos a
on ac.codigo_aluno = a.codigo_aluno
join cursos c
on ac.codigo_curso = c.codigo_curso
join professores p
on c.codigo_professor = p.codigo_professor
group by p.nome_professor;

select a.nome_aluno, c.nome_curso, c.valor_curso, p.nome_professor
from alunos_cursos ac
join alunos a
on  ac.codigo_aluno = a.codigo_aluno
join cursos c 
on ac.codigo_curso = c.codigo_curso
join professores p
on c.codigo_professor = p.codigo_professor;

select avg(valor_curso) from cursos;

select c.nome_curso, c.valor_curso, count(a.codigo_aluno)
from alunos_cursos ac
join cursos c 
on ac.codigo_curso = c.codigo_curso
join alunos a
on  ac.codigo_aluno = a.codigo_aluno
where c.valor_curso >=
(select avg(valor_curso) from cursos)
group by c.nome_curso;

select a.nome_aluno, count(c.codigo_curso)
from alunos_cursos ac 
join alunos a
on ac.codigo_aluno = a.codigo_aluno
join cursos c
on ac.codigo_curso = c.codigo_curso
where date_format(now(), '%Y') - date_format(nascimento_aluno, '%Y') >= 18;

delete from alunos where date_format(nascimento_aluno, '%Y') > 30;

drop table alunos_cursos;
drop table alunos;
drop table cursos;
drop table professores;