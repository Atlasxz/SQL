CREATE DATABASE Detran

Use Detran

CREATE TABLE tblProp(
	CPF int PRIMARY KEY NOT NULL,
	nome VARCHAR(50),
	endereco VARCHAR(150),

)

CREATE TABLE tblModel(
	id_model int PRIMARY KEY NOT NULL,
	descricao VARCHAR(80)
)

CREATE TABLE tblCategoria(
	id_categoria int PRIMARY KEY NOT NULL,
	descricao VARCHAR(80)
)

CREATE TABLE tblVeiculo(
	placa CHAR(8) PRIMARY KEY NOT NULL,
	idModel int FOREIGN KEY
	REFERENCES tblModel(id_model),
	idCategoria int FOREIGN KEY
	REFERENCES tblCategoria(id_categoria)
)

CREATE TABLE tblLocal(
	id int PRIMARY KEY NOT NULL,
	coordGeo VARCHAR (80)
)

CREATE TABLE tblAgente(
	matricula int PRIMARY KEY NOT NULL,
	nome VARCHAR(60),
	dataContrac DATE,
	tempServico int	
)

CREATE TABLE tblTipo_Infracao(
	idTipo_Infracao int PRIMARY KEY NOT NULL,
	descricao VARCHAR(80)
)

CREATE TABLE tblMulta(
	placa CHAR(8) FOREIGN KEY 
	REFERENCES tblVeiculo (placa),
	idlocal int FOREIGN KEY 
	REFERENCES tblLocal (id),
	id_infracao int FOREIGN KEY 
	REFERENCES tblTipo_Infracao (idTipo_Infracao)



)