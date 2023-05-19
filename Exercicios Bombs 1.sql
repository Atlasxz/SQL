CREATE DATABASE ExeBombs_1;
--DROP DATABASE ExeBombs_1
Use master
USE ExeBombs_1;

-- Primeiro Exercicio

CREATE TABLE tblGenero(
	idGenero int primary key
)

--DROP INDEX XVeiculo ON tblVeiculo

CREATE INDEX XGenero on tblGenero(
	idGenero
)

CREATE TABLE tblCategoria(
	idCategoria int primary key
)

CREATE INDEX XCategoria on tblCategoria(
	idCategoria
)

CREATE TABLE tblFilme(
	idFilme int Primary Key,
	genero  int foreign key
	references tblGenero (idGenero),
	categoria int foreign key 
	references tblCategoria (idCategoria)
	/*
	coddepto int foreign key 
	references departamento (codigo) 
	*/
)
--DROP INDEX XFilme ON tblFilme

CREATE INDEX XFilme ON tblFilme(
	idFilme,
	genero,
	categoria
)

--DROP TABLE tblFilme
--DROP TABLE tblGenero

select * FROM tblFilme