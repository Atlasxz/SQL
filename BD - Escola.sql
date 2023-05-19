CREATE DATABASE dbescola
use dbescola;

CREATE TABLE Alocacao(
Cod_Turma NUMERIC(6) PRIMARY KEY,
Nome_Sala CHAR(10),
Dia_Aloca DATE, 
Inicio TIME,
Fim TIME
)

CREATE TABLE Alunos(
Cod_Aluno NUMERIC(6) PRIMARY KEY,
Nome_Aluno CHAR(30),
Endereco CHAR(50),
Bairro CHAR(20),
Cidade CHAR(20),
CEP NUMERIC(8),
Telefone CHAR(20),
e_mail_Aluno CHAR(50)
)

CREATE TABLE Professor(
Cod_Professor NUMERIC(6) PRIMARY KEY,
Nome_Professor CHAR(30),
Area CHAR(4),
Ramal NUMERIC(4),
e_mail_Professor CHAR(50)
)

CREATE TABLE Contrato(
Cod_Contrato NUMERIC(6) PRIMARY KEY,
Nome_Firma CHAR(50),
Contato CHAR(30),
Telefone_Firma CHAR(20),
Fax_Firma CHAR(20)
)

CREATE TABLE Curso (
Cod_Curso NUMERIC(6) PRIMARY KEY,
Nome_curso CHAR(50),
Carga_horaria NUMERIC(3),
Maximo_Alunos NUMERIC(2),
Minimo_Alunos NUMERIC(2),
Preco_Turma DEC (17,2),
Preco_Aluno DEC(17,2),
Equip_Necessario CHAR(80)
)

CREATE TABLE Turma(
Cod_Turma NUMERIC(6) PRIMARY KEY,
Termino_inscricoes DATE,
Inicio_Aulas DATE,
Fim_Aulas DATE,
Inscritos NUMERIC(3),
Tipo_Turma CHAR(1),
Valor_Faturado DEC(17,2),
Valor_Turma_Fechada DEC(17,2),
Carga_Horaria_Ministrada NUMERIC(3),
Cod_Curso NUMERIC(6) FOREIGN KEY 
REFERENCES Curso (Cod_Curso),
Cod_Professor NUMERIC(6) FOREIGN KEY 
REFERENCES Professor (Cod_Professor)
)

CREATE TABLE Inscricao(
Cod_Turma NUMERIC(6) FOREIGN KEY
REFERENCES Alocacao (Cod_Turma),
Cod_Alunos NUMERIC(6) FOREIGN KEY 
REFERENCES Alunos (Cod_Aluno),
Cod_Contrato NUMERIC(6) FOREIGN KEY 
REFERENCES Contrato (Cod_Contrato),
Valor_Cobrado DEC(17,2),
Conceito CHAR(4)
)

CREATE TABLE Laboratorio(
Nome_Sala CHAR(10) PRIMARY KEY,
Capacidade NUMERIC(3),
Equip_Disponivel CHAR(80)
)

CREATE TABLE Ministra(
Cod_Professor NUMERIC(6) FOREIGN KEY 
REFERENCES Professor (Cod_Professor),
Cod_Curso NUMERIC(6) FOREIGN KEY 
REFERENCES Curso (Cod_Curso)
)

INSERT Alocacao (Cod_Turma, Nome_Sala, Dia_Aloca, Inicio, Fim)
VALUES(
	000001,
	'2T',
	'2023-03-04',
	'14:30',
	'16:30'
),(
	000002,
	'24T',
	'2023-03-15',
	'14:30',
	'16:30'

),(
	000003,
	'22T',
	'2023-03-20',
	'14:30',
	'16:30'
),(
	000004,
	'2H',
	'2023-03-22',
	'14:30',
	'16:30'
),(
	000005,
	'21T',
	'2023-03-24',
	'14:30',
	'16:30'
)

SELECT * FROM Alocacao

INSERT Alunos (Cod_Aluno, Nome_Aluno, Endereco, Bairro, Cidade, CEP, Telefone,e_mail_Aluno)
VALUES 
		(	
			000010,
			'Maria Eduarda Santana',
			'Rua nova palmeira, 615',
			'cangaiba',
			'São Paulo',
			'03021010',
			'11990072618',
			'aluno1@gmail.com'),
		(
			000011,
			'Nicholas de Alencar',
			'Rua Saturnino Pereira, 459',
			'Bairro B',
			'Guaianases',
			'00000002',
			'999990002',
			'aluno2@gmail.com'),
		(
			000012,
			'Lais Joo Un Lee',
			'Rua Hiroshima, 33',
			'Nagasaki',
			'Japão',
			'00000003',
			'999990003',
			'aluno3@gmail.com'),
		(
			000013,
			'Caio Henrique Dumont',
			'Rua Vila Sonia, 14',
			'Tijuca',
			'Rio de janeiro',
			'00000004',
			'999990004',
			'aluno4@gmail.com'),
		(
			000014,
			'Isabelly Nascimento',
			'Rua LPC, 92',
			'Tijuca',
			'Rio de Janeiro',
			'00000005',
			'999990005',
			'aluno5@gmail.com'
		)

