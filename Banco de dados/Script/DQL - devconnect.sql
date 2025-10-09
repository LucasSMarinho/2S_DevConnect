/* DQL - DATA QUERRY LANGUAGE */

--Para usar a database

USE db_Devconnect_T;
GO


--Para poder consultar a tabela usuario

SELECT * FROM tb_Usuario;

--Para poder consultar a tabela publicacao

SELECT * FROM tb_Publicacao;

--Para poder consultar a tabela curtidas

SELECT * FROM tb_Curtida;

--Para poder consultar a tabela comentario

SELECT * FROM tb_Comentario;

--Para poder consultar a tabela seguidor

SELECT * FROM tb_Seguidor;



--Para ver o usuario mais recente 

SELECT TOP 1 nomeCompleto FROM tb_Usuario
ORDER BY id DESC;

--Para mostrar o nome do seguidor e de quem será seguido

SELECT
tb_Usuario.nomeCompleto
FROM tb_Seguidor S
INNER JOIN tb_Usuario U ON S.id_Usuario_Seguir =  U.id
INNER JOIN tb_Usuario ON S.id_Usuario_Seguido = U.id
GROUP BY tb_Usuario.nomeCompleto

SELECT * FROM tb_Usuario


SELECT
	UR.nomeCompleto AS 'Seguidor',
	UD.nomeCompleto AS 'Seguido'
FROM tb_Seguidor S
INNER JOIN tb_Usuario UR ON S.id_Usuario_Seguir =  UR.id
INNER JOIN tb_Usuario UD ON S.id_Usuario_Seguido = UD.id


--Para ver quanto seguidores possui um usuario

SELECT
tb_Usuario.nomeCompleto,
COUNT (id_Usuario_Seguir) AS 'Numero de seguidores'
FROM tb_Seguidor S
INNER JOIN tb_Usuario ON S.id_Usuario_Seguido = tb_Usuario.id
GROUP BY tb_Usuario.nomeCompleto

--Para todas as publicações

SELECT 
P.descricao, 
P.imagemUrl, 
U.nomeDeUsuario
FROM tb_Publicacao P
INNER JOIN tb_Usuario U ON P.id_Usuario = U.id

--Para todas os comentarios

SELECT
C.texto,
P.id
FROM tb_Comentario C
INNER JOIN tb_Publicacao P ON C.id_Publicacao = P.Id

SELECT * FROM tb_Publicacao
 
 --Mostrar quantidade de curtidas

SELECT
P.id,
COUNT (C.id) AS 'Numero de curtidas'
FROM tb_Curtida C
FULL JOIN tb_Publicacao P ON P.id = C.id_Publicacao
GROUP BY P.id

 --Mostrar usuarios sem publicações

SELECT 
U.nomeDeUsuario,
P.id
FROM tb_Usuario U
LEFT JOIN tb_Publicacao P ON P.id = U.id
WHERE P.id IS NULL

 --Mostrar usuarios sem reações

SELECT
	U.id,
	C.id_Usuario,
	U.nomeCompleto
FROM tb_Usuario U
LEFT JOIN tb_Curtida C ON C.id_Usuario = U.id
WHERE C.id_Usuario IS NULL

select * from tb_Curtida
SELECT * FROM tb_Curtida
SELECT id, nomeCompleto FROM tb_Usuario
where id = 11