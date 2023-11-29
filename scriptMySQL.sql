/* Banco de dados para gerenciamento de um hotel */

create database dbHotel;

use dbHotel;

show databases;

show tables;


create table funcionarios (
	idFunc int primary key auto_increment,
    nomeFunc varchar(100) not null,
    login varchar(20) not null unique,
    email varchar(50) not null,
    senha varchar(255) not null,
	cargo varchar(20)
);

describe funcionarios;

insert into funcionarios(nomeFunc, login, senha, cargo, email) values ("Administrador", "admin", md5("admin"), "Administrador", "admin@gmail.com");
insert into funcionarios(nomeFunc, login, senha, cargo, email) values ("Pamella Pereto", "pamellapereto", md5("123@senac"), "TI", "pamellapereto@gmail.com");
insert into funcionarios(nomeFunc, login, senha, cargo, email) values ("Breno Silva", "brenosilva", md5("123@senac"), "Contabilidade", "brenosilva@gmai.com");
insert into funcionarios(nomeFunc, login, senha, cargo, email) values ("Victoria Cardoso", "victoriacardoso", md5("123@senac"), "Gerência", "victoriacardoso@gmail.com");
insert into funcionarios(nomeFunc, login, senha, email) values ("Laura Lopes", "lauralopes", md5("123@senac"), "lauralopes@gmail.com");
insert into funcionarios(nomeFunc, login, senha, cargo, email) values ("Pedro Rodrigues", "pedrorodrigues", md5("123@senac"), "Gerência", "pedrorodrigues@gmai.com");

select * from funcionarios;
select login as Login, senha from funcionarios where login = "admin" and senha =md5("admin");
select idFunc as ID_Funcionario, nomeFunc as Nome_Funcionario from funcionarios nomeFunc order by nomeFunc asc;
select idFunc as ID_Funcionario, nomeFunc as Nome_Funcionario from funcionarios nomeFunc order by nomeFunc desc;
select idFunc as ID_Funcionario, nomeFunc as Nome_Funcionario, cargo as Cargo_Funcionario from funcionarios nomeFunc order by idFunc desc;
select idFunc as ID_Funcionario, nomeFunc as Nome_Funcionario, cargo as Cargo_Funcionario from funcionarios where cargo <> 'null' order by idFunc desc;
select * from funcionarios where cargo = 'Gerência' order by idFunc asc;


create table quartos (
	idQuarto int primary key auto_increment,
    andar varchar(10) not null,
    numeroQuarto varchar(10) not null,
    tipoQuarto varchar(50) not null,
    ocupacaoMax int not null,
    disponibilidade char(3) not null,
    nome varchar(50) not null,
    descricao text,
    foto varchar(255) not null,
    preco decimal(10,2) not null,
    cafeDaManha char(3) not null,
    precoCafe decimal(10,2),
    tipoCama varchar(20),
    varanda char(3)
);

describe quartos;

