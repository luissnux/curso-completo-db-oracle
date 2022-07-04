
-- FUNÇÕES DE CONVERSÃO ENTRE MAIÚSCULAS/MINÚSCULAS

-- LOWER('Introdução ORACLE 11g')  ----> introdução oracle 11g
-- UPPER('Introdução ORACLE 11g')  ----> INTRODUÇÃO OARCLE 11G
-- INICAP('Introdução ORACLE 11g') ----> Introdução Oracle 11g

SELECT ' O Cliente ' || INITCAP(nome) || ' mora em ' ||
Upper(cidade) || '-' || Lower(estado) AS "Informações"
FROM taluno;