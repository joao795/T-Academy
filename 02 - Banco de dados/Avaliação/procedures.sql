delimiter $$
create procedure cadastrar_professor
	(in nome varchar(30), 
	 in nascimento date, 
	 in cidade int, 
	 out mensagem varchar(30))
begin
	declare qtd_cidades int default 0;
	
	select count(*)
	into qtd_cidades
	from cidades
	where codigo_cidade = cidade;
	
	if length(nome) >= 3 then
		if qtd_cidades > 0 then
			insert into professores
			(codigo_professor,
			nome_professor,
			nascimento_professor,
			cidade_professor) values
			(null, nome, nascimento, cidade)
			set mensagem = 'Professor cadastrado com sucesso.';
		else 
			set mensagem = 'Não foi cadastrada cidade com esse código.';
		end if;
	else 
		set mensagem = 'ERRO: nome inválido.';
	end if;
end
delimiter $$

delimiter $$
create procedure cadastrar_aluno
	(in nome varchar(30), 
    in nascimento date, 
    in cidade int, 
    in nota1 double
    in nota2 double
	out mensagem varchar(30))
begin
	declare qtd_cidades int default 0;
	
	select count(*)
	into qtd_cidades
	from cidades
	where codigo_cidade = cidade;
	
	if length(nome) >= 3 then
		if qtd_cidades > 0 then
			insert into alunos
			(nome_aluno,
			nascimento_aluno,
			cidade_aluno,
			nota1_aluno,
			nota2_aluno) values
			(null, nome, nascimento, cidade, nota1, nota2);
			set mensagem = 'Aluno cadastrado com sucesso.';
		else 
			set mensagem = 'Não foi cadastrada cidade com esse código.';
		end if;
	else 
		set mensagem = 'ERRO: nome inválido.';
	end if;
end
delimiter $$

delimiter $$
create procedure cadastrar_materia(in nome varchar(50), out mensagem varchar(30))
begin
	declare qtd_materias int default 0;
	
	select count(*)
	into qtd_materias
	from materias
	where nome_materia = nome;
	
	if qtd_materias = 0 then
		insert into materias(null, nome);
		set mensagem = 'Matéria cadastrada com sucesso.';
	else
		set mensagem = 'Já foi cadastrada matéria com esse nome.';
	end if;
end
end
delimiter $$

delimiter $$
create procedure cadastrar_turmas(in nome varchar(2), out mensagem varchar(30))
begin
	declare qtd_turmas int default 0;
	
	select count(*)
	into qtd_turmas
	from turmas
	where nome_turma = nome;
	
	if qtd_turmas = 0 then
		insert into turmas(null, nome);
		set mensagem = 'Turma cadastrada com sucesso.';
	else
		set mensagem = 'Já foi cadastrada turma com esse nome.';
	end if;
end
delimiter $$

delimiter $$
create procedure cadastrar_cidades(in nome varchar(20) in estado int, out mensagem varchar(30))
begin
	delcare qtd_cidades int default 0;
	
	select count(*)
	into qtd_cidades
	from cidades
	where nome_cidade = nome
	and estado_ciade = estado;
	
	if qtd_cidades = 0
		insert into cidades(null, nome, estado);
		set mensagem = 'Cidade cadastrada com sucesso.';
	else 
		set mensagem = 'Já existe nesse estado uma cidade com esse nome.';
	end if;
end
delimiter $$

delimiter $$
create procedure cadastrar_estados(in nome varchar(2), out mensagem varchar(30))
begin
	delcare qtd_estados int default 0;
	
	select count(*)
	into qtd_estados
	from estados
	where nome_estado = nome
	
	if qtd_estados = 0
		insert into estados(null, nome);
		set mensagem = 'Estado cadastrado com sucesso.';
	else 
		set mensagem = 'Já existe um estado com esse nome.';
	end if;
end
delimiter $$

