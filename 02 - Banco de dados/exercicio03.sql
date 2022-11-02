create database exercicio03;

use exercicio03;

create table alunos(
	nome varchar(40),
    turma varchar(10),
    nota01 int,
    nota02 int,
    nota03 int,
    turno varchar(10)
);

insert into alunos values
('Ana Paula', '7A', 5, 8, 7, 'Vespertino'),
('Caio Neves', '8B', 3, 4, 2, 'Matutino'),
('Isabella Fontana', '7C', 9, 8.5, 9, 'Vespertino'),
('Daniel Luz', '8A', 2, 5, 4, 'Vespertino'),
('Gabriel Braga', '8A', 2, 5, 4, 'Vespertino'),
('Ellen Souza', '7A', 5, 8, 7, 'Matutino'),
('Luciana Biltz', '8B', 9.5, 10, 10, 'Vespertino'),
('Paulo Almeida', '8A', 10, 10, 10, 'Matutino'),
('Carla Malta', '7B', 3, 7, 9, 'Matutino'),
('Diogo Andrade', '8C', 10, 9, 10, 'Vespertino'),
('Mônica Mota', '8A', 7, 7, 8, 'Vespertino'),
('Juliana Lima', '8C', 9, 8, 3, 'Vespertino'),
('Marcelo Matos', '7A', 9, 10, 5, 'Matutino');

select nome, ((nota01 + nota02 + nota03) / 3), 
if (((nota01 + nota02 + nota03) / 3) >= 7, 'aprovado', 'reprovado')
from alunos;

select turno, count(*) from alunos group by turno;

select turma, count(*) from alunos group by turma;

select nome, ((nota01 + nota02 + nota03) / 3) from alunos
where ((nota01 + nota02 + nota03) / 3) >= 7;

select count(*) from alunos
where turno = 'vespertino' 
and ((nota01 + nota02 + nota03) / 3) < 7;

select nome from alunos
where ((nota01 + nota02 + nota03) / 3) = 
(select max(((nota01 + nota02 + nota03) / 3)) from alunos);

select turma, ((nota01 + nota02 + nota03) / 3) from alunos group by turma;

update alunos set turma = '8A' where turma = '8B';

drop table alunos;