INSERT Professor (Cod_Professor,Nome_Professor, Area,Ramal, e_mail_Professor) 
VALUES
	(000101, 'Luiz Ricardo', 'BD', 0001, 'ricardinhoBancodeDados@gmail.com'),
	(000102, 'Beatriz', 'Ing', 0002, 'beaTrizenglish@gmail.com'),
	(000103, 'Matheus', 'Quim', 0003, 'matheuzinhoQuimicas@gmail.com'),
	(000104, 'Betão', 'DS', 0004, 'betaozaoLogicas@gmail.com'),
	(000105, 'Rubens', 'PW', 0005, 'rubenzinhoProgramas@gmail.com')

INSERT Contrato (Cod_Contrato,Nome_Firma, Contato, Telefone_Firma,Fax_Firma)
VALUES 
	(001001, 'FIRMA A', 'Maria Elisabeth', '2222-8888', '0800-4448'),
	(001002,'FIRMA B', 'Sam', '2222-8888', '0800-4448'),
	(001003,'FIRMA C', 'Charlie', '2222-8888', '0800-4448'),
	(001004,'FIRMA D', 'Patrick', '2222-8888', '0800-4448'),
	(001005,'FIRMA E', 'Bob Marley', '2222-8888', '0800-4448'),
	(001006,'FIRMA F', 'Joe Goldberg', '2222-8888', '0800-4448'),
	(001007,'FIRMA G', 'Love Quinn', '2222-8888', '0800-4448')



INSERT Curso(Cod_Curso, Nome_curso, Carga_horaria, Maximo_Alunos,Minimo_Alunos,Preco_Turma, Preco_Aluno,Equip_Necessario)
VALUES
	(111112, 'Desenvolvimento de Sistemas', 740, 40, 30, 300000 , 1000 ,'Computadores'),
	(111113, 'Meio Ambiente', 800, 40, 30, 400, 40, 'Maconha'),
	(111114, 'Administração', 730, 40, 30, 300, 20, 'Paciencia'),
	(111115, 'Edificações',780, 40, 30, 200, 10, 'Caderneta'),
	(111116, 'Eletrônica', 750, 40, 30, 100, 50, 'Fio')

INSERT Inscricao(Cod_Turma, Cod_Alunos, Cod_Contrato, Valor_Cobrado, Conceito)
VALUES
	(1, 000010, 001001, 7.00, 'Bom'),
	(2, 000011, 001002, 8.00, 'Mal'),
	(3, 000012, 001003, 9.00, 'Bom'),
	(4, 000013, 001004, 10.0, 'Mal'),
	(5, 000014, 001005, 11.0, 'Bom')



INSERT Laboratorio(Nome_Sala, Capacidade, Equip_Disponivel) 
VALUES
	('2T', 40, 'Computadores'),
	('1T', 10, 'Papel'),
	('24T', 40, 'Lousa'),
	('2H', 40, 'Notebooks'),
	('21T', 40, 'Mouse')

INSERT Ministra (Cod_Professor, Cod_Curso)
 VALUES
	(000101, 111112),
	(000102, 111113),
	(000103, 111114),
	(000104, 111115),
	(000105, 111116)

INSERT Turma (Cod_Turma, Cod_Curso, Cod_Professor, Termino_inscricoes, Inicio_Aulas, Fim_Aulas, Inscritos, Tipo_Turma, Valor_Faturado, Valor_Turma_Fechada, Carga_Horaria_Ministrada) 
VALUES
	(222221,111112,1,'14-12-2024','01-02-2024', '20-12-2024', 500, 'A', 20000, 67900000, 800),
	(222222,111113,2,'14-12-2024','01-02-2024', '20-12-2024', 400, 'B', 20000, 34500000, 800),
	(222223,111114,3,'14-12-2024','01-02-2024', '20-12-2024', 300, 'C', 20000, 62600000, 800),
	(222224,111115,4,'14-12-2024','01-02-2024', '20-12-2024', 200, 'D', 20000, 74800000, 800),
	(222225,111116,5,'14-12-2024','01-02-2024', '20-12-2024', 100, 'D', 20000, 94500000, 800)

-- 1
SELECT * FROM Alunos

-- 2
SELECT Nome_Curso, Preco_Aluno FROM Curso

--3
SELECT Nome_Curso, (Preco_Turma/Minimo_Alunos) FROM Curso

--4 
SELECT Valor_Cobrado FROM Inscricao

-- 5
SELECT Nome_Aluno, Bairro, Cidade FROM Alunos ORDER BY (Bairro) 

-- 6
SELECT Nome_Aluno, Bairro, Cidade FROM Alunos ORDER BY (Cidade),(Bairro) 

--7
SELECT DISTINCT Bairro FROM Alunos

-- 8
SELECT Nome_Aluno FROM Alunos WHERE (Bairro = 'Tijuca') ORDER BY (Nome_Aluno) 

--9
SELECT Nome_curso, Preco_Turma From Curso ORDER BY (Preco_Turma) DESC

--10

SELECT Valor_Cobrado FROM Inscricao WHERE(Valor_Cobrado > 7.00 AND Valor_Cobrado < 10.0) 

-- 11 
INSERT Professor (Cod_Professor,Nome_Professor, Area,Ramal, e_mail_Professor) 
VALUES
	(000106, 'Nicholas Alencar', 'EXTN', 0000, 'alencar.nicholas@gmail.com')

