/* DML - DATA MANIPULATION LANGUAGE */

--Para usar a database

USE db_Devconnect_T;
GO

--para adicionar os registros

INSERT INTO tb_Usuario (nomeCompleto, nomeDeUsuario, email, senha)
VALUES 
('Ricardo Santos', 'RicardoS12', 'RicardoS123@gmail.com', '124816'),
('Joana Meneses', 'JoanMe', 'JoanMe@gmail.com', 'Joan#578');

INSERT INTO tb_Usuario (nomeCompleto, nomeDeUsuario, email, senha, fotoPerfilUrl)
VALUES
('Lidia da Cunha', 'Lidia123', 'LidiajJ@gmail.com', 'EUBFybew', 'https://foto.Aleatoria27642'),
('Thiago Oscar', 'OscarFax', 'Faxioned@gmail.com', '635478', 'https://foto.Aleatoria7kvf'),
('Thomas Cardio', 'PowerPlex', 'Wrecked@gmail.com', '321435', 'https://foto.Aleatoria7kvf'),
('Fabio Juto', 'FbioLin', 'VentoAureo@gmail.com', 'UbutreRaivoso', 'https://foto.Aleatoria0924'),
('Bruno Juto', 'BStar', 'JessiePark@gmail.com', 'Lavrador124', 'https://foto.Aleatoria0924'),
('Felix Gamma', 'FStar', 'StardustCruzader@gmail.com', 'PorcoemCima', 'https://foto.Aleatoria0924'),
('Paulo da Rocha', 'DoutorPaulo_98', 'DocPdaRocha@gmail.com', '768327', 'https://foto.Aleatoria7'),
('Maxewell Heart', 'MaimumRoman', 'HotOcean@gmail.com', 'UbutreRaivoso', 'https://foto.Aleatoria1224'),
('Felipe Machado', 'Felipe_12348', 'Lpezinadw@gmail.com', '7sdqw32564', 'https://foto.Aleatoria2139');

-- +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ --

INSERT INTO tb_Publicacao (descricao, imagemUrl, data_publicacao, id_usuario)
VALUES 
('Made by "Doutor Paulo da Rocha"', 'https://foto.Aleatoria12', '2025-12-30', 1),
('Codigo criado para satisfazer os clientes da loja', 'https://foto.Aleatoria1738', '2026-01-06', 2);

-- +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ --

TRUNCATE TABLE tb_Curtida
INSERT INTO tb_Curtida (id_Usuario, id_Publicacao)
VALUES 
(11, 1)

-- +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ --

INSERT INTO tb_Comentario (texto, dataComentario, id_Publicacao, id_Usuario)
VALUES 
('incrivel!!!', '2026-02-08', '1', '3'),
('Otima proposta', '2026-12-17', '2', '1'),
('amei o codigo', '2026-01-07', '1', '4');


-- +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ --

INSERT INTO tb_Seguidor (id_Usuario_Seguir, id_Usuario_Seguido)
VALUES 
(3, 1),
(2, 1),
(1, 2);

SELECT * FROM tb_Seguidor

--para deletar os registros

SELECT * FROM tb_Curtida

TRUNCATE TABLE tb_Curtida

--Para atualizar registros

UPDATE tb_Usuario
SET email = 'RicardoSAmazing@gmail.com'
WHERE id = 1;