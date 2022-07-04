
--
SELECT * FROM TALUNO;

-- ACRESCENTAR COLUNAS NAS TALUNO, UTILIZANDO O DEFAULT SER� ADICIONA DO VALOR 'RS' AO INV�S DE NULL
ALTER TABLE TALUNO ADD ESTADO CHAR(2) DEFAULT 'RS';

ALTER TABLE TALUNO ADD SALARIO NUMBER(8,2) DEFAULT 620;


-- ALTERANDO REGISTROS DA TABELA
UPDATE TALUNO SET
ESTADO = 'AC', SALARIO = 250
WHERE COD_ALUNO = 1;

UPDATE TALUNO SET
ESTADO = 'MT', SALARIO = 2000
WHERE COD_ALUNO = 2;

UPDATE TALUNO SET
ESTADO = 'SP', SALARIO = 800
WHERE COD_ALUNO = 5;


SELECT * FROM TALUNO;

COMMIT;


-- REALIZANDO UM FILTRO DA TABELA TALUNO
SELECT * FROM TALUNO
WHERE ESTADO <> 'RS'
AND SALARIO <= 800
ORDER BY SALARIO DESC;


--INSERINDO NOVOS DADOS NA TABELA TALUNO
INSERT INTO TALUNO (COD_ALUNO, NOME, CIDADE)
VALUES (SEQ_ALUNO.NEXTVAL, 'VALDO', 'DOIS IRMAOS');

INSERT INTO TALUNO (COD_ALUNO, NOME, CIDADE)
VALUES (SEQ_ALUNO.NEXTVAL, 'ALDO', 'QUATRO IRMAOS');

SELECT * FROM TALUNO;


UPDATE TALUNO SET
ESTADO = 'SP',
SALARIO = 900,
NOME = 'PEDRO'
WHERE COD_ALUNO = 25;

-- QUANDO UTILIZAR O ORDER BY COM MAIS DE UMA COLUNA, O SEGUNDO ORDER BY IR�S SEGUIR UM CRIT�RIO DE GRUPO
SELECT ESTADO, SALARIO, NOME FROM TALUNO
ORDER BY ESTADO, SALARIO DESC;

-- DATA ATUAL MENOS 1000 DIAS
ALTER TABLE TALUNO ADD NASCIMENTO DATE DEFAULT SYSDATE - 1000;

SELECT SYSDATE - SYSDATE - 100 FROM DUAL;

--
SELECT * FROM TALUNO;


--
UPDATE TALUNO SET
NASCIMENTO = '10/OCT/2001'
WHERE COD_ALUNO = 1;

UPDATE TALUNO SET
NASCIMENTO = '10/AUG/2000'
WHERE COD_ALUNO = 2;


--
SELECT * FROM TALUNO


-- UTILIZANDO O TRUNC A HORA DA DATA � ARREDONDADA PARA 00:00:00
SELECT COD_ALUNO, NASCIMENTO, TRUNC(NASCIMENTO) AS nascimento, NOME
FROM TALUNO
WHERE TRUNC(NASCIMENTO) = '02/OCT/2019';

-- SELECT EM UM ESPA�O DE TEMPO (HORAS)
SELECT  COD_ALUNO, NASCIMENTO, Trunc(NASCIMENTO), NOME
FROM TALUNO
WHERE NASCIMENTO
  BETWEEN To_Date('02/OCT/2019 19:00', 'DD/MM/YYYY HH24:MI')
    AND To_Date('02/OCT/2019 19:30', 'DD/MM/YYYY HH24:MI')

-- UTLIZANDO CALCULO NA CL�SULA WHERE
SELECT COD_CONTRATO, DATA, TOTAL,
        DESCONTO, DESCONTO + 1000 AS CALCULO
FROM TCONTRATO
WHERE TOTAL <= DESCONTO + 1000;

--
SELECT * FROM TCONTRATO;

--
UPDATE TCONTRATO SET
DESCONTO = NULL
WHERE COD_CONTRATO = 2;
--
SELECT * FROM TCONTRATO
WHERE DESCONTO IS NULL;
--
SELECT * FROM TCONTRATO
WHERE DESCONTO IS NOT NULL;
--
SELECT * FROM TCONTRATO
WHERE DESCONTO BETWEEN 0 AND 10
ORDER BY DESCONTO;

-- NVL 0 > COLUNA COM VALOR NULL
SELECT COD_CONTRATO, TOTAL, DESCONTO, Nvl(DESCONTO,0)
FROM TCONTRATO
WHERE Nvl(DESCONTO, 0) BETWEEN 0 AND 10;

-- MESMO EFEITO DO BETWEEN
SELECT * FROM TCONTRATO
WHERE DESCONTO >= 0
AND DESCONTO <= 10
OR DESCONTO IS NULL;

-- IN /// NOT IN
SELECT * FROM TITEM
WHERE COD_CURSO IN (1, 2, 4);

SELECT * FROM TITEM
WHERE COD_CURSO NOT IN (1, 2, 4);


SELECT * FROM TCURSO;
-- INSERINDO MAIS UM TUPLA
INSERT INTO TCURSO VALUES (5, 'WINDOWS', 1000, 50);

-- CURSOS N�O VENDIDOS
SELECT * FROM TCURSO
WHERE COD_CURSO NOT IN (SELECT COD_CURSO FROM TITEM);

-- CURSOS VENDIDOS
SELECT * FROM TCURSO
WHERE COD_CURSO IN (SELECT COD_CURSO FROM TITEM);


-- EQUIVALENTE AO SELECT IN
SELECT * FROM TITEM
WHERE COD_CURSO = 1
OR COD_CURSO = 2
OR COD_CURSO = 3;


-- SOMENTE ONDE A SEGUNDA LETRA SEJA 'A'
SELECT * FROM TCURSO WHERE NOME LIKE('_A%');
SELECT * FROM TCURSO WHERE NOME LIKE('W%');
SELECT * FROM TCURSO WHERE NOME LIKE('%JAVA%');
SELECT * FROM TCURSO WHERE NOME LIKE('%FACES');

SELECT * FROM TCURSO;

COMMIT;

ALTER TABLE TCURSO ADD PRE_REQ INTEGER;

UPDATE TCURSO SET
PRE_REQ = 1
WHERE COD_CURSO = 2;

UPDATE TCURSO SET
PRE_REQ = 3
WHERE COD_CURSO = 4;

--CURSOS SEM PRE-REQUISITO
SELECT * FROM TCURSO WHERE PRE_REQ IS NULL;

--CURSOS COM PRE-REQUISITO
SELECT * FROM TCURSO WHERE PRE_REQ IS NOT NULL;


-- PRECED�NCIA DOS OPERADORES
-- () --> AND --> OR
SELECT * FROM TCURSO
WHERE VALOR > 750
OR VALOR < 1000
AND CARGA_HORARIA = 25;

--
SELECT * FROM TCURSO
WHERE (VALOR > 750
OR VALOR < 1000)
AND CARGA_HORARIA = 25;
















