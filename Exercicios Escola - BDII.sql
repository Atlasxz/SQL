-- Parte A
USE master
DROP DATABASE Exe_DBII
CREATE DATABASE Exe_DBII
USE Exe_DBII

CREATE TABLE ALOCACAO(
	cod_turma numeric(6) IDENTITY (1,1) PRIMARY KEY,
	nome_sala char(10),
	dia DATE,
	inicio TIME,
	fim TIME
)

CREATE TABLE ALUNO(
	cod_aluno numeric(6) IDENTITY (1,1) PRIMARY KEY,
	nome_aluno char(30),
	endereco char(50),
	bairro char(20),
	cidade char(20),
	cep numeric(8),
	telefone char(20),
	e_mail_aluno char(50)
)

CREATE TABLE CONTRATO(
	cod_contrato numeric(6) IDENTITY (1,1) PRIMARY KEY,
	nome_firma char(50),
	contato char(30),
	telefone_firma char(20),
	fax_firma char(20)
)

CREATE TABLE CURSO (
	cod_curso numeric(6) IDENTITY (1,1) PRIMARY KEY,
	nome_curso char(50),
	carga_horaria numeric(3),
	maximo_alunos numeric(2),
	minimo_alunos numeric(2),
	preco_turma dec(17,2),
	preco_aluno dec(17,2),
	equip_necessario char(80)
)

CREATE TABLE INSCRICAO(
	cod_turma numeric(6) FOREIGN KEY 
	REFERENCES ALOCACAO (cod_turma),
	cod_aluno numeric(6) FOREIGN KEY
	REFERENCES ALUNO (cod_aluno),
	valor_cobrado dec(17,2),
	cod_contrato numeric(6) FOREIGN KEY
	REFERENCES CONTRATO (cod_contrato),
	conceito char(4)
)

CREATE TABLE LABORATORIO(
	nome_sala char(10) PRIMARY KEY,
	capacidade numeric(3),
	equip_disponivel char(80)
)

CREATE TABLE PROFESSOR(
	cod_professor numeric(6) IDENTITY (1,1) PRIMARY KEY,
	nome_professor char(30),
	area char(4),
	ramal numeric(4),
	e_mail_professor char(50)
)

CREATE TABLE MINISTRA(
	cod_professor numeric (6) FOREIGN KEY
	REFERENCES PROFESSOR (cod_professor),
	cod_curso  numeric(6) FOREIGN KEY
	REFERENCES CURSO (cod_curso)
)

CREATE TABLE TURMA(
	cod_turma numeric(6) IDENTITY (1,1) PRIMARY KEY,
	cod_curso numeric(6) FOREIGN KEY
	REFERENCES CURSO (cod_curso),
	cod_professor numeric(6) FOREIGN KEY
	REFERENCES PROFESSOR (cod_professor),
	termino_inscricoes DATE,
	inicio_aulas DATE,
	fim_aulas DATE,
	inscritos numeric(3),
	tipo_turma char(1),
	valor_faturado dec(17,2),
	valor_turma_fechada dec(17,2),
	carga_horaria_ministrada numeric(3)	
)

-- PARTE B

INSERT ALOCACAO (nome_sala, dia, inicio, fim)
VALUES(
		'13T',
		'2023-02-10',
		'14:40',
		'16:40'
	),(
		'16T',
		'2023-02-16',
		'10:20',
		'12:00'
	),(
		'02H',
		'2023-02-18',
		'07:30',
		'09:10'
	),(
		'26M',
		'2023-02-24',
		'13:00',
		'14:40'	
	),(
		'24T',
		'2023-03-10',
		'15:50',
		'17:30'
)

SELECT * FROM ALOCACAO

INSERT ALUNO (nome_aluno, endereco,	bairro, cidade,	cep, telefone, e_mail_aluno)
VALUES 
		(
			'Nicholas de Alencar',
			'Rua AAABBB, 88',
			'Guaianases',
			'São Paulo',
			'00000001',
			'999990001',
			'aluno1@gmail.com'),
		(
			'Pedro Henrique Raimundo',
			'Rua ABC, 77',
			'Bairro B',
			'Arujá',
			'00000002',
			'999990002',
			'aluno2@gmail.com'),
		(
			'Enzo Vieira',
			'Rua ADS, 33',
			'Jabaquara',
			'São Paulo',
			'00000003',
			'999990003',
			'aluno3@gmail.com'),
		(
			'Alvaro Fernandes',
			'Rua XXX, 14',
			'Tijuca',
			'Rio de Janeiro',
			'00000004',
			'999990004',
			'aluno4@gmail.com'),
		(
			'Evelyn Santos',
			'Rua LPC, 92',
			'Tijuca',
			'Rio de Janeiro',
			'00000005',
			'999990005',
			'aluno5@gmail.com'
		)

SELECT * FROM ALUNO

INSERT CONTRATO (nome_firma, contato, telefone_firma, fax_firma)
VALUES 
	('FIRMA A', 'João Silva', '2222-8888', '0800-4448'), 
	('FIRMA B', 'Maria Santos', '3333-9999', '0800-5153'), 
	('FIRMA C', 'Pedro Souza', '4444-7777', '0800-1234'), 
	('FIRMA D', 'Luciana Oliveira', '5555-2222', '0800-5367'), 
	('FIRMA E', 'Carlos Gomes', '6666-5555', '0800-5678'), 
	('FIRMA F', 'Aline Costa', '7777-3333', '0800-6477'), 
	('FIRMA G', 'Marcelo Mendes', '8888-4444', '0800-2468');

SELECT * FROM CONTRATO	


INSERT CURSO (nome_curso, carga_horaria, maximo_alunos, minimo_alunos, preco_turma, preco_aluno, equip_necessario)
VALUES
	('Desenvolvimento de Sistemas', 740, 40, 30)
	




INSERT INSCRICAO(cod_turma, cod_aluno, valor_cobrado, cod_contrato, conceito)
VALUES
	(1, 1, 3000, 1, 'pog'),
	(2, 2, 4500, 2, 'hype'),
	(1, 1, 3000, 1, 'pog'),
	(2, 2, 4500, 2, 'hype'),
	(

SELECT * FROM CONTRATO
-- Parte B - Exercícios

-- 1
SELECT * FROM ALUNO	

-- 5
SELECT nome_aluno, bairro, cidade FROM ALUNO ORDER BY (bairro) ASC

-- 6
SELECT nome_aluno, bairro, cidade FROM ALUNO ORDER BY (cidade),(bairro) ASC

--7
SELECT bairro FROM ALUNO

-- 8
SELECT nome_aluno FROM ALUNO WHERE (bairro = 'Tijuca') ORDER BY (nome_aluno) ASC
