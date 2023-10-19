/* Mostrar os bancos de dados existentes no servidor */
show databases;

/* Criar um novo banco */
create database dbHotel;

/* Selecionar o banco de dados */
use dbHotel;


/* Excluir a tabela do banco */
drop table funcionarios;

/* Adicionar o campo email à tabela funcionarios */
alter table funcionarios add column email varchar(50);

alter table funcionarios add column nomeFunc varchar(100) not null after idFunc;

/* Excluir um campo da tabela */
alter table funcionarios drop column email;

/* Reposicionar o campo email para que ele fique após o campo login */
alter table funcionarios modify column email varchar(50) not null after login;

/* Modificar o campo email para que se torne obrigatório, ou seja, não nulo (not null) */
alter table funcionarios modify column email varchar(50) not null;

/* Criar uma nova tabela */
create table funcionarios (
/* Int se refere ao tipo do campo na tabela
Primary key determina que o campo seja uma chave primaria e será responsavel por identificar
auto_increment determina que o MySQL dê um id novo a cada cadastro*/
	idFunc int primary key auto_increment,
    
/* Varchar é a quantidade variavel de caracteres no nome (nesse caso,até 100 caracteres)
not null determina que  campo seja obrigatorio */
    
/* Unique determina que o campo seja unico e o valor nao possa repetir */
    login varchar(20) not null unique,
    senha varchar(255) not null,
	cargo varchar(20)
);

/* Descreve os campos da tabela funcionarios */
describe funcionarios;



/* Mostrar as tabelas */
show tables;

/* CREATE */
/* Inserir um novo funcionário na tabela, com nome, login, senha criptografada e cargo */
insert into funcionarios(nomeFunc, login, senha, cargo, email) values ("Administrador", "admin", md5("admin"), "Administrador", "admin@gmail.com");

insert into funcionarios(nomeFunc, login, senha, cargo, email) values ("Pamella Pereto", "pamellapereto", md5("123@senac"), "TI", "pamellapereto@gmail.com");

insert into funcionarios(nomeFunc, login, senha, cargo, email) values ("Breno Silva", "brenosilva", md5("123@senac"), "Contabilidade", "brenosilva@gmai.com");

insert into funcionarios(nomeFunc, login, senha, cargo, email) values ("Victoria Cardoso", "victoriacardoso", md5("123@senac"), "RH", "victoriacardoso@gmail.com");

insert into funcionarios(nomeFunc, login, senha, email) values ("Laura Lopes", "lauralopes", md5("123@senac"), "lauralopes@gmail.com");

insert into funcionarios(nomeFunc, login, senha, email) values ("Felipe Coelho", "felipe", md5("123@senac"), "felipecoelho@gmail.com");


/* READ */
/* Ler/Buscar as informações da tabela funcionários */
select * from funcionarios;

/* Buscar o login e a senha da tabela funcionarios em que o login seja admin e senha seja admin */
select login as Login, senha from funcionarios where login = "admin" and senha =md5("admin");


/* UPDATE */
update funcionarios set login = "felipecoelho" where idFunc = 8;

update funcionarios set cargo = "Gerência" where idFunc = 5;

/* update funcionarios set email = "lauralopes@gmail.com" where idFunc = 5; */