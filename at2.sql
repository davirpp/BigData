-- Respostas Lab01, AT2

-- Questão 1
-- a)
SELECT essn, nomedep, parentesco
FROM DEPENDENTE
ORDER BY essn, parentesco DESC;

-- b)
SELECT emp.pnome, emp.endereco
FROM EMPREGADO as emp
JOIN DEPARTAMENTO as dep 
ON emp.dno = dep.dnumero
WHERE dep.dnome = 'Pesquisa';

-- c)
SELECT proj.pjnome, dep.dnome, emp.unome, emp.endereco, emp.datanasc
FROM PROJETO as proj
JOIN DEPARTAMENTO as dep
ON proj.dnum = dep.dnumero
JOIN EMPREGADO as emp
ON dep.gerssn = emp.ssn
WHERE proj.plocal = 'Araucaria';

-- d)
SELECT emp.pnome
FROM EMPREGADO AS emp
JOIN TRABALHA AS trab
ON emp.ssn = trab.essn
JOIN PROJETO AS proj
ON trab.pno = proj.pnumero
WHERE trab.horas > 10
AND proj.pjnome = 'Automatizacao';

-- e)
SELECT pnome, salario
FROM EMPREGADO
ORDER BY salario desc
LIMIT 3;

-- f)
SELECT pnome, salario * 1.20 as salario_20
FROM empregado
WHERE ssn IN (SELECT DISTINCT superssn FROM empregado WHERE superssn IS NOT NULL);

-- g)
SELECT dep.dnome, loc.dlocalizacao
FROM DEPARTAMENTO AS dep
JOIN LOCALIZACAO AS loc 
ON dep.dnumero = loc.dnum;

-- h)
SELECT dep.dnome, proj.pjnome 
FROM DEPARTAMENTO AS dep
JOIN PROJETO AS proj 
ON dep.dnumero = proj.dnum;

-- i)
SELECT pnome, datanasc, salario
FROM empregado
WHERE sexo = 'F'
AND salario > 30000;

-- j) Após passar meia hora pensando porque minha query estava errada,
--    tive certeza que não estava errada e lembrei que fiz deletes na Q1
--    e foi justamente isso o motivo da minha query não retornar nada.
SELECT proj.pjnome
FROM PROJETO AS proj
JOIN TRABALHA AS trab 
ON proj.pnumero = trab.pno
JOIN EMPREGADO AS emp 
ON trab.essn = emp.ssn
WHERE emp.pnome = 'Fabio'; 


