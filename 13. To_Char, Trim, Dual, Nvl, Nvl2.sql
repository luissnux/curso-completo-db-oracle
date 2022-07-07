
--FORMATA��O DE DATA

--CONVERS�O TO_CHAR(DATA, FORMATO)

--DD -> DIA DO M�S
SELECT SYSDATE, To_Char(SYSDATE, 'DD') FROM DUAL;

--MOSTRA SOMENTE A DATA SEM A HORA
SELECT To_Char(SYSDATE, 'DD/MM/YYYY') DATA FROM DUAL;

SELECT To_Char(SYSDATE, 'DD/MM') DIA_MES FROM DUAL;

SELECT To_Char(SYSDATE, 'DD') DIA FROM DUAL;

SELECT To_Char(SYSDATE, 'MM') MES FROM DUAL;

SELECT To_Char(SYSDATE, 'YYYY') ANO FROM DUAL;

SELECT To_Char(SYSDATE, 'YY') ANO FROM DUAL;

SELECT To_Char(SYSDATE, 'MONTH') MES1 FROM DUAL;

--MOSTRA N�MERO QUE CORRESPONDE AO DIA DA SEMANA
SELECT To_Char(SYSDATE, 'D') DIA_SEMANA FROM DUAL;

SELECT To_Char(SYSDATE, 'DY') DIA_SEMANA FROM DUAL;  --TUE

SELECT To_Char(SYSDATE, 'YEAR') ANO FROM DUAL;  --YEAR

SELECT To_Char(SYSDATE,'"NOVO HAMBURGO", fmDAY "," DD "de" fmMonth "de" YYYY') FROM DUAL;

SELECT To_Char(SYSDATE, 'HH24:MI') HORA_MIN FROM DUAL;

SELECT To_Char(SYSDATE, 'HH24:MI:SS') HOTA_MIN_SEG FROM DUAL;

SELECT To_Char(SYSDATE, 'DD/MM HH24:MI') DATA_HORA FROM DUAL;

SELECT To_Char(SYSDATE, 'DD/MM/YYY HH24:MI:SS') DATA_HORA FROM DUAL;


--L -> R$
--G -> PONTO
--D -> CASAS DECIMAIS

SELECT * FROM TALUNO;

SELECT To_Char(SALARIO, 'L99999.99') SALARIO1, To_Char(SALARIO, 'L99G999D99') SALARIO2 FROM TALUNO;

--TRIM - REMOVE OS ESPA�OS EM BRANCO
SELECT TRIM(To_Char(SALARIO, 'L99999.99')) SALARIO1, Trim(To_Char(SALARIO, 'L99G999D99')) SALARIO2 FROM TALUNO;

--OUTRA MANEIRA DE FORMATAR O SAL�RIO
SELECT 'R$ '||(Round(SALARIO, 2)) AS SALARIO FROM TALUNO;

SELECT LPad(Trim((TO_CHAR(5000, 'L99999.99'))), '12',' ') FROM DUAL;

SELECT 'R$ ' ||LPad((To_Char(800, '99999.99')), '12', ' ') FROM DUAL;

SELECT LPad((TO_CHAR(SALARIO, 'L99999.99')), '12',' ') FROM TALUNO;

SELECT 'R$ ' ||LPad((To_Char(SALARIO, '99999.99')), '12', ' ') FROM TALUNO;

-------------
--NVL e NVL2 (SA�DA DESSE SER DO MESMO TIPO)

SELECT * FROM TCONTRATO;

SELECT TOTAL,
       DESCONTO,
       DESCONTO+TOTAL,
       Nvl(DESCONTO,0), -- NVL TRABALHO COM VALOR NULL, QUANDO VALOR FOR NULL ELE SUBSTITIU POR 0
       Nvl(DESCONTO,0) + TOTAL,
       Nvl2(DESCONTO, -1, TOTAL) --SE O DESCONTO FOR NULL RETORNA TOTAL SEN�O RETORNA -1
FROM TCONTRATO;

--
SELECT * FROM TALUNO;

UPDATE TALUNO SET NOME = NULL WHERE COD_ALUNO = 5;

SELECT COD_ALUNO, Nvl(NOME, 'SEM NOME') FROM TALUNO; --SE O NOME FOR NULL RETORNA 'SEM NOME'





