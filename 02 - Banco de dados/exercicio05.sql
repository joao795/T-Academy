create database exercicio05;

use exercicio05;

create table marca(
	codigo_marca int primary key auto_increment,
    nome_marca varchar(20)
);

create table produto(
	codigo_produto int primary key auto_increment,
    nome_produto varchar(50),
    valor_produto int,
    quantidade_estoque int,
    codigo_marca int,
    foreign key(codigo_marca) references marca(codigo_marca)
);

insert into marca values
(null, 'Nike'),
(null, 'Adidas'),
(null, 'Colcci'),
(null, 'Tommy Hilfiger'),
(null, 'Hering'),
(null, 'Vans'),
(null, 'Vizzano'),
(null, 'Aramis'),
(null, 'Reserva');

insert into produto values
(null, 'Tênis Adidas Performance', 345.00, 765, 2),
(null, 'Tênis Nike Revolution', 769.00, 1235, 1),
(null, 'Bota Chelsea Lacey', 99.00, 754, 6),
(null, 'Camisa Adidas Originals', 346.00, 344, 2),
(null, 'Sandália Vizzano', 1540.00, 83, 7);

select p.nome_produto, m.nome_marca, p.valor_produto
from produto p inner join marca m 
on m.codigo_marca = p.codigo_marca; 

select m.nome_marca, count(p.codigo_produto) 
from marca m inner join produto p 
on p.codigo_marca = m.codigo_marca
group by m.nome_marca; 

select nome_produto, valor_produto from produto 
order by valor_produto desc;

select m.nome_marca, avg(p.valor_produto) 
from produto p inner join marca m 
on m.codigo_marca = p.codigo_marca
group by m.nome_marca;

select p.nome_produto, p.valor_produto, m.nome_marca, p.quantidade_estoque
from produto p inner join marca m 
on m.codigo_marca = p.codigo_marca
and p.valor_produto = (select max(valor_produto) from produto);

select 
	p.codigo_produto, 
    p.valor_produto,
    p.quantidade_estoque,
    m.nome_marca 
from produto p inner join marca m 
on m.codigo_marca = p.codigo_marca
and p.quantidade_estoque >= 500 
and p.quantidade_estoque <= 1000;

select nome_produto, valor_produto, quantidade_estoque 
from produto
where nome_produto LIKE '%blusa%'
or nome_produto LIKE '%camiseta%'
or nome_produto LIKE '%camisa%'
order by valor_produto desc;  

select m.nome_marca, sum(p.valor_produto)
from produto p inner join marca m
on m.codigo_marca = p.codigo_marca
group by m.nome_marca;

select m.nome_marca
from produto p inner join marca m 
on m.codigo_marca = p.codigo_marca
and p.valor_produto = 
(select max(valor_produto) from produto);

select nome_produto, quantidade_estoque from produto
where quantidade_estoque >=
(select avg(quantidade_estoque) from produto); 

drop table produto;
drop table marca;