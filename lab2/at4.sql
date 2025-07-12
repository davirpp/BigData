-- Respostas Lab02, AT4

-- a)
CREATE VIEW TRABALHA_EM AS
SELECT emp.pnome, emp.unome, proj.pjnome, trab.horas
FROM  EMPREGADO AS emp
JOIN TRABALHA AS trab 
ON emp.ssn = trab.essn
JOIN PROJETO AS proj 
ON trab.pno = proj.pnumero;

-- b)
SELECT DISTINCT unome, pnome
FROM TRABALHA_EM
WHERE pjnome = 'ProdutoX';

-- Como a view guarda uma query, todas as vezes que forem feitas consultas nela, 
-- os dados serão atualizados com base nas tabelas originais.

-- c)
DROP VIEW IF EXISTS TRABALHA_EM;

-- d)
CREATE MATERIALIZED VIEW DEPTO_INFO AS
SELECT dept.dnome, COUNT(emp.ssn) AS total_empregados, SUM(emp.salario) AS soma_salarios
FROM DEPARTAMENTO AS dept
LEFT JOIN EMPREGADO AS emp 
ON dept.dnumero = emp.dno
GROUP BY dept.dnome;

-- e)
SELECT dnome, total_empregados, soma_salarios
FROM  DEPTO_INFO
ORDER BY soma_salarios DESC;

REFRESH MATERIALIZED VIEW DEPTO_INFO;

-- Após rodar o refresh manualmente, a view materializada será atualizada com os dados mais recentes

-- f)
-- Alterações em EMPREGADO (INSERT, UPDATE, DELETE) atualizam a view simples.
-- Mas oara que a materialized view reflita as alterações, é necessário executar manualmente o REFRESH.

-- g)
DROP MATERIALIZED VIEW IF EXISTS DEPTO_INFO;





