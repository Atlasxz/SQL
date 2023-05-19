CREATE DATABASE dbProjeto
USE dbProjeto
CREATE TABLE Empregado(
	CodEmpregado int NOT NULL PRIMARY KEY,
	NomeInicial VARCHAR(20) NOT NULL,
	NomeInt CHAR(1) NULL,
	NomeFin VARCHAR(20) NULL,
	DataNascn DATETIME NULL,
	Endereco VARCHAR(60) NULL,
	Sexo CHAR(1) NULL,
	Salario MONEY NULL
)


CREATE TABLE Dependente(
	CodDependente INT NOT NULL PRIMARY KEY,
	CodEmpregado INT NOT NULL FOREIGN KEY
	REFERENCES Empregado (CodEmpregado)
)

CREATE TABLE Cidade(
	CodCidade INT NOT NULL PRIMARY KEY,
	NomeCidade VARCHAR(60) NOT NULL
)

CREATE TABLE Departamento(
	CodDepartamento INT NOT NULL PRIMARY KEY,
	NomeDepartamento VARCHAR(60) NOT NULL,
	DataInicialGer DATE NOT NULL,
	CodCidade INT NOT NULL FOREIGN KEY
	REFERENCES Cidade (CodCidade)
)

CREATE TABLE PROJETO(
	CodProjeto INT NOT NULL PRIMARY KEY,
	NomeProjeto VARCHAR(60) NOT NULL,
	CodDepartamento INT NOT NULL FOREIGN KEY
	REFERENCES Departamento (CodDepartamento)
)

CREATE TABLE EmpregadoProjeto(
	CodEmpregado INT NULL FOREIGN KEY
	REFERENCES Empregado (CodEmpregado),
	CodProjeto INT NOT NULL FOREIGN KEY
	REFERENCES Projeto (CodProjeto),
	Horas INT NOT NULL
)

-- 1
INSERT Cidade (CodCidade, NomeCidade)
VALUES(1, 'Campo Grande'),
	(2,'Dourados'),
	(3,'Corumbá'),
	(4,'Três Lagoas'),
	(5,'Ponta Porã'),
	(6,'Rio Verde'),
	(7,'Porto Murtinho'),
	(8,'Bonito'),
	(9,'Paranaíba')

-- 2
UPDATE Cidade SET NomeCidade = 'Cassilândia' 
WHERE CodCidade = 9

-- 3 Departamento, Projeto, EmpregadoProjeto, Dependente 4 reg

INSERT Departamento VALUES(
	1, 'ABC Shops', '15-04-2006', 1
),(
	2, 'Ricardo Eletro', '24-04-2012', 2

),(
	3, 'Chuveiros PG', '01-05-2010', 5

),(
	4, 'ETESP', '01-05-2019', 9
)

INSERT PROJETO VALUES(
	1, 'Manhathan', 1
),(
	2, 'Cadimus', 2

),(
	3, 'Lazarus', 3

),(
	4, 'Oppenheimer', 4
)

INSERT Empregado VALUES(
	1, 'Nicholas', 'Alencar', 'Silva', '01-05-2006', 'M', '01-01-1980', 'A'
),(
	2, 'Maria', 'Eduarda', 'Santana ', '15-04-2006', 'F', '01-01-1985', 'B'
),(
	3, 'Pedro', 'Henrique', 'Raimundo', '25-01-2006', 'M', '01-01-1979', 'C'
),(
	4, 'Enzo', 'Vieira', 'Yoshida', '25-11-2005', '?', '01-01-1987', 'D'
)	


-- 4
SELECT * FROM Empregado