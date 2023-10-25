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

insert into funcionarios(nomeFunc, login, senha, cargo, email) values ("Pedro Rodrigues", "pedrorodrigues", md5("123@senac"), "Gerência", "pedrorodrigues@gmai.com");


/* READ */
/* Ler/Buscar as informações da tabela funcionários */
select * from funcionarios;

/* Buscar o login e a senha da tabela funcionarios em que o login seja admin e senha seja admin */
select login as Login, senha from funcionarios where login = "admin" and senha =md5("admin");

/* Buscar o ID e o nome do funcionário da tabela de funcionarios ordenando o nome alfabeticamente (ascendente, de A - Z) */
select idFunc as ID_Funcionario, nomeFunc as Nome_Funcionario from funcionarios nomeFunc order by nomeFunc asc;

/* Buscar o ID e o nome do funcionário da tabela de funcionarios ordenando o nome alfabeticamente (descendente, de Z - A) */
select idFunc as ID_Funcionario, nomeFunc as Nome_Funcionario from funcionarios nomeFunc order by nomeFunc desc;

/* Buscar os campos ID com o apelido ID_Funcionario, nomeFunc com o apelido Nome_Funcionario e cargo com o apelido Cargo_Funcionario
da tabela funcionarios ordenado de forma descendente (do maior ID para o menor) */ 
select idFunc as ID_Funcionario, nomeFunc as Nome_Funcionario, cargo as Cargo_Funcionario from funcionarios nomeFunc order by idFunc desc;

/* Buscar os campos ID com apelido ID_Funcionario, nomeFunc com o apelido Nome_Funcionario e cargo com apelido Cargo_Funcionario
da tabela funcionarios ordenando de forma descendente (do maior ID para o menor)
(<>) Este sinal significa diferente, also --> (≠) */
select idFunc as ID_Funcionario, nomeFunc as Nome_Funcionario, cargo as Cargo_Funcionario from funcionarios where cargo <> 'null' order by idFunc desc;

select * from funcionarios where cargo = 'Gerência' order by idFunc asc;


/* UPDATE */
update funcionarios set login = "felipecoelho" where idFunc = 8;

update funcionarios set cargo = "Gerência" where idFunc = 4;

/* update funcionarios set email = "lauralopes@gmail.com" where idFunc = 5; */

/* DELETE */
delete from funcionarios where idFunc = 6;




create table quartos (
	idQuarto int primary key auto_increment,
    andar varchar(10) not null,
    tipoQuarto varchar(50) not null,
    ocupacaoMax int not null,
    situacao char(3) not null,
    nome varchar(50) not null,
    descricao text,
    preco decimal(10,2) not null,
    tipoCama varchar(20),
    varanda char(3)
);

describe quartos;

select * from quartos;


alter table quartos add column numeroQuarto varchar(10) not null after andar;
alter table quartos add column cafeDaManha char(3) not null after preco;
alter table quartos add column foto varchar(255) not null after descricao;

insert into quartos (andar, numeroQuarto, tipoQuarto, ocupacaoMax, situacao, nome, descricao, preco, tipoCama, varanda) values ("5º", "505", "Superior Premier", 3, "não", "Familiar", "O quarto de 32m² com piso frio, varanda - vista para o mar. Oferece ar condicionado individual, TV LCD 42'', wi-fi grátis, cofre digital, frigobar abastecido e banheiro com secador de cabelo e amenities e mesa de trabalho.",  750.90, "Queen Size, Solteiro", "sim");

insert into quartos (andar, numeroQuarto, tipoQuarto, ocupacaoMax, situacao, nome, descricao, foto, preco, cafeDaManha, tipoCama, varanda) values ("3º", "308", "Suíte Júnior", 2, "sim", "Casal", "Esta suíte com ar-condicionado dispõe de 1 quarto e 1 banheiro com chuveiro e secador de cabelo. A acomodação conta com frigobar, cofre e TV. A unidade tem 2 camas. Suíte privativa 50 m²", "https://pousadaportomare.com.br/wp-content/uploads/2022/08/tipos-de-quarto.jpg",  680.50, "Sim", "King Size", "não"); 

insert into quartos (andar, numeroQuarto, tipoQuarto, ocupacaoMax, situacao, nome, descricao, foto, preco, cafeDaManha, tipoCama, varanda) values ("2º", "210", "Suíte", 1, "não", "Solteiro", "Esta suíte com ar-condicionado dispõe de 1 quarto e 1 banheiro com chuveiro e secador de cabelo. A acomodação conta com frigobar, cofre e TV. A unidade tem 1 cama. Suíte privativa 50 m²", "https://classic.exame.com/wp-content/uploads/2016/12/03-quartos-pequenos-hotel-howard.jpg?quality=70&strip=info&w=680", 357.90, "Não", "Solteiro", "sim");

insert into quartos (andar, numeroQuarto, tipoQuarto, ocupacaoMax, situacao, nome, descricao, foto, preco, cafeDaManha, tipoCama, varanda) values ("5º", "560", "Superior Triplo", 3, "sim", "Triplo", "Este quarto tem 2 camas de solteiro ou 1 cama de casal e 1 cama extra. Inclui uma pequena varanda com vista lateral da cidade, ar-condicionado, TV de tela plana com canais a cabo, frigobar e banheiro privativo com produtos de banho. O Wi-Fi grátis está à sua disposição.", "https://cf.bstatic.com/xdata/images/hotel/max1024x768/290904715.jpg?k=2157e322e872fc357cdf71612a1b4bcd40f306d4bcad1d8604b88172de3da127&o=&hp=1", 958.70, "sim", "Solteiro ou casal", "sim");

