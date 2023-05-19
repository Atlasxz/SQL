
-- criar banco de dados
CREATE DATABASE aula01;

-- definir que vc est� entrando naquele banco, n�o vai direto igual o postgreSQL
USE aula01;

-- Processo de apagar DB,


	--volta para o database master
	USE master 
	--apagar o database
	DROP DATABASE aula01 

CREATE TABLE Tipo(
	Codigo int not null Primary Key,
	Nome Varchar(30) not null
)

CREATE TABLE totalfaturado(
	primary key(mes,ano),
	mes int not null,
	ano int,
	valor dec(12,2)
)

CREATE TABLE secao(
	codigo int not null primary key,
	descricao varchar(20) not null,
	coddepto int foreign key 
	references departamento (codigo) 
	-- Para corrigir o erro, � n�cess�rio criar a tabela Departamento para fazer a rela��o corretamente (al�m de que o campo "codigo" deve existir)
)

CREATE TABLE animal(
	codigo int not null primary key,
	nome varchar(40) not null,
	sexo char(1) check(upper (sexo) = 'm' or upper(sexo) = 'f')
)

-- Nova regra, colocar tbl como prefixo das tabelas

CREATE TABLE tblFuncionario(
	codfunc int identity,
	nomefunc varchar(50),
	rgfunc char(15),
	sexofunc char default 'f',
	salfunc dec(10,2) default 240.00,
	constraint pk_func primary key(codfunc),
	constraint uq_func unique(rgfunc),
	constraint ck_func1 check(sexofunc in ('f','m')),
	constraint ck_func2 check(salfunc > 0)
)
















-- Exerc�cio 1

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


















-- Exerc�cio 2

USE master
--DROP DATABASE ExeBombs_2

CREATE DATABASE ExeBombs_2
USE ExeBombs_2

CREATE TABLE tblEstado(
	SiglaEst VARCHAR(2) NOT NULL Primary Key,
	Descri��o VARCHAR(50)
)

CREATE INDEX XEstados ON tblEstado (
	SiglaEst
)

--DROP TABLE tblEstado

CREATE TABLE tblCidade(
	idCidade int NOT NULL Primary Key,
	SiglaEst VARCHAR(2) Foreign Key
	References tblEstado (SiglaEst),
	Descri��o VARCHAR(50)
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
	Descri��o VARCHAR(50)
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
	Descri��o VARCHAR(50)
)

CREATE INDEX XFaixaImovel ON tblFaixaImovel(
	idFaixa
)





















-- Exerc�cio 3

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










--Revis�o

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

--------------------------------------------------------------------

/*
Constraints

	PK, FK
	Check (Regra de Valida��o)
	Unique(
		Exemplo:
			CPF NUmeric(11) UNIQUE
			-- O sistema avisa caso tenha repeti��o
			-- � necess�rio try-catch por causa dos poss�veis erros
	)
	NULL
	Default

Insert's

	Insert - Insere Valores em uma tabela

	Insert Declarativo - Os campos precisam ser declarados

		Insert Aluno(
		ID, Nome, Endere�o) Values
		(1,'Lucas','Av. Tiradentes)

	Insert Posicional - N�o � preciso declarar quais campos receber�o valores

		Insert into Alunos VALUES (2,'Leonardo, 'Av. Tiradentes',616)
		Insert tblFuncionario VALUES (1,'Luiz', 615.00)


*/

CREATE DATABASE Exemplos
USE Exemplos

CREATE TABLE Cliente(
	cod_cli int,
	nome_cli char(30)
)

INSERT Cliente(	cod_cli, nome_cli) 
VALUES (1, 'Ana de Souza')

INSERT Cliente(	cod_cli, nome_cli) 
VALUES (2, 'Mariana de Souza')

INSERT Cliente(	cod_cli, nome_cli) 
VALUES (3, 'Fabiana de Souza')

INSERT Cliente VALUES (4, 'Rosana de Souza')
INSERT Cliente VALUES (5, 'Adriana de Souza')

SELECT cod_cli as ID, 
nome_cli as Nome 
FROM Cliente

/*

COMANDO - SELECT

Select lista de atributos (* = TUDO)
[INTO nova tabela]
FROM Tabela
[Where filtro]
[GROUP BY Campo]
[Having filtro]
[ORDER By Classifica��o (ASC || DESC]]

Exemplos de Select's

- select CodCidade, NomeCidade from tblCidade

- select * from tblCidade

- select * from tblCidade

	where cod_cidade = 2 or cod_cidade = 3

Filtros (Where)

- Serve para impor condi��es (filtros) que queremos sobre os dados pesquisados
- N�o � necess�rio retornar as colunas filtradas
- As condi��es dever�o ser estabelecidas com o uso de operadores
- Podem ser utilizados m�ltiplos filtros usando os operadores "And" e "Or"
	Select ([colunas]) from [tabela] where ([Condi��es])

Exemplos:
	SELECT NomeCidade FROM Cidade
		Where CodCidade > 4 AND CodCidade <8

		"Valores pegos - 5, 6 e 7"
*/


