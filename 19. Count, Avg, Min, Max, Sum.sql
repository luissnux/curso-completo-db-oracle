
SELECT Count(*)   AS QTDE_REGISTROS,
       Round(Avg(TOTAL),2) AS MEDIA,
       Max(TOTAL) AS MAXIMO,
       Min(TOTAL) AS MINIMO,
       Sum(TOTAL) AS SOMA,
       Max(DATA)  AS DATA_MAIOR,
       Min(DATA)  AS DATA_MENOR
FROM TCONTRATO;

--PR�XIMO C�DIGO SEQUENCIAL TABELA
SELECT Max(COD_CONTRATO) + 1 AS PROXIMO_CODIGO
FROM TCONTRATO;

--
SELECT * FROM TALUNO;
SELECT * FROM TCONTRATO;

--TOTAL DE CONTRATOS POR ALUNO
SELECT COD_ALUNO,
       Count(*) AS QTDE_CONTRATO,
       Sum(TOTAL) AS VALOR_TOTAL
FROM TCONTRATO
GROUP BY COD_ALUNO;

--TOTAL DE CONTRATO POR DATA
SELECT To_Char(Trunc(DATA), 'DD/MM/YYY') AS DATA,
       Sum(TOTAL) AS SOMA,
       Avg(TOTAL) AS MEDIA,
       Count(*)   AS QTDE
FROM TCONTRATO
GROUP BY Trunc(DATA)
ORDER BY DATA DESC;