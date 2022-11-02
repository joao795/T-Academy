create trigger gerar_idade_professor
before insert on professores
for each row
set new.idade_professor = date_format(now(), '%Y') - date_format(nascimento_professor, '%Y');

create trigger gerar_idade_aluno
before insert on alunos
for each row
set new.idade_aluno = date_format(now(), '%Y') - date_format(nascimento_aluno, '%Y');

create trigger gerar_media
before insert on alunos
for each row
set new.media_aluno = (nota1_aluno + nota2_aluno) / 2;

create trigger gerar_situacao
before insert on alunos
for each row
set new.situacao_aluno = if (media_aluno >= 7, 'Aprovado', 'Reprovado');

create trigger gerar_valor_promocional
after insert on materias
for each row
set new.valor_materia = valor_materia * 0.8;