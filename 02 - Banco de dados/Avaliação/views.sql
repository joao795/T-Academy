create view alunos_blumenau_sc as
select alunos.nome_aluno, cidades.estado_cidade 
from alunos
inner join cidades
on alunos.cidade_aluno = cidades.nome_cidade
where cidades.estado_cidade = 'SC'
and cidades.nome_cidade = 'Blumenau';

create view professores_sul as
select professores.nome_professor, cidades.estado_cidade
from professores
inner join cidades
where cidades.estado_cidade = 'SC'
or cidades.estado_cidade = 'PR'
or cidades.estado_cidade = 'RS';

create view aluno_mais_velho as
select alunos.nome_aluno, turmas.nome_turma
from turmas_alunos
left join alunos
on turmas_alunos.codigo_aluno = alunos.codigo_aluno
left join turmas
on turmas_alunos.codigo_turma = turmas.codigo_turma
where alunos.nascimento_aluno = 
(select max(date_format(now(), '%Y') - date_format(alunos.nascimento_aluno, '%Y')) from alunos);

create view professores_entre_30_40 as
select nome_professor
from professores
where idade_professor between 30 and 40;

create view pior_aluno as
select *
from alunos
where media_aluno =
(select min(media_aluno) from alunos);

create view alunos_por_nota as
select *
from alunos
order by media_aluno desc;

create view professores_letra_m as
select professores.nome_professor, materias.nome_materia
from materias_professores
right join professores
on materias_professores.codigo_professor = professores.codigo_professor
right join materias
on materias_professores.codigo_materia = materias.codigo_materia
where professores.nome_professor like '%m%';

create view qtd_alunos_por_situacao as
select situacao_aluno, count(codigo_aluno)
from alunos
group by situacao_aluno;

create view gerar_turmas as
select 
    professores.nome_professor,
    materias.nome_materia,
    turmas.nome_turma
from professores_turmas
inner join turmas
on professores_turmas.codigo_turma = turmas.codigo_turma
inner join professores
on professores_alunos.codigo_professor = professores.codigo_professor
inner join materias_professores
on materias_professores.codigo_professor = professores.codigo_professor
inner join materias
on materias_professores.codigo_materia = materias.codigo_materia
inner join turmas_alunos
on turmas_alunos.codigo_aluno = alunos.codigo_aluno;

create view turma_mais_alunos as
select turmas.nome_turma, count(alunos.codigo_aluno)
from turmas_alunos
inner join turmas
on turmas_alunos.codigo_turma = turmas.codigo_turma
inner join alunos
on turmas_alunos.codigo_aluno = alunos.codigo_aluno
having count(alunos.codigo_aluno) > 5;

create view gerar_situacao as
select situacao_aluno,
case 
	when media_aluno >= 7 then "Aprovado"
    else "Reprovado"
end
from alunos;