USE MASTER
CREATE DATABASE ExeBombs_3

USE ExeBombs_3

CREATE TABLE tblCliente(
	idCliente INT NOT NULL PRIMARY KEY
)


CREATE INDEX XCliente ON tblCliente(
	idCliente
)

CREATE TABLE tblVeiculo(
	idVeiculo INT NOT NULL PRIMARY KEY,
	idCliente INT FOREIGN KEY
	REFERENCES tblCliente (idCliente)
)


DROP INDEX XVeiculo ON tblVeiculo
CREATE INDEX XVeiculo ON tblVeiculo(
	idVeiculo,
	idCliente
)

CREATE TABLE tblPedido(
	idPedido INT NOT NULL PRIMARY KEY,
	idCliente INT FOREIGN KEY
	REFERENCES tblCliente (idCliente)
)

CREATE INDEX XPedido ON tblPedido(
	idPedido,
	idCliente
)

CREATE TABLE tblProduto(
	idProduto INT PRIMARY KEY
)



CREATE INDEX XProduto ON tblPedido(
	idPedido
)


CREATE TABLE tblDetalhePedido(
	idCliente INT FOREIGN KEY
	REFERENCES tblCliente (idCliente),
	idPedido INT FOREIGN KEY
	REFERENCES tblPedido (idPedido),
	idProduto INT FOREIGN KEY
	REFERENCES tblProduto (idProduto)
)

CREATE INDEX XDetalhePedido ON tblDetalhePedido(
	idCliente, idPedido, idProduto
)