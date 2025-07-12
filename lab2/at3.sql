-- Respostas Lab02, AT3

-- a)
SELECT pnome, unome
FROM EMPREGADO AS emp
WHERE EXISTS (
    SELECT 1
    FROM DEPENDENTE AS dep
    WHERE dep.nomedep = emp.pnome AND dep.sexodep = emp.sexo
  );

-- b)
SELECT pnome, unome
FROM EMPREGADO
WHERE salario > (
    SELECT AVG(salario)
    FROM EMPREGADO
    WHERE dno = '5'
  );

-- c)
SELECT DISTINCT essn
FROM TRABALHA
WHERE (pno, horas) IN (
    SELECT pno, horas
    FROM TRABALHA
    WHERE essn = '333445555'
  )
  AND essn != '333445555';


-- d)
SELECT pnome, unome
FROM EMPREGADO AS emp
WHERE NOT EXISTS (
    SELECT 1
    FROM TRABALHA AS trab
    WHERE trab.essn = emp.ssn
  );

-- e)
SELECT pnome, unome
FROM  EMPREGADO AS emp
WHERE NOT EXISTS (
    SELECT 1
    FROM DEPENDENTE AS dep
    WHERE dep.essn = emp.ssn
  );

-- f)
SELECT emp.unome
FROM DEPARTAMENTO AS dept
JOIN EMPREGADO AS emp ON dept.gerssn = emp.ssn
WHERE NOT EXISTS (
    SELECT 1
    FROM DEPENDENTE AS dep
    WHERE dep.essn = emp.ssn
  );

-- g)
SELECT pnome, unome
FROM EMPREGADO
WHERE ssn IN (
    SELECT gerssn
    FROM DEPARTAMENTO
    WHERE gerssn IN (
        SELECT essn
        FROM DEPENDENTE
    )
  );


