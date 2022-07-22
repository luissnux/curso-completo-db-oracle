

--SOMA O TOTAL DE CONTRATO POR ALUNO E MOSTRA SOMENTE CUJO O MENOR CONTRATO
--SEJA MAIOR QUE O VALOR MEDIO DE CURSO
SELECT COD_ALUNO, Min(TOTAL), Sum(TOTAL)
FROM TCONTRATO
GROUP BY COD_ALUNO
HAVING Min(TOTAL) >
      ( SELECT Avg(VALOR) FROM TCURSO );

--TODOS OS CURSOS QUE EST�O NA TABELA DE ITEM (VENDIDOS)
SELECT COD_CURSO, NOME, VALOR
FROM TCURSO
WHERE COD_CURSO IN (SELECT COD_CURSO FROM TITEM);

--TODOS OS CURSOS QUE N�O EST�O NA TABELA DE ITEM (N�O VENDIDOS)
SELECT COD_CURSO, NOME, VALOR
FROM TCURSO
WHERE COD_CURSO NOT IN (SELECT COD_CURSO FROM TITEM)
ORDER BY NOME;

--CODIGO EQUIVALENTE A SUBSELECT (SE OS VALORES S�O CONHECIDO)
SELECT COD_CURSO, NOME, VALOR
FROM TCURSO WHERE COD_CURSO IN (1,2,3);

--
SELECT COD_CURSO, NOME, VALOR
FROM TCURSO
WHERE COD_CURSO = 1
OR COD_CURSO = 2
OR COD_CURSO = 3
OR COD_CURSO = 4;

--TODOS CURSOS QUE FORAM VENDIDOS PELO VALOR PADRAO
SELECT * FROM TITEM
WHERE (COD_CURSO, VALOR) IN
      (SELECT COD_CURSO, VALOR FROM TCURSO);


--
SELECT ITE.COD_CONTRATO, ITE.VALOR,ITE.COD_CURSO,
       CUR.COD_CURSO CODIGO, CUR.VALOR
FROM TITEM ITE,
      ( SELECT COD_CURSO, VALOR
        FROM TCURSO WHERE VALOR > 500 ) CUR
WHERE CUR.COD_CURSO = ITE.COD_CURSO;