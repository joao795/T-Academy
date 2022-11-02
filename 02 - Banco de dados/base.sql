# Criar a base de dados
CREATE DATABASE base;

# Selecionar base de dados
USE base;

# Criar tabela de produtos
CREATE TABLE produtos(
	codigo INT PRIMARY KEY AUTO_INCREMENT, 
    nome VARCHAR(30),
    marca VARCHAR(20),
    valor DOUBLE,
    dataCadastro DATE
);

# Cadastrar produtos #1
INSERT INTO produtos VALUES(null, 'Notebook Inspiron', 'Dell', 4599, '2022-10-10');

# Cadastrar produtos #2
INSERT INTO produtos (nome, marca, valor) VALUES('Notebook Dell', 'Dell', 2900);

# Cadastrar produtos #3
INSERT INTO produtos VALUES
(null, 'iPhone 13', 'Apple', 7000, '2020-08-07'),
(null, 'Monitor Predator', 'Acer', 1950, '2022-10-07'),
(null, 'Notebook Vostro', 'Dell', 3800, '2022-03-17');

# Selecionar todos os produtos
SELECT * FROM produtos;

# Selectionar as colunas nome e valor
SELECT nome, valor FROM produtos;

# Selecionar produtos com valor inferior a R$3.000,00
SELECT * FROM produtos WHERE valor < 3000;

# Selecionar informações com atributos nulos 
SELECT * FROM produtos WHERE dataCadastro IS NULL;

# Agrupar informações 
SELECT MAX(valor) AS 'Maior valor' FROM produtos;
SELECT MIN(valor) AS 'Menor valor' FROM produtos;
SELECT AVG(valor) AS 'Média valor' FROM produtos;
SELECT COUNT(*) AS 'Registros' FROM produtos;

# condicional
select 
	nome,
	valor,
    if (valor >= 3000,  valor * 0.9, valor * 0.95) as 'pagamento à vista'
from produtos;

# escolha 
select 
	nome,
    valor,
    case 
		when valor <= 1000 then valor * 0.95
        when valor <= 2000 then valor * 0.90
        when valor <= 4000 then valor * 0.85
        else valor * 0.80
	end
from produtos;

# operadores lógicos (and e or)
select * from produtos where marca = 'Dell' and valor >= 3000;

# ordenar dados
select nome from produtos order by nome desc;

# agrupar
select marca from produtos group by marca;

# contém (like)
select nome from produtos where nome like 'n%';
select nome from produtos where nome like '%o';
select nome from produtos where nome like '%p%';

# alterar dados - update
update produtos set valor = 7000 where codigo = 1;

# sub-query
select * from produtos where valor = (select max(valor) from produtos);

# remover dadods - delete
delete from produtos where nome like 'notebook%';

# limpar a tabela e reiniciar o autoincremento 
truncate table produtos;

# listar as colunas da tabela
describe produtos;

# criar coluna
alter table produtos add column estoque int;

# remover coluna
alter table produtos drop column estoque;

# alterar características das colunas
alter table produtos modify column nome varchar(50);

# renomear coluna 
alter table produtos rename column nome to produto;

# excluir tabela
drop table produtos;

# excluir base de dados
drop database base;

/*
	> Maior
    < Menor
    >= Maior ou igual
    <= Menor ou igual
    = Igual
    <> Diferente
/*