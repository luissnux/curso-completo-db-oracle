
-- FUN��ES DE CONVERS�O ENTRE MAI�SCULAS/MIN�SCULAS

-- LOWER('Introdu��o ORACLE 11g')  ----> introdu��o oracle 11g
-- UPPER('Introdu��o ORACLE 11g')  ----> INTRODU��O OARCLE 11G
-- INICAP('Introdu��o ORACLE 11g') ----> Introdu��o Oracle 11g

SELECT ' O Cliente ' || INITCAP(nome) || ' mora em ' ||
Upper(cidade) || '-' || Lower(estado) AS "Informa��es"
FROM taluno;