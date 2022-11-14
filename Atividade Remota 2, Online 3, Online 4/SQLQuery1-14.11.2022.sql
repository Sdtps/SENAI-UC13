--DDL  --CRIA A ESTRUTURA

CREATE DATABASE RpgOlineDB

USE RpgOlineDB

CREATE TABLE Usuarios(
	UsuarioID INT PRIMARY KEY IDENTITY
	,Email VARCHAR (100) UNIQUE NOT NULL
	,Senha VARCHAR (255) NOT NULL
)


CREATE TABLE Classes(
	ClasseID INT PRIMARY KEY IDENTITY
	,Nome VARCHAR (50) UNIQUE NOT NULL
	,Descricao VARCHAR (255)
)

CREATE TABLE Personagens(
	PersonagemID INT PRIMARY KEY IDENTITY
	,NomePersonagem VARCHAR (15) UNIQUE NOT NULL
	,UsuarioID INT UNIQUE FOREIGN  KEY REFERENCES Usuarios(UsuarioID)
	,ClasseID INT FOREIGN  KEY REFERENCES Classes(ClasseID)
)

CREATE TABLE Habilidades(
	HabilidadeID INT PRIMARY KEY IDENTITY
	,Nome VARCHAR (100) UNIQUE NOT NULL
)

CREATE TABLE ClasseHabilidade(
	CalsseID INT FOREIGN  KEY REFERENCES Classes(ClasseID)
	,HabilidadeID INT FOREIGN KEY REFERENCES Habilidades(HabilidadeID)
)

ALTER TABLE Personagens
ALTER COLUMN NomePersonagem VARCHAR(100);

--DML - COLOCAR DADOS
INSERT INTO Usuarios VALUES ('DAVID@GMAIL.COM', '123456')
INSERT INTO Usuarios (Email, Senha) VALUES ('DAVIDTP@GMAIL.COM', HASHBYTES('SHA2_512','123456'))
INSERT INTO Classes VALUES ('Inteligente', 'Pessoa com facilidade de aprendizado autodidata')
INSERT INTO Habilidades VALUES ('QI de 3 digitos'), ('Sabedoria extrma'), ('Gosta de ler'), ('Autodidata')
INSERT INTO Personagens (NomePersonagem, UsuarioID, ClasseID) VALUES ('GOHAN',1,1)
INSERT INTO Personagens (NomePersonagem, UsuarioID, ClasseID) VALUES ('KAKAROTO',5,1)
INSERT INTO ClasseHabilidade (CalsseID, HabilidadeID) VALUES (1,4),(1,3),(1,1),(1,2)

UPDATE Usuarios
SET Senha = HASHBYTES('SHA2_512','123456')
WHERE UsuarioID = 1

--DQL - CONCULTAS

SELECT * FROM Usuarios
SELECT * FROM Classes
SELECT * FROM Habilidades
SELECT * FROM Personagens
SELECT * FROM ClasseHabilidade

SELECT * FROM Personagens
INNER JOIN Classes
ON Personagens.ClasseID = Classes.ClasseID

--Exemplo de JOIN
CREATE DATABASE ExemploJOIN

USE ExemploJOIN

--DDL
CREATE TABLE TabelaA(
	Nome VARCHAR (50) NULL
)

CREATE TABLE TabelaB(
	Nome VARCHAR (50) NULL
)

--DML
INSERT INTO TabelaA VALUES ('Fernanda')
INSERT INTO TabelaA VALUES ('Josefa')
INSERT INTO TabelaA VALUES ('Michelle')
INSERT INTO TabelaA VALUES ('Luiz')

INSERT INTO TabelaB VALUES ('Fernanda'), ('Luiz'), ('Michelle'), ('Carlos')

--DQL
SELECT * FROM TabelaA
SELECT * FROM TabelaB

SELECT TabelaA.Nome AS DadosTabelaA, TabelaB.Nome AS DadosTabelaB FROM TabelaA
INNER JOIN TabelaB
ON TabelaA.Nome = TabelaB.Nome

SELECT TabelaA.Nome AS DadosTabelaA, TabelaB.Nome AS DadosTabelaB FROM TabelaA
LEFT JOIN TabelaB
ON TabelaA.Nome = TabelaB.Nome

SELECT TabelaA.Nome AS DadosTabelaA, TabelaB.Nome AS DadosTabelaB FROM TabelaA
RIGHT JOIN TabelaB
ON TabelaA.Nome = TabelaB.Nome

SELECT TabelaA.Nome AS DadosTabelaA, TabelaB.Nome AS DadosTabelaB FROM TabelaA
FULL OUTER JOIN TabelaB
ON TabelaA.Nome = TabelaB.Nome