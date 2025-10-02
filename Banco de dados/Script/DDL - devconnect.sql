/*DDL - DATA DEFINITION LANGUAGE */

CREATE DATABASE db_devconnect;

--Para usar a database

USE db_devconnect;

-- criando as tabelas

CREATE TABLE tb_usuario(
id				INT IDENTITY	(1,1) PRIMARY KEY,
nomeCompleto	NVARCHAR		(255) NOT NULL,
nomeDeUsuario	NVARCHAR		(20) UNIQUE NOT NULL,
email			NVARCHAR		(255) UNIQUE NOT NULL,
senha			NVARCHAR		(50) NOT NULL,
fotoPerfilUrl	NVARCHAR		(255)
);

-- +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ --

CREATE TABLE tb_publicacao(
id				INT IDENTITY	(1,1) PRIMARY KEY,
descricao		NVARCHAR		(500),
imagemUrl		NVARCHAR		(255) NOT NULL,
data_Publicacao DATE NOT NULL,
id_Usuario		INT NOT NULL FOREIGN KEY REFERENCES tb_usuario(id)
);

-- +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ --

CREATE TABLE tb_curtida(
id				INT IDENTITY	(1,1) PRIMARY KEY,
id_Usuario		INT NOT NULL FOREIGN KEY REFERENCES tb_usuario(id),
id_Publicacao	INT NOT NULL FOREIGN KEY REFERENCES tb_publicacao(id)
);

-- +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ --

CREATE TABLE tb_comentario(
id				INT IDENTITY	(1,1) PRIMARY KEY,
texto			NVARCHAR		(300) NOT NULL,
dataComentario	DATE NOT NULL,
id_Publicacao	INT NOT NULL FOREIGN KEY REFERENCES tb_publicacao(id),
id_Usuario		INT NOT NULL FOREIGN KEY REFERENCES tb_usuario(id)
);

-- +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ --



CREATE TABLE tb_seguidor(                                   --tabela intermediaria
id_Usuario_Seguir INT NOT NULL,  --usuario que quer seguir
id_Usuario_Seguido INT NOT NULL,  --usuario que será seguido
PRIMARY KEY (id_Usuario_Seguir, id_Usuario_Seguido)
);

--Para deletar a tabela
DROP TABLE tb_usuario;
DROP TABLE tb_publicacao;
DROP TABLE tb_curtida;
DROP TABLE tb_comentario;
DROP TABLE tb_seguidor;

