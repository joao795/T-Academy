create database projeto;

use projeto;

create table marcas(
	codigo_marca int auto_increment primary key,
    nome_marca varchar(30) not null
);

insert into marcas (nome_marca) values
('Apple'),
('Samsung'),
('Xiamoi');

create table produtos(
	codigo_produto int auto_increment primary key,
    nome_produto varchar(40) not null,
    codigo_marca int,
	foreign key(codigo_marca) references marcas(codigo_marca)
);

insert into produtos(nome_produto, codigo_marca) values
('iPhone 13', 1),
('Samsung Galaxy S20', 2),
('ipHone 12', 1);

truncate table produtos;

select * from marcas;

select 
	produtos.nome_produto,
    marcas.nome_marca
from produtos
inner join marcas
on produtos.codigo_marca = marcas.codigo_marca;

select
	marcas.nome_marca,
	count(produtos.codigo_marca)
from marcas
left join produtos
on produtos.codigo_marca = marcas.codigo_marca
group by produtos.codigo_marca;

select 
	*, 
    date_format(now(), '%d/%m/%Y'),
	date_format(now(), '%H:%i')
from produtos limit 1;