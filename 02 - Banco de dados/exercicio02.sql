create database exercicio02;

use exercicio02;

create table produtos(
	codigo int primary key auto_increment,
    nome varchar(50),
    marca varchar(25),
    valor double,
    estoque int
);

insert into produtos values
(null, 'Teclado', 'Microsoft', 220.00, 60),
(null, 'Monitor 32', 'Samsung', 3700.00, 20),
(null, 'Mouse', 'Logitech', 129.90, 45),
(null, 'Impressora', 'Epson', 430.00, 15),
(null, 'Mouse', 'Microsoft', 199.90, 50),
(null, 'Monitor 27', 'LG', 1990.80, 30),
(null, 'Cadeira Gamer', 'Multilaser', 1170.00, 20),
(null, 'Teeclado', 'Dell', 110.00, 50),
(null, 'Mouse', 'HP', 80.00, 70),
(null, 'Placa de vídeo - GeFore GTX 1660', 'ASUS', 2800.00, 10),
(null, 'SSD de 256GB', 'Kingston', 400.00, 15),
(null, 'Processador Core i5 - 10ª geração', 'Intel', 1800.00, 10),
(null, 'Mouse', 'Multilaser', 44.90, 70),
(null, 'Monitor 23', 'Dell', 1800.00, 10),
(null, 'Teclado', 'HP', 119.90, 25);

select * from produtos;

truncate table produtos;

select marca, count(*) from produtos group by marca;

select avg(valor) from produtos;

select marca, sum(valor) from produtos group by marca;

select nome, valor from produtos order by valor desc;

select nome, valor from produtos
where valor = (select max(valor) from produtos);

select * from produtos 
where valor >= (select avg(valor) from produtos);

select * from produtos
where estoque = (select max(estoque) from produtos);

select nome, marca, valor from produtos
where valor >= 100 and valor <= 500;

select nome, marca, valor from produtos 
where nome like 'mouse%' order by valor asc;

select nome, length(nome) from produtos;

update clientes set marca = 'Alienware' where merca = 'Dell';

drop table produtos;