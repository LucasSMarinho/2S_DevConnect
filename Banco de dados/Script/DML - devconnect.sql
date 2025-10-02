/* DQL - DATA MANIPULATION LANGUAGE */

--Para usar a database

USE db_devconnect;

--para adicionar os registros

INSERT INTO tb_usuario (nomeCompleto, nomeDeUsuario, email, senha)
VALUES 
('Ricardo Santos', 'RicardoS12', 'RicardoS123@gmail.com', '124816'),
('Joana Meneses', 'JoanMe', 'JoanMe@gmail.com', 'Joan#578');

INSERT INTO tb_usuario (nomeCompleto, nomeDeUsuario, email, senha, fotoPerfilUrl)
VALUES
('Paulo da Rocha', 'DoutorPaulo_98', 'DocPdaRocha@gmail.com', '768327', 'https://foto.Aleatoria9')

-- +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ --

INSERT INTO tb_publicacao (descricao, imagemUrl, data_publicacao, id_usuario)
VALUES 
('Made by "Doutor Paulo da Rocha"', 'https://foto.Aleatoria12', '2025-12-30', 1),
('Codigo criado para satisfazer os clientes da loja', 'https://foto.Aleatoria1738', '2026-01-06', 2);

-- +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ --

INSERT INTO tb_curtida (id_Usuario, id_Publicacao)
VALUES 
(3, 2),
(2, 1);

-- +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ --

INSERT INTO tb_comentario (texto, dataComentario, id_Publicacao, id_Usuario)
VALUES 
('amei o codigo', '2026-01-07', '2', '3');

-- +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ --

INSERT INTO tb_seguidor (id_Usuario_Seguir, id_Usuario_Seguido)
VALUES 
(1, 2);

--para deletar os registros

DELETE FROM tb_usuario
WHERE id = 1;

--Para atualizar registros

UPDATE tb_usuario
SET email = 'RicardoSAmazing@gmail.com'
WHERE id = 2;