delimiter $$
create procedure alterar_nome_professor(in codigo int, nome_novo varchar(30), mensagem varchar(30))
begin
	declare qtd_professores int default 0;
	
	select count(*)
	into qtd_professores
	from professores
	where codigo_professor = codigo;
	
	if qtd_professores > 0 then
		if length(novo_nome) >= 3 then
			update professores set nome_professor = nome_novo where codigo_professor = codigo;
			set mensagem = 'Professor alterado com sucesso.';
		else 
			set mensagem = 'ERRO: nome inválido.';
		end if;
	else 
		set mensagem = 'Não foi cadstrado professor com esse código.';
	end if;
end
delimiter $$

delimiter $$
create procedure alterar_nome_aluno(in codigo int, nome_novo varchar(30), out mensagem varchar(30))
begin
	declare qtd_alunos int default 0;
	
	select count(*)
	into qtd_alunos
	from alunos
	where codigo_aluno = codigo;
	
	if qtd_alunos > 0 then
		if length(novo_nome) >= 3 then
			update alunos set nome_aluno = nome_novo where codigo_aluno = codigo;
			set mensagem = 'Aluno alterado com sucesso.';
		else 
			set mensagem = 'ERRO: nome inválido.';
		end if;
	else 
		set mensagem = 'Não foi cadstrado aluno com esse código.';
	end if;
end
delimiter $$

delimiter $$
create procedure alterar_nome_materia
	(in codigo int, 
	 nome_novo varchar(50), 
	 out mensagem varchar(30))
begin
	declare qtd_materias int default 0;
	
	select count(*)
	into qtd_materias
	from materias
	where codigo_materia = codigo;
	
	if qtd_materias > 0 then
		if length(novo_nome) >= 3 then
			update materias set nome_materia = nome_novo where codigo_materia = codigo;
			set mensagem = 'Matéria alterada com sucesso.';
		else 
			set mensagem = 'ERRO: nome inválido.';
		end if;
	else 
		set mensagem = 'Não foi cadstrada matéria com esse código.';
	end if;
end
delimiter $$

delimiter $$
create procedure remover_professor(in codigo int, out mensagem varchar(30))
begin 
	declare qtd_professores int default 0;
	
	select count(*)
	into qtd_professores
	from professores
	where codigo_professor = codigo;
	
	if qtd_professores > 0 then
		delete from professores where codigo_professor = codigo;
		set mensagem = 'Professor removido com sucesso.';
	else 
		set mensagem = 'Não foi cadastrado professor com esse código.';
	end if;
		
end
delimiter $$

delimiter $$
create procedure remover_cidade(in codigo int, out mensagem varchar(30))
begin 
	declare qtd_cidades int default 0;
	
	select count(*)
	into qtd_cidades
	from cidades
	where codigo_cidade = codigo;
	
	if qtd_cidades > 0 then
		delete from cidades where codigo_cidade = codigo;
		set mensagem = 'Cidade removida com sucesso.';
	else 
		set mensagem = 'Não foi cadastrada cidade com esse código.';
	end if;
end
delimiter $$

delimiter $$
create procedure remover_estado(in nome varchar(2), out mensagem varchar(30))
begin 
	declare qtd_estados int default 0;
	
	select count(*)
	into qtd_estados
	from estados
	where nome_estado = nome;
	
	if qtd_estados > 0 then
		delete from estados where nome_estado = nome;
		set mensagem = 'Estado removido com sucesso.';
	else 
		set mensagem = 'Não foi cadastrado estado com esse nome.';
	end if;
end
delimiter $$

delimiter $$
create procedure retornar_parecer(in nota1 double, in nota2 double, out situacao varchar(30))
begin 
	declare media double default (nota1 + nota2) / 2;
	
	if media >= 7 then 
		set situacao = 'Aluno aprovado com média ' + media + '.';
	else 
		set situacao = 'Aluno reprovado com média ' + media + '.';
	end if;
end
delimiter $$