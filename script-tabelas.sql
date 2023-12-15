-- Arquivo de apoio, caso você queira criar tabelas como as aqui criadas para a API funcionar.
-- Você precisa executar os comandos no banco de dados para criar as tabelas,
-- ter este arquivo aqui não significa que a tabela em seu BD estará como abaixo!

/*
comandos para mysql - banco local - ambiente de desenvolvimento
*/

CREATE DATABASE carianis;

USE carianis;

CREATE TABLE empresa (
	id INT PRIMARY KEY AUTO_INCREMENT,
	razao_social VARCHAR(50),
	cnpj CHAR(14)
);

CREATE TABLE usuario (
	id INT PRIMARY KEY AUTO_INCREMENT,
	nome VARCHAR(50),
	email VARCHAR(50),
	senha VARCHAR(50),
	fk_empresa INT,
	FOREIGN KEY (fk_empresa) REFERENCES empresa(id)
);

CREATE TABLE aviso (
	id INT PRIMARY KEY AUTO_INCREMENT,
	titulo VARCHAR(100),
	descricao VARCHAR(150),
	fk_usuario INT,
	FOREIGN KEY (fk_usuario) REFERENCES usuario(id)
);

create table armazem(
/* em nossa regra de negócio, um armazém tem apenas um sensor */
	id INT PRIMARY KEY AUTO_INCREMENT,
	descricao VARCHAR(300),
	fk_empresa INT,
	FOREIGN KEY (fk_empresa) REFERENCES empresa(id)
);

/* esta tabela deve estar de acordo com o que está em INSERT de sua API do arduino - dat-acqu-ino */

create table medida (
	id INT PRIMARY KEY AUTO_INCREMENT,
	dht11_temperatura DECIMAL,
	momento DATETIME,
	fk_armazem INT,
	FOREIGN KEY (fk_armazem) REFERENCES armazem (id)
);

insert into empresa (razao_social, cnpj) values ('Empresa 1', '00000000000000');
insert into armazem (descricao, fk_empresa) values ('Armazém de Industria Quimica', 1);
insert into medida (id, dht11_temperatura, momento, fk_armazem) values
	(1, 25,'2023-12-15', 1),
    (2, 20, '2023-12-12', 1),
    (3, 22, '2023-12-10', 1),
    (4, 24, '2023-12-09', 1),
    (5, 21, '2023-12-07', 1);