insert into quartos (andar, numeroQuarto, tipoQuarto, ocupacaoMax, disponibilidade, nome, descricao, foto, preco, cafeDaManha, precoCafe, tipoCama, varanda) values 
("5º", "505", "Superior Premier", 3, "não", "Familiar", "O quarto de 32m² com piso frio, varanda - vista para o mar. Oferece ar condicionado individual, TV LCD 42'', 
wi-fi grátis, cofre digital, frigobar abastecido e banheiro com secador de cabelo e amenities e mesa de trabalho.", "https://www.pacoteshyatt.com.br/wp-content/uploads/2018/08/hotel-hyatt-sao-paulo.jpg", 
750.90, "sim", 60.00, "Queen Size, Solteiro", "sim");
insert into quartos (andar, numeroQuarto, tipoQuarto, ocupacaoMax, disponibilidade, nome, descricao, foto, preco, cafeDaManha, precoCafe, tipoCama, varanda) values 
("3º", "308", "Suíte Júnior", 2, "sim", "Casal", "Esta suíte com ar-condicionado dispõe de 1 quarto e 1 banheiro com chuveiro e secador de cabelo. 
A acomodação conta com frigobar, cofre e TV. A unidade tem 2 camas. Suíte privativa 50 m²", "https://pousadaportomare.com.br/wp-content/uploads/2022/08/tipos-de-quarto.jpg",  
680.50, "Sim", 60.00, "King Size", "não"); 
insert into quartos (andar, numeroQuarto, tipoQuarto, ocupacaoMax, disponibilidade, nome, descricao, foto, preco, cafeDaManha, tipoCama, varanda) values 
("2º", "210", "Suíte", 1, "não", "Solteiro", "Esta suíte com ar-condicionado dispõe de 1 quarto e 1 banheiro com chuveiro e secador de cabelo. A acomodação conta com frigobar, cofre e TV. A unidade tem 1 cama. 
Suíte privativa 50 m²", "https://classic.exame.com/wp-content/uploads/2016/12/03-quartos-pequenos-hotel-howard.jpg?quality=70&strip=info&w=680", 357.90, "Não", "Solteiro", "sim");
insert into quartos (andar, numeroQuarto, tipoQuarto, ocupacaoMax, disponibilidade, nome, descricao, foto, preco, cafeDaManha, precoCafe, tipoCama, varanda) values 
("5º", "560", "Superior Triplo", 3, "sim", "Triplo", "Este quarto tem 2 camas de solteiro ou 1 cama de casal e 1 cama extra. Inclui uma pequena varanda com vista lateral da cidade, ar-condicionado, 
TV de tela plana com canais a cabo, frigobar e banheiro privativo com produtos de banho. O Wi-Fi grátis está à sua disposição.", 
"https://cf.bstatic.com/xdata/images/hotel/max1024x768/290904715.jpg?k=2157e322e872fc357cdf71612a1b4bcd40f306d4bcad1d8604b88172de3da127&o=&hp=1", 958.70, "sim", 60.00, "Solteiro ou casal", "sim");
insert into quartos (andar, numeroQuarto, tipoQuarto, ocupacaoMax, disponibilidade, nome, descricao, foto, preco, cafeDaManha, precoCafe, tipoCama, varanda) values 
("3º", "319", "Superior Luxo", 2, "não", "Casal", "Esta suíte com ar-condicionado dispõe de 1 quarto e 1 banheiro com chuveiro e secador de cabelo. A acomodação conta com frigobar, cofre e TV. 
A unidade tem 1 cama. Suíte privativa 50 m²", "https://classic.exame.com/wp-content/uploads/2016/12/03-quartos-pequenos-hotel-howard.jpg?quality=70&strip=info&w=680", 890.90, "sim", 60.00, "King Size", "sim");

select * from quartos;
select * from quartos where disponibilidade = 'não';
select * from quartos where cafeDaManha = "sim";
select * from quartos where disponibilidade = "não" and cafeDaManha = "sim";
select * from quartos where disponibilidade = "não" and cafeDaManha = "sim" and varanda = "sim";
select * from quartos where preco < 700.00 and situacao = "não";
select * from quartos where disponibilidade = "não" order by preco asc;



create table clientes (
	idCliente int primary key auto_increment,
    nomeCompleto varchar(100) not null,
    cpf char(14) not null unique,
    rg char(12)  not null unique,
    email varchar(50) unique,
    celular varchar(20) not null
);

describe clientes;

insert into clientes (nomeCompleto, cpf, rg, email, celular) values ("José de Assis", "829.942.570-09", "48.353.888-7","josédeassis@gmail.com", "(96) 99338-2803");
insert into clientes (nomeCompleto, cpf, rg, email, celular) values ("Diogo Pietro Juan Novaes", "234.637.687-63", "39.885.708-8", "diogopietronovaes@gmail.com.br", "(65) 99170-4378");
insert into clientes (nomeCompleto, cpf, rg, email, celular) values ("Mariah Clarice Gomes", "074.783.551-96", "26.469.491-0", "mariah_gomes@gmail.com", "(65) 98664-3479");

select * from clientes;



create table pedido (
	idPedido int primary key auto_increment,
    dataPedido timestamp default current_timestamp,
    statusPedido enum("Pendente", "Finalizado", "Cancelado") not null,
    idCliente int not null,
    foreign key (idCliente) references clientes(idCliente)
);

describe pedido;

insert into pedido (statusPedido, idCliente) values ("Pendente", 1);
insert into pedido (statusPedido, idCliente) values ("Finalizado", 2);

select * from pedido;
select * from pedido inner join clientes on pedido.idCliente = clientes.idCliente;



create table reservas (
	idReserva int primary key auto_increment,
    idPedido int not null,
    idQuarto int not null,
	foreign key (idPedido) references pedido(idPedido),
    foreign key (idQuarto) references quartos(idQuarto),
    checkin datetime not null,
    checkout datetime not null
);

describe quartos;

insert into reservas (idPedido, idQuarto, checkin, checkout) values (1, 1, "2023-11-02 14:00:00", "2023-11-05 12:00:00");
insert into reservas (idPedido, idQuarto, checkin, checkout) values (1, 5, "2023-11-02 14:00:00", "2023-11-05 12:00:00");
insert into reservas (idPedido, idQuarto, checkin, checkout) values (2, 2, "2023-10-17 14:00:00", "2023-10-23 12:00:00");

select * from reservas;

select nomeCompleto, cpf, email, pedido.idPedido, dataPedido, tipoQuarto, nome, andar, numeroQuarto, preco, checkin, checkout
from clientes inner join pedido on clientes.idCliente = pedido.idCliente
inner join reservas on reservas.idPedido = pedido.idPedido
inner join quartos on reservas.idQuarto = quartos.idQuarto;

/*Soma total do pedido feito pelo cliente */
select sum(quartos.preco) as Total from reservas inner join quartos on reservas.idQuarto = quartos.idQuarto where idPedido = 1;

/* Buscar o nome do cliente, andar, número do quarto e checkout somente daqueles
cuja data do checkout já passou ou é igual à data do sistema */ 
select nomeCompleto, andar, numeroQuarto, checkout
from clientes inner join pedido on clientes.idCliente = pedido.idCliente
inner join reservas on reservas.idPedido = pedido.idPedido
inner join quartos on reservas.idQuarto = quartos.idQuarto where checkout <= current_timestamp();

select * from quartos;

/* Atualizar a disponibilidade do quarto somente daqueles cuja data do checkout já passou ou é igual à data do sistema */
update reservas inner join quartos on reservas.idQuarto = quartos.idQuarto
set quartos.disponibilidade = "sim" where reservas.checkout < current_timestamp();

/* Buscar o nome do cliente, andar, número do quarto, checkout (com data formatada em 99/99/9999) e
o cálculo de quantos dias faltam para a reserva do cliente encerrar (dias restantes = data do checkout - data de hoje) */
select nomeCompleto, andar, numeroQuarto, date_format(checkout, '%d/%m/%Y') as checkout,
datediff(checkout, curdate()) as dias_restantes from clientes inner join pedido 
on clientes.idCliente = pedido.idCliente inner join reservas on reservas.idPedido = pedido.idPedido
inner join quartos on reservas.idQuarto = quartos.idQuarto where checkout > current_timestamp();



