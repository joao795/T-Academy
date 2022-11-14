create database projeto_final;

create database projeto;

DROP DATABASE projeto;

create database spring_security;

use dto;

select * from usuarios;

insert into tb_roles values
(null, "ROLE_ADMIN"),
(null, "ROLE_USER");

insert into tb_users values
(null, "joao", "string"),
(null, "eula", "string");

insert into tb_users_roles values
(1, 1),
(2, 2);

select * from tb_roles;
select * from tb_users;
select * from tb_users_roles;