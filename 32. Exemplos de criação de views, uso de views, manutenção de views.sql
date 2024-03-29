
CREATE OR REPLACE VIEW V_ALUNO
AS
  SELECT COD_ALUNO AS CODIGO, SALARIO, NOME AS ALUNO, CIDADE
  FROM TALUNO
  WHERE ESTADO = 'SC';

-- USANDO A VIEW
SELECT * FROM V_ALUNO
ORDER BY ALUNO;

--
CREATE OR REPLACE VIEW V_CONTRATO_TOP
AS
  SELECT COD_CONTRATO, DESCONTO
  FROM TCONTRATO
  WHERE DESCONTO > 10;

SELECT * FROM V_CONTRATO_TOP;

-- NOME E CONTEUDO DAS VIEWS
SELECT VIEW_NAME, TEXT
FROM USER_VIEWS;

--VIEW COM PARAMETROS DE SA�DA
CREATE OR REPLACE VIEW V_ALUNO2(COD, ALUNO, SAL)
AS
  SELECT COD_ALUNO, NOME, SALARIO
  FROM TALUNO;

SELECT * FROM V_ALUNO2;

--VIEW COMPLEXA (TEM COMANDO DE GRUPOS NO SELECT)
CREATE OR REPLACE VIEW V_CONTRATO
AS
  SELECT Trunc(DATA) AS DATA,
         Max(DESCONTO) MAXIMO,
         Avg(DESCONTO) MEDIA,
         Count(*) QTDE
  FROM TCONTRATO
  GROUP BY Trunc(DATA);

--
SELECT * FROM V_CONTRATO;

--VIEW SIMPLES
CREATE OR REPLACE VIEW V_PESSOA_F
AS
  SELECT COD_PESSOA, TIPO, NOME, COD_RUA AS RUA
  FROM TPESSOA
  WHERE TIPO='F';

--
SELECT * FROM V_PESSOA_F;

--EXEMPLO DE CONSULTA USANDO VIEW E TABELA
SELECT PES.COD_PESSOA AS CODIGO,
       PES.NOME AS PESSOA,
       CID.NOME AS CIDADE,
       RUA.NOME AS RUA
FROM V_PESSOA_F PES, TRUA RUA, TCIDADE CID
WHERE PES.RUA = RUA.COD_RUA (+)
AND CID.COD_CIDADE = RUA.COD_CIDADE
ORDER BY PES.NOME;

////////////////////////////////////////////////////////

--OPERA��O DML NA VIEW (INSERT ATRAV�S DA VIEW)
CREATE OR REPLACE VIEW VCURSOS1000CK
  AS
    SELECT COD_CURSO, NOME, VALOR
    FROM TCURSO
    WHERE VALOR = 1000
    WITH CHECK OPTION CONSTRAINT VCURSOS1000_CK;

INSERT INTO VCURSOS1000CK(COD_CURSO,NOME,VALOR)
VALUES (52,'TESTE Y', 999);  --N�O IR� INSERIR O VALOR 999 POR CAUSA DO 'WITH CHECK OPTION CONSTRAINT VCURSOS1000_CK'

INSERT INTO VCURSOS1000CK(COD_CURSO,NOME,VALOR)
VALUES (52,'TESTE Y', 1000);

SELECT * FROM TCURSO;

--DELETE EM VIEW
SELECT * FROM V_ALUNO;
--
DELETE FROM V_ALUNO WHERE CODIGO = 3;

--INSERT EM VIEW
INSERT INTO V_ALUNO
VALUES (50, 500, 'MARIA', 'NH');

COMMIT;


--DELETE EM VIEW
--(N�O PODE FAZER DML EM VIEW COMPLEXA)
DELETE FROM V_CONTRATO;

--VIEW SOMENTE LEITURA (N�O PERMITE DML)
CREATE OR REPLACE VIEW V_ALUNO3
AS
  SELECT COD_ALUNO CODIGO, NOME ALUNO, CIDADE
  FROM TALUNO
  WHERE ESTADO='SC'
  WITH READ ONLY;

--N�O PODE EXECUTAR DELETE EM VIWE SOMENTE LEITURA
DELETE FROM V_ALUNO3;

--EXCLUIDNO VIS�O
DROP VIEW V_ALUNO3;









