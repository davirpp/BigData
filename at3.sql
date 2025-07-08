-- Respostas Lab01, AT3

-- Questão 1
-- a)
SELECT emp1.ssn, CONCAT(emp1.pnome, ' ', emp1.inicialm, '. ', emp1.unome) as nome_completo
FROM EMPREGADO AS emp1
JOIN EMPREGADO AS t2
ON emp1.superssn = t2.ssn
WHERE emp1.dno != t2.dno;

-- b)
SELECT essn, nomedep, parentesco
FROM DEPENDENTE
ORDER BY essn ASC, parentesco DESC;

-- c)
SELECT CONCAT(emp.pnome, ' ', emp.inicialm, '. ', emp.unome) as nome_completo
FROM EMPREGADO AS emp
JOIN EMPREGADO AS t2
ON emp.superssn = t2.ssn
WHERE t2.pnome = 'Joaquim' 
AND t2.inicialm = 'E' 
AND t2.unome = 'Brito';

-- d)
SELECT DISTINCT proj.pnumero, proj.pjnome
FROM PROJETO AS proj
JOIN TRABALHA AS trab
ON proj.pnumero = trab.pno
JOIN EMPREGADO AS emp
ON trab.essn = emp.ssn
WHERE emp.unome = 'Will'
UNION ALL
SELECT DISTINCT proj.pnumero, proj.pjnome
FROM PROJETO AS proj
JOIN DEPARTAMENTO AS D
ON proj.dnum = D.dnumero
JOIN EMPREGADO AS emp
ON D.gerssn = emp.ssn
WHEREemp.unome = 'Will';

-- e)
SELECT DISTINCT CONCAT(emp.pnome, ' ', emp.inicialm, '. ', emp.unome) AS nome_completo
FROM EMPREGADO AS emp
JOIN TRABALHA AS trab 
ON emp.ssn = trab.essn
JOIN PROJETO AS proj 
ON trab.pno = proj.pnumero
WHERE proj.dnum = '5';

-- f)
SELECT CONCAT(emp.pnome, ' ', emp.inicialm, '. ', emp.unome) AS nome_completo, emp.endereco
FROM EMPREGADO AS emp
JOIN TRABALHA AS trab 
ON emp.ssn = trab.essn
JOIN PROJETO AS proj 
ON trab.pno = proj.pnumero
JOIN LOCALIZACAO AS loc 
ON emp.dno = loc.dnum
WHERE proj.plocal = 'Curitiba'
AND emp.dno NOT IN (
    SELECT dnum
    FROM LOCALIZACAO
    WHERE dlocalizacao = 'Curitiba'
);
