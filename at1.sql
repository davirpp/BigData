-- Respostas Lab01, AT1


-- Questão 1
-- a) Respeitou a integridade referencial em superssn e dno, 
--    respeitou os not null's e respeitou a chave primária
INSERT INTO EMPREGADO
VALUES (
  '943775543', 'Roberto', 'F', 'Silva', 'M',
  'Rua X, 22 – Araucária – PR', '1952-06-21',
  '888665555', '1', 58000
);

-- b) A chave estrangeira dnum nao existe na tabela DEPARTAMENTO na coluna dnumero
--    (não tem o dep '2'), respeitou os not null's e respeitou a chave primária
INSERT INTO PROJETO
VALUES ('4', 'ProdutoA', 'Araucaria', '2');

-- c) A chave primária dnumero (4) ja existe, respeitou os not null's,
--    após a inserção do a, respeita a referência da tabela empregado
INSERT INTO DEPARTAMENTO
VALUES ('4', 'Produção', '943775543', '1998-10-01');

-- d) A coluna pno não pode ser nula, a coluna essn não existe na tabela EMPREGADO
INSERT INTO TRABALHA
VALUES ('677678989', NULL, 40.0);

-- e) Respeitou os not null's, respeitou a chave primária, respeitou a 
--   integridade referencial em essn e nomedep
INSERT INTO DEPENDENTE
VALUES ('453453453', 'Joao', 'M', '1970-12-12', 'CONJUGE');

-- f) Sem problemas
DELETE FROM TRABALHA
WHERE essn = '333445555';

-- g) Esse empregado existe na tabela TRABALHA como FK e também como 
--    superssn em EMPREGADO como FK, logo, não pode ser excluído
DELETE FROM EMPREGADO
WHERE ssn = '987654321';

-- h) Esse projeto existe na tabela TRABALHA como FK, logo, não pode ser excluído
DELETE FROM PROJETO
WHERE pjnome = 'ProdutoX';

-- i) Sem problemas
UPDATE DEPARTAMENTO
SET gerssn = '123456789',
    gerdatainicio = '1999-01-10'
WHERE dnumero = '5';

-- j) Sem problemas
UPDATE EMPREGADO
SET superssn = '943775543'
WHERE ssn = '999887777';

-- l) Sem problemas
UPDATE TRABALHA
SET horas = 5.0
WHERE essn = '999887777' AND pno = '10';
