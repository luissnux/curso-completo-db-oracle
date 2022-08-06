
TALUNO
  COD_ALUNO - PK  -> CHAVE PRIM�RIA -> PRIMARY KEY

TCONTRATO
  COD_CONTRATO - PK  -> CHAVE PRIM�RIA -> PRIMARY KEY
  COD_ALUNO - FK -> CHAVE PRIM�RIA QUE VEM DE OUTRA TABELA

--MOSTRA AS CONSTRAINTS CRIADAS PELO USU�RIO
SELECT * FROM USER_CONSTRAINTS;

--MOSTRA TODAS AS CONTRAINTS DO BANCO
SELECT * FROM ALL_CONSTRAINTS;


--DROP TABLE TCIDADE

CREATE TABLE TCIDADE (
  COD_CIDADE  INTEGER NOT NULL,
  NOME VARCHAR2(40),
  CONSTRAINT PK_CIDADE PRIMARY KEY(COD_CIDADE)
);

CREATE TABLE TBAIRRO(
  COD_CIDADE INTEGER NOT NULL,
  COD_BAIRRO INTEGER NOT NULL,
  NOME       VARCHAR2(40),
  CONSTRAINT PK_BAIRRO PRIMARY KEY(COD_CIDADE,COD_BAIRRO)
);

    CIDADE 1 - BAIRRO 1
    CIDADE 1 - BAIRRO 2
    CIDADE 2 - BAIRRO 1
    CIDADE 2 - BAIRRO 2

--ADD CHAVE ESTRANGEIRA
ALTER TABLE TBAIRRO ADD CONSTRAINT FK_COD_CIDADE
FOREIGN KEY (COD_CIDADE)
REFERENCES TCIDADE(COD_CIDADE);


CREATE TABLE TRUA(
COD_RUA INTEGER NOT NULL,
COD_CIDADE INTEGER,
COD_BAIRRO INTEGER,
NOME VARCHAR(40),
CONSTRAINT PK_RUA PRIMARY KEY(COD_RUA)
);


ALTER TABLE TRUA ADD CONSTRAINT FK_CIDADEBAIRRO
FOREIGN KEY(COD_CIDADE, COD_BAIRRO)
REFERENCES TBAIRRO(COD_CIDADE, COD_BAIRRO);

--DROP TABLE TPESSOA (FORNEC OU CLIENTE)
CREATE TABLE TPESSOA (
COD_PESSOA     INTEGER       NOT NULL,
TIPO           VARCHAR2(1)   NOT NULL,
NOME           VARCHAR2(30)  NOT NULL,
PESSOA         VARCHAR2(1)   NOT NULL,
COD_RUA        INTEGER       NOT NULL,
CPF            VARCHAR2(15)  ,
CONSTRAINT PK_PESSOA PRIMARY KEY(COD_PESSOA)
);

--UNIQUE KEY
ALTER TABLE TPESSOA ADD CONSTRAINT UK_CPF UNIQUE(CPF);

--ALTER TABLE TPESSOA DROP CONSTRAINT NOME_CONSTRAINT
ALTER TABLE TPESSOA
ADD CONSTRAINT FK_PESSOA_RUA
FOREIGN KEY (COD_RUA)
REFERENCES TRUA;


--CIDADE
INSERT INTO TCIDADE VALUES(1, 'NOVO HAMBURGO');
INSERT INTO TCIDADE VALUES(2, 'IVOTI');
INSERT INTO TCIDADE VALUES(3, 'SAPIRANGA');
INSERT INTO TCIDADE VALUES(4, 'TAQUARA');

SELECT * FROM TCIDADE;

--BAIRRO
INSERT INTO TBAIRRO VALUES(1, 1, 'CENTRO');
INSERT INTO TBAIRRO VALUES(2, 1, 'RIO BRANCO');
INSERT INTO TBAIRRO VALUES(3, 1, 'CENTRO');
INSERT INTO TBAIRRO VALUES(4, 1, 'FRITZ');
INSERT INTO TBAIRRO VALUES(5, 1, 'AMARAL'); --N�O SER� INSERIDO, N�O TEM CIDADE 5 INSERIDA
INSERT INTO TBAIRRO VALUES(6, 1, 'EMPRESA');  --N�O SER� INSERIDO, N�O TEM CIDADE 6 INSERIDA

SELECT * FROM TBAIRRO;

--RUA
INSERT INTO TRUA VALUES(1, 1, 1, 'MARCILIO DIAS');
INSERT INTO TRUA VALUES(2, 2, 1, 'FRITZ');
INSERT INTO TRUA VALUES(3, 3, 1, 'JACOBINA');
INSERT INTO TRUA VALUES(4, 4, 1, 'JOAO DA SILVA');

--CHECK
ALTER TABLE TPESSOA ADD CONSTRAINT CK_PESSOA_TIPO
CHECK (TIPO IN ('C','F'));

ALTER TABLE TPESSOA ADD CONSTRAINT CK_PESSOA_JF
CHECK (TIPO IN ('J','F'));

--EXCLUIR CONSTRAINT
ALTER TABLE TPESSOA DROP CONSTRAINT NOME_CONSTRAINT;

INSERT INTO TPESSOA VALUES(1,'C','MARCIO','F',1,'1234');
INSERT INTO TPESSOA VALUES(2,'F','BEATRIZ','F',2,'123');
INSERT INTO TPESSOA VALUES(3,'F','PEDRO','F',4,'12345');
INSERT INTO TPESSOA VALUES(4,'C','MARIA','J',3,'12357');

SELECT * FROM TPESSOA;

--FOREIGN KEY DROP
ALTER TABLE TPESSOA DROP CONSTRAINT NOME_DA_CONSTRAINT
CASCADE CONSTRAINT;

--CHECK
ALTER TABLE TCONTRATO
ADD CONSTRAINT CK_CONTRATO_DESCONTO
CHECK (DESCONTO BETWEEN 0 AND 30);

--DESABILITANDO/HABILITANDO CONSTRAINT
ALTER TABLE TPESSOA DISABLE CONSTRAINT UK_CPF;
ALTER TABLE TPESSOA ENABLE CONSTRAINT UK_CPF;

--EXCLUIR CONSTRAINT
ALTER TABLE TPESSOA DROP CONSTRAINT UK_CPF;

SELECT * FROM USER_CONSTRAINTS
WHERE TABLE_NAME = 'TPESSOA';

--CONSTRAINT E AS COLUNAS ASSOCIADAS
SELECT CONSTRAINT_NAME, COLUMN_NAME
FROM USER_CONS_COLUMNS
WHERE TABLE_NAME = 'TPESSOA';

--
SELECT OBJECT_NAME, OBJECT_TYPE
FROM USER_OBJECTS
WHERE OBJECT_NAME IN ('TPESSOA');

SELECT * FROM TPESSOA;

COMMIT;

