create database exercicio04;

use exercicio04;

create table cargos(
	codigo_cargo int primary key auto_increment,
    nome_cargo varchar(50),
    salario_cargo int
); 

create table colaboradores(
	codigo_colaborador int primary key auto_increment,
    nome_colaborador varchar(40),
    nascimento_colaborador date,
    codigo_cargo int,
    foreign key(codigo_cargo) references cargos(codigo_cargo),
    estado_trabalho varchar(2),
    cidade_trabalho varchar(20),
    genero_colaborador varchar(10)
);

insert into cargos values
(null, 'Desenvolvedor', 3000),
(null, 'Analista', 4500),
(null, 'Arquiteto de Software', 6200),
(null, 'Administrador de Banco de Dados', 7700),
(null, 'Gerente de Projetos', 9900);

SELECT * FROM cargos;

insert into colaboradores values
(null, 'Jefferson', '1973-05-19', 1, 'SC', 'Blumenau', 'Masculino');
# ...

select nome_colaborador, nome_cargo, salario_cargo
from colaboradores inner join cargos
on colaboradores.codigo_cargo = cargos.codigo_cargo;

select nome_cargo, count(*) 
from cargos inner join colaboradores
on cargos.codigo_cargo = colaboradores.codigo_cargo 
group by colaboradores.nome_colaborador;

select colaboradores.genero_colaborador, sum(cargos.salario_cargo) / count(*) 
from colaboradores inner join cargos
on  cargos.codigo_cargo = colaboradores.codigo_cargo
group by genero_colaborador;

insert into colaboradores values(null, 'João', '2000-01-05', 1, 'SC', 'Blumenau', 'Masculino');

select nome_colaborador, nascimento_colaborador
from colaboradores 
where (date_format(now(), '%Y') - date_format(nascimento_colaborador, '%Y')) >= 20
and (date_format(now(), '%Y') - date_format(nascimento_colaborador, '%Y')) <= 30;

select nome_colaborador, nascimento_colaborador
from colaboradores
where nascimento_colaborador;

select estado_trabalho, count(*) from colaboradores group by estado_trabalho;

select cidade_trabalho, count(*) from colaboradores group by cidade_trabalho;

insert into colaboradores values(null, 'Joana', '1980-01-05', 1, 'PR', 'Curitiba', 'Feminino');  

select * from colaboradores 
where genero_colaborador = 'Feminino'
and  (date_format(now(), '%Y') - date_format(nascimento_colaborador, '%Y')) >= 30 
and estado_trabalho = 'PR';

select colaboradores.cidade_trabalho, avg(cargos.salario_cargo)
from cargos inner join colaboradores
on colaboradores.codigo_cargo = cargos.codigo_cargo
group by cidade_trabalho;

select avg(salario_cargo)
from cargos inner join colaboradores
on colaboradores.codigo_cargo = cargos.codigo_cargo;

select * from colaboradores 
where nascimento_colaborador = 
(select min(nascimento_colaborador) from colaboradores);

insert into colaboradores values(null, 'Guilherme', '1995-01-01', 2, 'SC', 'Brusque', 'Masculino');

select count(*) from colaboradores
where date_format(nascimento_colaborador, '%Y') >= 1990
and date_format(nascimento_colaborador, '%Y') <= 1999;

drop table colaboradores;	
drop table cargos;