
--J� FOI CRIADA A TABELA
CREATE TABLE TDESCONTO(
   CLASSE VARCHAR(2),
  INFERIOR INTEGER,
  SUPERIOR INTEGER
);

SELECT * FROM TDESCONTO
ORDER BY CLASSE;

/*
- UTILIZANDO VARI�VEIS DE SUBSTITUI��O ( Script\Enable Substitution Variables )
- UTILIZA-SE QUANDO N�O QUER FICAR DIGITANDO VALORES
- PODE SER UTLIZADO COM INSERT, UPDATE E DELETE
*/
INSERT INTO TDESCONTO(CLASSE, INFERIOR, SUPERIOR)
VALUES ('&cla', '&inf', '&sup');

SELECT * FROM TDESCONTO
WHERE CLASSE = '&cla';

UPDATE TDESCONTO SET
INFERIOR = &inf,
SUPERIOR = &sup
WHERE CLASSE = '&cla';

DELETE FROM TDESCONTO
WHERE CLASSE = '&cla';

--CRIANDO UMA C�PIA DE UM TABELA
CREATE TABLE TDESCONTO2
  AS SELECT * FROM TDESCONTO;

--CRIANDO UMA C�PIA DE UM TABELA COM APENAS A ESTRUTURA
CREATE TABLE TDESCONTO3
  AS SELECT * FROM TDESCONTO
     WHERE CLASSE IS NULL;


SELECT * FROM TDESCONTO2;
SELECT * FROM TDESCONTO3;

COMMIT;

--TRANSA��O (COMMIT/ROLLBACK)

--DELETE TODOS OS REGISTROS
DELETE FROM TDESCONTO2;

--DESFAZER ALTERA��ES
ROLLBACK

--DELETA TODOS OS REGISTROS DA TABELA, N�O TEM CL�USULA WHERE, N�O TEM ROLLBACK
TRUNCATE TABLE TDESCONTO2;

