-- Respostas Lab02, AT2

-- a)
SELECT 
AVG(salario) AS media_salarial_feminino
FROM EMPREGADO
WHERE sexo = 'F';

-- b)
SELECT emp.superssn AS ssn_supervisor, COUNT(*) AS qtd_empregados
FROM EMPREGADO AS emp
WHERE emp.superssn IS NOT NULL
GROUP BY emp.superssn;

-- c)
SELECT MAX(horas) AS maior_numero_horas
FROM TRABALHA;

-- d)
SELECT proj.pjnome AS nome_projeto, SUM(trab.horas) AS total_horas_semana
FROM PROJETO AS proj
JOIN TRABALHA AS trab 
ON proj.pnumero = trab.pno
GROUP BY proj.pjnome;

-- e)
SELECT dept.dnome AS nome_departamento, AVG(emp.salario) AS media_salarial
FROM DEPARTAMENTO AS dept
JOIN EMPREGADO AS emp 
ON emp.dno = dept.dnumero
GROUP BY dept.dnome;

-- f)
SELECT emp.pnome
FROM EMPREGADO AS emp
JOIN DEPENDENTE AS dep 
ON emp.ssn = dep.essn
GROUP BY emp.ssn, emp.pnome
HAVING COUNT(*) >= 2;

-- g)
SELECT dept.dnome, COUNT(proj.pnumero) AS qtd_projetos
FROM DEPARTAMENTO AS dept
LEFT JOIN PROJETO AS proj 
ON dept.dnumero = proj.dnum
GROUP BY dept.dnome
ORDER BY qtd_projetos ASC
LIMIT 1;

-- h)
SELECT emp.ssn, emp.pnome, SUBSTRING(emp.endereco, 10, 13) AS trecho_endereco
FROM EMPREGADO AS emp;

-- i)
SELECT ssn, EXTRACT(MONTH FROM datanasc) AS mes_nascimento
FROM EMPREGADO;

-- j)
SELECT emp.pnome, emp.unome, dep.nomedep AS nome_dependente, dep.parentesco, 
    DATE_PART('year', AGE(dep.datanascdep, emp.datanasc)) AS idade_quando_nasceu
FROM EMPREGADO AS emp
JOIN DEPENDENTE AS dep 
ON emp.ssn = dep.essn
WHERE dep.parentesco IN ('FILHO', 'FILHA');

-- k)
SELECT  EXTRACT(YEAR FROM datanascdep) AS ano_nascimento, COUNT(*) AS qtd_dependentes
FROM DEPENDENTE
GROUP BY EXTRACT(YEAR FROM datanascdep)
ORDER BY ano_nascimento;

-- l)
SELECT sup.pnome, sup.inicialm, sup.unome, COUNT(emp.ssn) AS qtd_supervisionados
FROM EMPREGADO AS emp
JOIN EMPREGADO AS sup 
ON emp.superssn = sup.ssn
GROUP BY sup.ssn, sup.pnome, sup.inicialm, sup.unome
HAVING COUNT(emp.ssn) >= 2;

-- m)
SELECT proj.pjnome AS nome_projeto, SUM(emp.salario * (trab.horas / total.total_horas)) AS custo_mensal_projeto
FROM TRABALHA AS trab
JOIN EMPREGADO AS emp ON trab.essn = emp.ssn
JOIN PROJETO AS proj ON trab.pno = proj.pnumero
JOIN (
  SELECT essn, SUM(horas) AS total_horas
  FROM TRABALHA
  GROUP BY essn
) AS total ON trab.essn = total.essn
GROUP BY proj.pjnome
ORDER BY custo_mensal_projeto DESC;

