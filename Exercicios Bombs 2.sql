USE master
--DROP DATABASE ExeBombs_2

CREATE DATABASE ExeBombs_2
USE ExeBombs_2

CREATE TABLE tblEstado(
	SiglaEst VARCHAR(2) NOT NULL Primary Key,
	Descrição VARCHAR(50)
)

CREATE INDEX XEstados ON tblEstado (
	SiglaEst
)

--DROP TABLE tblEstado

CREATE TABLE tblCidade(
	idCidade int NOT NULL Primary Key,
	SiglaEst VARCHAR(2) Foreign Key
	References tblEstado (SiglaEst),
	Descrição VARCHAR(50)
)

CREATE INDEX XCidade On tblCidade(
	idCidade
)

--DROP TABLE tblCidade



CREATE TABLE tblBairro(
	idBairro int NOT NULL Primary Key,
	SiglaEst VARCHAR(2) Foreign Key
	References tblEstado (SiglaEst),
	idCidade int Foreign Key
	References tblCidade (idCidade),
	Descrição VARCHAR(50)
)
--DROP INDEX XBairro ON tblBairro

CREATE INDEX XBairro ON tblBairro(
	idBairro,
	SiglaEst,
	idCidade
)

--DROP TABLE tblBairro



CREATE TABLE tblVendedor(
	idVendedor int Primary Key
)

CREATE INDEX XVendedor On tblVendedor(
	idVendedor
)

--DROP TABLE tblVendedor

CREATE TABLE tblImovel(
	idImovel int NOT NULL Primary Key,
	idVendedor int Foreign Key
	References tblVendedor (idVendedor),
	idBairro int Foreign Key
	References tblBairro (idBairro),
	idCidade int Foreign Key
	References tblCidade (idCidade),
	SiglaEst VARCHAR(2) Foreign Key
	References tblEstado (SiglaEst)

)
--DROP INDEX XImovel ON tblImovel

CREATE INDEX XImovel On tblImovel(
	idImovel,
	idVendedor,
	idBairro,
	idCidade,
	SiglaEst
)

--DROP TABLE tblImovel

CREATE TABLE tblComprador(
	idComprador int NOT NULL Primary Key
)

CREATE INDEX XComprador ON tblComprador(
	idComprador
)

CREATE TABLE tblOferta(
	idComprador int Foreign Key References tblComprador (idComprador),

	idVendedor int Foreign Key
	References tblVendedor (idVendedor),

	idImovel int Foreign Key
	References tblImovel (idImovel),

	idBairro int Foreign Key
	References tblBairro (idBairro),

	idCidade int Foreign Key
	References tblCidade (idCidade),

	SiglaEst VARCHAR(2) Foreign Key
	References tblEstado (SiglaEst)

)
--DROP INDEX XOferta ON tblOferta

CREATE INDEX XOferta ON tblOferta(
	idComprador, idVendedor, idImovel, idBairro, idCidade, SiglaEst
)

CREATE TABLE tblFaixaImovel(
	idFaixa int NOT NULL Primary Key,
	Descrição VARCHAR(50)
)

CREATE INDEX XFaixaImovel ON tblFaixaImovel(
	idFaixa
)