insert into quartos (andar, numeroQuarto, tipoQuarto, ocupacaoMax, situacao, nome, descricao, foto, preco, cafeDaManha, tipoCama, varanda) values ("3º", "319", "Superior Luxo", 2, "não", "Casal", "Esta suíte com ar-condicionado dispõe de 1 quarto e 1 banheiro com chuveiro e secador de cabelo. A acomodação conta com frigobar, cofre e TV. A unidade tem 1 cama. Suíte privativa 50 m²", "https://classic.exame.com/wp-content/uploads/2016/12/03-quartos-pequenos-hotel-howard.jpg?quality=70&strip=info&w=680", 890.90, "sim", "King Size", "sim");


update quartos set tipoCama = "Queen Size, Solteiro" where idQuarto = 1;

update quartos set cafeDaManha = "sim" where idQuarto = 1;
update quartos set foto = "https://www.pacoteshyatt.com.br/wp-content/uploads/2018/08/hotel-hyatt-sao-paulo.jpg" where idQuarto = 1;

/* Verificar quais quartos estejam disponíveis */
select * from quartos where situacao = 'não';

select * from quartos where situacao = "não" and cafeDaManha = "sim";
select * from quartos where situacao = "não" and cafeDaManha = "sim" and varanda = "sim";
select * from quartos where preco < 700.00 and situacao = "não";
select * from quartos where situacao = "não" order by preco asc;



/* dataPedido timestamp default current_timestamp significa que a data do pedido será a mesma do sistema, ou seja, a data atual
statusPedido significa que a situação do pedido será uma das seguintes opções: Pendente, Finalizado, Cancelado */
create table pedido (
	idPedido int primary key auto_increment,
    dataPedido timestamp default current_timestamp,
    statusPedido enum("Pendente", "Finalizado", "Cancelado") not null,
    idCliente int not null,
    foreign key (idCliente) references clientes(idCliente)
);

insert into pedido (statusPedido, idCliente) values ("Pendente", 1);
insert into pedido (statusPedido, idCliente) values ("Finalizado", 2);

select * from pedido;

describe pedido;


create table reservas (
	idReserva int primary key auto_increment,
    idPedido int not null,
    idQuarto int not null,
	foreign key (idPedido) references pedido(idPedido),
    foreign key (idQuarto) references quartos(idQuarto)
);

select * from reservas;

describe reservas;

create table clientes (
	idCliente int primary key auto_increment,
    nomeCompleto varchar(100) not null,
    cpf char(14) not null unique,
    rg char(12)  not null unique,
    email varchar(50) unique,
    celular varchar(20) not null,
    numeroCartao varchar(20) not null unique,
    nomeTitular varchar(100) not null,
    validade date not null,
    cvv char(3) not null,
    checkin datetime not null,
    checkout datetime not null
);

describe clientes;

drop table clientes;

insert into clientes (nomeCompleto, cpf, rg, email, celular, numeroCartao, nomeTitular, validade, cvv, checkin, checkout) values
("José de Assis", "829.942.570-09", "48.353.888-7","josédeassis@gmail.com", "(96) 99338-2803", "5526 4863 8286 2543", "José de Assis", "2025-03-24",  
"452", "2023-11-02 14:00:00", "2023-11-05 12:00:00");

insert into clientes (nomeCompleto, cpf, rg, email, celular, numeroCartao, nomeTitular, validade, cvv, checkin, checkout) values
("Diogo Pietro Juan Novaes", "234.637.687-63", "39.885.708-8", "diogopietronovaes@gmail.com.br", "(65) 99170-4378", "5581 4042 4818 9045", "Diogo Pietro Juan Novaes", "2024-05-24",
"737", "2023-12-29 18:00:12", "2024-01-05 14:00:37");

insert into clientes (nomeCompleto, cpf, rg, email, celular, numeroCartao, nomeTitular, validade, cvv, checkin, checkout) values 
("Mariah Clarice Gomes", "074.783.551-96", "26.469.491-0", "mariah_gomes@gmail.com", "(65) 98664-3479", "5484 0133 2116 5075", "Mariah Clarice Gomes", "2024-03-24", 
"834", "2023-12-23 17:30:24", "2024-01-03 19:00:32");

select * from clientes;

/* Buscar o nome completo e o celular do cliente que alugou o quarto de número 505, pois a tabela está vinculada à tabela clientes pelo campo idQuarto */
select clientes.nomeCompleto, clientes.celular from quartos inner join clientes on quartos.idQuarto = clientes.idQuarto where numeroQuarto = 505;

/* Buscar TODAS AS INFORMAÇÕES da tabela quartos que está vinculada à tabela clientes pelo campo idQuarto */
select * from quartos inner join clientes on quartos.idQuarto = clientes.idQuarto where numeroQuarto = 505;

/* Buscar o nome completo e data/horário do checkout do cliente que alugou o quarto de número 505 */
select clientes.nomeCompleto, date_format(clientes.checkout, '%d/%m/%Y - %H:%i') as Checkout from quartos inner join clientes on quartos.idQuarto = clientes.idQuarto where numeroQuarto = 505;

