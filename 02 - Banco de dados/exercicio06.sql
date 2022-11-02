create database exercicio06;

use exercicio06;

create table professor(
	cd_professor int primary key auto_increment,
    nm_professor varchar(20)
);

create table materia(
	cd_materia int primary key auto_increment,
    cd_professor int,
    foreign key(cd_professor) references professor(cd_professor),
    nm_materia varchar(20)
);

create table turma(
	cd_turma int primary key auto_increment,
    nm_turma varchar(2),
    turno_turma varchar(10)
);

create table aluno(
	cd_aluno int primary key auto_increment,
    nm_aluno varchar(30)
);

create table aluno_turma(
	cd_aluno int,
    foreign key(cd_aluno) references aluno(cd_aluno),
    cd_materia int,
    foreign key(cd_materia) references materia(cd_materia),
    cd_turma int,
    foreign key(cd_turma) references turma(cd_turma)
);

insert into professor values
(null, 'Renato'),
(null, 'Oscar'),
(null, 'Cátia');

insert into materia values
(null, 1, 'Matemática'),
(null, 2, 'Geografia'),
(null, 3, 'Português');

insert into turma values
(null, '6A', 'Matutino'),
(null, '6B', 'Vespertino'),
(null, '7A', 'Matutino');

insert into aluno values
(null, 'Alessandra'),
(null, 'Emanuela'),
(null, 'Cíntia');

insert into aluno_turma values
(1, 1, 1),
(2, 2, 2),
(3, 3, 3);

select a.nm_aluno, m.nm_materia, t.nm_turma
from aluno a inner join materia m 
inner join turma t inner join aluno_turma alt
on alt.cd_aluno = a.cd_aluno
and alt.cd_materia = m.cd_materia
and alt.cd_turma = t.cd_turma;

select p.nm_professor, m.nm_materia
from professor p inner join materia m
on m.cd_professor = p.cd_professor;

select t.nm_turma, count(a.cd_aluno)
from turma t inner join aluno a inner join aluno_turma alt
on alt.cd_aluno = a.cd_aluno
and alt.cd_turma = t.cd_turma
group by t.cd_turma;

select t.turno_turma, count(a.cd_aluno)
from turma t inner join aluno a inner join aluno_turma alt
on alt.cd_aluno = a.cd_aluno
and alt.cd_turma = t.cd_turma
group by t.turno_turma;

select a.nm_aluno, t.nm_turma, m.nm_materia
from aluno a inner join aluno_turma alt
inner join materia m inner join professor p
inner join turma t 
on alt.cd_materia = m.cd_materia
and alt.cd_turma = t.cd_turma
and alt.cd_aluno = a.cd_aluno
and m.cd_professor = p.cd_professor
where p.nm_professor = 'Renato';

select p.nm_professor
from professor p inner join materia m
inner join aluno_turma alt
on alt.cd_materia = m.cd_materia
and m.cd_professor = p.cd_professor
where m.nm_materia = 'Português';

select a.nm_aluno
from aluno a inner join aluno_turma alt
inner join materia m
on m.cd_materia = alt.cd_materia
and alt.cd_aluno = a.cd_aluno
where m.nm_materia = 'Geografia';

insert into professor values 
(null, 'João');

insert into materia values
(null, 4, 'Inglês'),
(null, 4, 'Português');

select p.nm_professor 
from professor p inner join materia m
inner join aluno_turma alt
on alt.cd_materia = m.cd_materia
and m.cd_professor = p.cd_professor
where m.nm_materia like 'Português'
or m.nm_materia like 'Inglês';

select m.nm_materia, count(a.cd_aluno)
from materia m join aluno a join aluno_turma alt
on alt.cd_aluno = a.cd_aluno
and alt.cd_materia = m.cd_materia
group by m.nm_materia;

select a.nm_aluno 
from aluno a join materia m
join professor p join aluno_turma alt
on alt.cd_materia = m.cd_materia
and alt.cd_aluno = a.cd_aluno
and m.cd_professor = p.cd_professor
where p.nm_professor = 'Cátia'
and m.nm_materia = 'Português';

select a.nm_aluno
from aluno_turma alt
join turma t
on alt.cd_turma = t.cd_turma
join materia m 
on alt.cd_materia = m.cd_materia
join professor p
on m.cd_professor = p.cd_professor
join aluno a
on alt.cd_aluno = a.cd_aluno
where t.nm_turma = '6A'
and m.nm_materia = 'Matemática'
and p.nm_professor = 'Renato';

SELECT
	aluno.nm_aluno,
    turma.nm_turma,
    materia.nm_materia,
    professor.nm_professor
FROM aluno_turma
JOIN aluno
ON aluno.cd_aluno = aluno_turma.cd_aluno
JOIN turma
ON turma.cd_turma = aluno_turma.cd_turma
JOIN materia
ON materia.cd_materia = aluno_turma.cd_materia
JOIN professor
ON professor.cd_professor = materia.cd_professor
WHERE professor.nm_professor = "Renato"
AND
materia.nm_materia="Matemática";

select count(a.cd_aluno)
from aluno a join turma t
join materia m join aluno_turma alt
on alt.cd_materia = m.cd_materia
and alt.cd_turma = t.cd_turma
and alt.cd_aluno = a.cd_aluno
where t.turno_turma = 'Matutino'
and m.nm_materia = 'Português';

drop table aluno_turma;
drop table materia;
drop table turma;
drop table aluno;
drop table professor;