/*
	OPERADORES 

	Fun��o	Operador

	Emgual					=
	Nega��o					!
	Maior					>
	Menor					<
	Diferente				<> ou !=
	N�o Maior				!>
	N�o Menor				!<
	Entre					Between ... and ...
	Compara��o especial		LIKE
	Compara��o de lista		in([Lista])


	Operadores In, Betweeen e IS NULL

	In - define uma lista de valores como condi��o

		SELECT * FROM <tabela> WHERE <campo> IN('Bonito','Dourados')

		Forma Negativa
		SELECT * FROM <tabela> WHERE <campo> NOT IN('Bonito','Dourados') 


	BETWEEN - define uma faixa de valores como condi��o - S� vale pra n�mero OBVIAMENTE

			
		SELECT * FROM <tabela> WHERE <campo> BETWEEN 3 AND 6

		Forma Negativa
		SELECT * FROM <tabela> WHERE <campo> NOT BETWEEN 3 AND 6


	IS NULL - idetificam valores nulos dos atributos
		SELECT *FROM <tabela> WHERE <campo> IS NULL

		Forma Negativa
		SELECT *FROM <tabela> WHERE <campo> IS NOT NULL


	EXEMPLOS - LIKE (Usado em compara��o de string)

		- SELECT * FROM empregado WHERE nomeInicial like 'a%' 
			(que comecem com A)

		- SELECT * FROM empregado WHERE nomeInicial like '%ce' 
			(que comecem com CE) 

		- SELECT * FROM empregado WHERE nomeInicial like '_o___' 
			(que uma string tem 5 posi��es, e APENAS A segunda posi��o � conhecida) 

		- SELECT nome FROM empregado where nome like '[D-F]%' 
			(que comece com as letras entre D e F [D, E, F])

		- SELECT nome FROM empregado where nome like '[^A-C]% 
			(que N�O comece com as letras de X intervalo - nesse caso A, B e C)

		- SELECT nome FROM empregado where nome like '[A-C, F-G]% 
			(que s� pega os nomes que comecem com A-C e F-G)


		OPERADOR LIKE - Compara��o parcial de caracteres

			- % Substitui v�rios caracteres
			- _ Substitui um unico caracter
			- [a-f] - qualquer caractere isolado no intervalo a-f
			- [^a-f] - qualquer caracter isolado que N�O esteja dentro do intervalo a-f


		UPDATE - Atualiza o conte�do de um campo

			Update alunos SET nome_turma = '3� Info A'
				WHERE codCurso = 1

			Update funcionarios SET salario = salario * 1.1
				Where depto between 1 and 5

*/

/*
	ALTER TABLE - Altera a estrutura da tabela:
		
		- Adionando um campo 
			Alter Table 
			Add Column <tbl> <TIPO>

		- Adicionando uma constraint (Regra de Integridade)
			Alter Table <tbl>
			Add Constraint <campo>
			(<campo que recebe constraint - destinat�rio>) 
			REFERENCES <tbl> (<campo referencial>)

			ALTER TABLE <tbl>
			ADD CONSTRAINT <novo nome> PRIMARY KEY (<campo antigo>)

			ALTER TABLE <tbl> ADD <campo novo> <tipo> FOREIGN KEY REFERENCES <tblReferencial> <Campo Referencial<

		Para esse c�digo funcionar, o campo que recebe a constraint precisa ser pr�-existente

		- Alterando tamanho de um campo
			Alter Table <tbl> 
			Alter Column <nome novo> <tipo novo de campo>
			
		- Removendo (N�o funciona com chave prim�ria)
			Alter Table  <tbl> Drop Column <campo>
   
	Recomenda��es <3 - Ordem de cria��o
		- Criar tabelas sem PK, ou FK
		- Colocar as contraints
		- Criar os indices
		- E ent�o insert
*/

CREATE DATABASE testes
USE testes

CREATE TABLE tblNome(
	id int NOT NULL,
	nome varchar(50),
	sexo char(1)
)




ALTER TABLE tblNome 
ADD CONSTRAINT id_nome PRIMARY KEY (id)

/*

	
*/

