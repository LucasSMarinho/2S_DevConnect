/* DQL - DATA QUERRY LANGUAGE */

--Para usar a database

USE db_devconnect;


--Para poder consultar a tabela usuario

SELECT * FROM tb_usuario;

--Para poder consultar a tabela publicacao

SELECT * FROM tb_publicacao;

--Para poder consultar a tabela curtidas

SELECT * FROM tb_curtida;

--Para poder consultar a tabela comentario

SELECT * FROM tb_comentario;

--Para poder consultar a tabela seguidor

SELECT * FROM tb_seguidor;



--Para ver o usuario mais recente 

SELECT TOP 1 nomeCompleto FROM tb_usuario
ORDER BY id DESC;