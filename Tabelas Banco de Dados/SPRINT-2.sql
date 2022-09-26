
create database EMPRESA;
use EMPRESA;

-- CRIANDO A TABELA DE CADASTRO
create table CLIENTE(
idCliente int primary key auto_increment,
nome varchar(45),
email varchar(45),
senha varchar(45),
constraint chkemail check (email like '%@%')
)auto_increment=100;

select * from CLIENTE;
select * from PLANTAÇAO;
select * from ARDUINO;

-- INSERINDO DADOS
insert into CLIENTE (nome, email, senha) values
('Isaias Lopes','Isaias.resende@sptech.school','isaias34'),
('Lucas Bonfim','lucas.bsilva@sptech.school','lucas123'),
('Yago Maragno','yago.maragno@sptech.school','magma1'),
('Jefferson Araujo','jefferson.araujo@sptech.school','jeff13');

-- CRIANDO TABELA PLANTAÇÃO
create table PLANTAÇAO(
idPlantaçao int auto_increment,
especie varchar(45),
estado char(2),
cidade varchar(45),
medida varchar(45),
tamanho int,
fkCliente int,
foreign key (fkCliente) references CLIENTE (idCliente),
primary key (idPlantaçao,fkCliente),
constraint chkmedida check (medida = 'm²')
)auto_increment=10;

-- INSERINDO DADOS 
insert into PLANTAÇAO values
(null,'Arábica','MG','Carmo de Minas','m²',2, 100),
(null,'Robusta','MT','Juína','m²',3, 101),
(null,'Eugenioides','SP','Joanópolis','m²',10, 102),
(null,'Arábica','MS','Eldorado','m²',1, 103),
(null,'Robusta','SP','Campinas','m²',5, 101),
(null,'Eugenioides','SP','Ribeirão Preto','m²',4, 102);

-- CRIANDO TABELA ARDUINO
create table ARDUINO(
idControle int ,
temperatura decimal(4,2),
umidade varchar(3),
momento datetime default current_timestamp,
fkPlantaçao int auto_increment,
foreign key (fkPlantaçao) references PLANTAÇAO (idPlantaçao),
primary key (idControle,fkPlantaçao)
);


-- INSERINDO DADOS
insert into ARDUINO (idControle, temperatura, umidade, fkPlantaçao)values
(1, '19.20', '10%', 10),
(2, 20.15, '10%',11),
(3, 21.45, '11%', 12),
(4, 18.00, '12%', 13),
(5, 22.00, '10%', 14),
(6, 18.55, '11%', 15);

select * from CLIENTE join PLANTAÇAO
on idCliente = fkCliente;

select * from CLIENTE join PLANTAÇAO
on idCliente = fkCliente
join ARDUINO on idPlantaçao = fkPlantaçao;

