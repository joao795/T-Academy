insert into professores 
	(codigo_professor, 
    nome_professor, 
    nascimento_professor,
    cidade_professor) values
(null, 'Ralf', '1990-01-29', 1),
(null, 'Valdameri', '1970-01-01', 2),
(null, 'Miguel', '1970-10-14', 3),
(null, 'Marcel', '1972-06-01', 4),
(null, 'Joyce', '1968-08-01', 5),
(null, 'Aleteia', '1985-01-02', 6),
(null, 'Dalton', '1970-10-10', 7),
(null, 'Válter', '1987-09-08', 8),
(null, 'Gilvan', '1990-05-05', 9),
(null, 'Érica', '1975-04-03', 10);

insert into cidades values
(null, 'Blumenau', 1),
(null, 'Curitiba', 2),
(null, 'Santos', 3),
(null, 'Niterói', 4),
(null, 'Outro Preto', 5),
(null, 'Salvador', 6),
(null, 'Recife', 7),
(null, 'Natal', 8),
(null, 'Belém', 9),
(null, 'Fortaleza', 10);

insert into estados values
(null, 'SC'),
(null, 'PR'),
(null, 'SP'),
(null, 'RJ'),
(null, 'MG'),
(null, 'BA'),
(null, 'PE'),
(null, 'RN'),
(null, 'PA'),
(null, 'CE');

insert into materias values
(null, 'Programação Orientada a Objetos'),
(null, 'Algoritmos e Estrutura de Dados'),
(null, 'Teoria da Computação'),
(null, 'Arquitetura de Computadores'),
(null, 'Programação Web'),
(null, 'Legislação em Informática'),
(null, 'Introdução à Programação'),
(null, 'Banco de Dados'),
(null, 'Engenharia de Software'),
(null, 'Inteligência Artificial');

insert into materias_professores values
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5),
(6, 6),
(7, 7),
(8, 8),
(9, 9),
(10, 10);

insert into alunos
	(codigo_aluno, 
    nome_aluno, 
    nascimento_aluno,
    cidade_aluno,
    nota1_aluno,
    nota2_aluno) values
(null, 'João', '1990-01-29', 1, 10, 10),
(null, 'Matheus', '1970-01-01', 2, 9, 8),
(null, 'Brena', '1970-10-14', 3, 8, 9),
(null, 'Leonardo', '1972-06-01', 4, 7, 8),
(null, 'Eula', '1968-08-01', 5, 8, 7),
(null, 'Sophia', '1985-01-02', 6, 7, 6),
(null, 'Gustavo', '1970-10-10', 7, 6, 7),
(null, 'Guilherme', '1987-09-08', 8, 5, 6),
(null, 'Luana', '1990-05-05', 9, 6, 5),
(null, 'Cláudio', '1975-04-03', 10, 5, 4);

insert into turmas values
(null, '1A'),
(null, '1B'),
(null, '2A'),
(null, '2B'),
(null, '3A'),
(null, '3B'),
(null, '4A'),
(null, '4B'),
(null, '5A'),
(null, '5B');

insert into turmas_alunos values
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5),
(6, 6),
(7, 7),
(8, 8),
(9, 9),
(10, 10);

insert into professores_alunos values
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5),
(6, 6),
(7, 7),
(8, 8),
(9, 9),
(10, 10);