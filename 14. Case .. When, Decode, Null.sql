SELECT * FROM TALUNO;

UPDATE TALUNO SET ESTADO = 'MT'
WHERE COD_ALUNO = 2;

UPDATE TALUNO SET ESTADO = 'SC'
WHERE COD_ALUNO = 3;

UPDATE TALUNO SET ESTADO = 'RJ'
WHERE COD_ALUNO = 5;

-- CASE
SELECT NOME, ESTADO,
       CASE
          WHEN ESTADO = 'RS' THEN 'GAUCHO'
          WHEN UPPER(ESTADO) = 'AC' THEN 'ACREANO'
          WHEN ESTADO = 'RJ' AND SALARIO > 500 THEN 'CARIOCA'
          ELSE 'OUTROS'
       END AS APELIDO
FROM TALUNO;

--
SELECT SYSDATE AS DATA FROM DUAL;

--SIMILAR AO CASE
SELECT NOME, ESTADO,
        Decode(ESTADO, 'RS', 'GAUCHO',
                       'AC', 'ACREANO',
                       'SP', 'PAULISTA',
                             'OUTROS') AS APELIDO
FROM TALUNO;