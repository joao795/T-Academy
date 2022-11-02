create database exercicio01;

use exercicio01;

create table clientes(
    codigo int primary key auto_increment,
    nome varchar(40),
    cidade varchar(20),
    idade int
);

insert into clientes values
(null, 'Érica', 'Curitiba', 28),
(null, 'Lucas', 'Blumenau', 16),
(null, 'Larissa', 'Florianópolis', 36),
(null, 'Murilo', 'Joinville', 23),
(null, 'Cristiane', 'Blumenau', 31),
(null, 'Robson', 'Joinville', 42),
(null, 'Mariana', null, 37),
(null, 'Jean', 'Blumenau', 43),
(null, 'Luana', 'Pomerode', 19),
(null, 'Cleber', 'Brusque', 34),
(null, 'Hellen', 'Blumenau', 28),
(null, 'Paulo', 'Joinville', 44),
(null, 'Alessandra', 'São Paulo', 28),
(null, 'Dênis', 'Blumenau', 37),
(null, 'Gabriel', 'São Paulo', 26);

truncate table clientes;

select * from clientes;

select count(*) from clientes;

select max(idade), nome from clientes;

select cidade from clientes where cidade is not null group by cidade;

select cidade, count(*) from clientes group by cidade;

select nome, idade from clientes where cidade is null; 

select avg(idade) from clientes;

select nome, min(idade) from clientes
where idade = (select min(idade) from clientes);

select nome, idade from clientes
where idade >= (select avg(idade) from clientes);

select * from clientes
where idade >= 20 and idade <= 30;

select * from clientes
where cidade = 'Blumenau' and idade >= 30;

select nome, cidade from clientes
where cidade = 'Florianópolis' or cidade = 'Curitiba';

select nome from clientes where nome like '%l%';

select nome from clientes order by nome;

update clientes set cidade = 'Blumenau' where cidade is null;

delete from clientes where cidade <> 'Blumenau';

drop table clientes;