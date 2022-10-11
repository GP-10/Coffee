
create database HEALT_TECH;

use HEALT_TECH;

-- CRIANDO A TABELA DE CADASTRO
create table CLIENTE(
idCliente int primary key auto_increment,
nome varchar(45),
email varchar(45),
senha varchar(45),
constraint chkemail check (email like '%@%')
)auto_increment=100;


-- INSERINDO DADOS
insert into CLIENTE (nome, email, senha) values
('Isaias Lopes','Isaias.resende@sptech.school','isaias34'),
('Lucas Bonfim','lucas.bsilva@sptech.school','lucas123'),
('Yago Maragno','yago.maragno@sptech.school','magma1'),
('Jefferson Araujo','jefferson.araujo@sptech.school','jeff13');

-- CRIANDO TABELA PLANTAÇÃO
create table PLANTACAO(
idPlantacao int auto_increment,
Tipo varchar(45),
UF char(2),
cidade varchar(45),
Tamanho_m² decimal(4,1),
fkCliente int,
foreign key (fkCliente) references CLIENTE (idCliente),
primary key (idPlantacao,fkCliente)
)auto_increment=10;

-- INSERINDO DADOS 
insert into PLANTACAO values
(null,'Arábica','MG','Carmo de Minas',18.7, 100),
(null,'Robusta','MT','Juína',15, 101),
(null,'Eugenioides','SP','Joanópolis',10, 102),
(null,'Arábica','MS','Eldorado',10.5, 103),
(null,'Robusta','SP','Campinas',5, 101),
(null,'Eugenioides','SP','Ribeirão Preto',12.2, 102);

-- CRIANDO TABELA SENSOR
create table SENSOR(
idSensor int primary key auto_increment,
Tipo varchar (10),
Setor varchar (45),
fkPlantacao int,
foreign key (fkPlantacao) references PLANTACAO (idPlantacao)
)auto_increment=500;


-- INSERINDO DADOS
insert into SENSOR values
(null, 'DHT-11','Sul',10),
(null,'DHT-11','Leste',11),
(null, 'DHT-11','Oeste', 12),
(null,'DHT-11' ,'Sul', 13),
(null,'DHT-11' ,'Leste', 14),
(null,'DHT-11' ,'Norte', 15);

-- CRIANDO TABELA DADOS
create table DADOS(
idDados int auto_increment,
Temperatura decimal (4,2),
Umidade char (6),
DatasHoras datetime default CURRENT_TIMESTAMP,
fkSensor int,
foreign key (fkSensor) references SENSOR (idSensor),
primary key (idDados,fkSensor)
);

insert into DADOS (Temperatura, Umidade, fkSensor) values
	(21.5, '10%', 500),
	(20.0, '50%', 501),
	(22.0, '80%', 500),
	(19.5, '20%', 500);
    
select * from CLIENTE;
select * from PLANTACAO;
select * from SENSOR;
select * from dados;
    
select * from CLIENTE join PLANTAÇAO
on idCliente = fkCliente;

select * from CLIENTE join PLANTACAO
on idCliente = fkCliente
join SENSOR on idPlantacao = fkPlantacao
join DADOS on idSensor = fkSensor;

