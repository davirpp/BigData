# Lab 02 - AT1

## INNER JOIN

```sql
SELECT *
FROM TABELA_A
INNER JOIN TABELA_B
ON TABELA_A.CODIGO = TABELA_B.CODIGO;
```

### Resultado
- Retorna apenas empresas que existem nas duas tabelas (CODIGO 1, 2, 3 e 5)
- O CODIGO 4 da TABELA_A e o CODIGO 8 da TABELA_B ficam de fora


| CODIGO | NOME  | ID | CODIGO | VALOR |
|:----------:|:----------:|:----------:|:----------:|:----------:|
| 1      | UM    | 1  | 1      | 1.000 |
| 1      | UM    | 2  | 1      | 2.000 |
| 1      | UM    | 3  | 1      | 5.000 |
| 2      | DOIS  | 4  | 2      | 4.000 |
| 2      | DOIS  | 5  | 2      | 9.000 |
| 3      | TRES  | 6  | 3      | 7.000 |
| 5      | CINCO | 7  | 5      | 4.000 |


## LEFT JOIN

```sql
SELECT *
FROM TABELA_A
LEFT JOIN TABELA_B
ON TABELA_A.CODIGO = TABELA_B.CODIGO;
```

### Resultado
- Retorna todos os registros de TABELA_A
- Inclui o CODIGO 4 que não tem correspondência na TABELA_B
- Para registros sem correspondência, os campos da TABELA_B aparecem como NULL

| CODIGO | NOME   | ID   | CODIGO | VALOR |
|:----------:|:----------:|:----------:|:----------:|:----------:|
| 1      | UM     | 1    | 1      | 1.000 |
| 1      | UM     | 2    | 1      | 2.000 |
| 1      | UM     | 3    | 1      | 5.000 |
| 2      | DOIS   | 4    | 2      | 4.000 |
| 2      | DOIS   | 5    | 2      | 9.000 |
| 3      | TRES   | 6    | 3      | 7.000 |
| 4      | QUATRO | NULL | NULL   | NULL  |
| 5      | CINCO  | 7    | 5      | 4.000 |


## RIGHT JOIN
```sql
SELECT *
FROM TABELA_A
RIGHT JOIN TABELA_B
ON TABELA_A.CODIGO = TABELA_B.CODIGO;
```

### Resultado
- Retorna todos os registros de TABELA_B
- Inclui o CODIGO 8 que não tem correspondência na TABELA_A
- Não inclui o CODIGO 4 que não tem correspondência na TABELA_B
  
| CODIGO | NOME  | ID | CODIGO | VALOR |
|:----------:|:----------:|:----------:|:----------:|:----------:|
| 1      | UM    | 1  | 1      | 1.000 |
| 1      | UM    | 2  | 1      | 2.000 |
| 1      | UM    | 3  | 1      | 5.000 |
| 2      | DOIS  | 4  | 2      | 4.000 |
| 2      | DOIS  | 5  | 2      | 9.000 |
| 3      | TRES  | 6  | 3      | 7.000 |
| 5      | CINCO | 7  | 5      | 4.000 |
| NULL   | NULL  | 8  | 8      | 7.000 |


## FULL OUTER JOIN

```sql
SELECT *
FROM TABELA_A
FULL OUTER JOIN TABELA_B
ON TABELA_A.CODIGO = TABELA_B.CODIGO;
```

### Resultado
- Retorna todos os registros de ambas as tabelas
- Inclui o CODIGO 4 da TABELA_A e o CODIGO 8 da TABELA_B

| CODIGO | NOME   | ID   | CODIGO | VALOR |
|:----------:|:----------:|:----------:|:----------:|:----------:|
| 1      | UM     | 1    | 1      | 1.000 |
| 1      | UM     | 2    | 1      | 2.000 |
| 1      | UM     | 3    | 1      | 5.000 |
| 2      | DOIS   | 4    | 2      | 4.000 |
| 2      | DOIS   | 5    | 2      | 9.000 |
| 3      | TRES   | 6    | 3      | 7.000 |
| 4      | QUATRO | NULL | NULL   | NULL  |
| 5      | CINCO  | 7    | 5      | 4.000 |
| NULL   | NULL   | 8    | 8      | 7.000 |

