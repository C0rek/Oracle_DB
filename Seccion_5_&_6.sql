/* CURSO: BASE DE DATOS ORACLE DATABASE BY VICTOR RAMOS
SITIO: UDEMY
FECHA: 03/04/2024 */
/*Seccion 5: Operadores en Oracle */

/* Operadores en Oracle Clase-18 */

/* OPERADORES:
   OPERADORES ARITMETICOS
   OPERADORES RELACIONALES O DE COMPARACION
   OPERADORES DE CONCATENACION
   OPERADORES LOGICOS */

/* Operadores Aritmeticos Clase-19 */
/* Permiten hacer calculos con valores numericos (+,-,*,/)*/
CREATE TABLE TB_NOTAS_ALUMNOS (CODIGO_AL NUMBER (3,0),
                               NOMBRE_AL VARCHAR(50),
                               CURSO_AL VARCHAR(30),
                               NOTA1 NUMBER(2,0),
                               NOTA2 NUMBER(2,0),
                               NOTA3 NUMBER(2,0),
                               PROMEDIO NUMBER(5,2));

SELECT * FROM TB_NOTAS_ALUMNOS;

INSERT INTO tb_notas_alumnos VALUES (1,'CARLOS','MATEMATICAS', 13, 14, 17, 0);
INSERT INTO tb_notas_alumnos VALUES (1,'MARIA','MATEMATICAS', 15, 11, 15, 0);
UPDATE tb_notas_alumnos SET CODIGO_AL=2 WHERE nombre_al='MARIA'; /* corrijo error linea 25 codigo_al=2*/
INSERT INTO tb_notas_alumnos VALUES (3,'CESAR','MATEMATICAS', 16, 13, 10, 0);

SELECT CODIGO_AL, NOMBRE_AL, NOTA1+NOTA2+NOTA3 FROM tb_notas_alumnos;
SELECT CODIGO_AL, NOMBRE_AL, (NOTA1+NOTA2+NOTA3) AS SUMATORIA_NOTAS FROM tb_notas_alumnos;

SELECT CODIGO_AL, 
       NOMBRE_AL,
       (NOTA1+NOTA2) AS ACUMULADO_NOTA1_NOTA2,
       NOTA3,
       (NOTA1+NOTA2)-NOTA3 AS ACUMULADO_NOTA1_NOTA2_MENOS_NOTA3
       FROM tb_notas_alumnos;
       
SELECT CODIGO_AL, 
       NOMBRE_AL,
       (NOTA1*NOTA2) AS MULTIPLICACION
       FROM tb_notas_alumnos;

SELECT CODIGO_AL, 
       NOMBRE_AL,
       CURSO_AL,
       (NOTA1+NOTA2+NOTA3)/3 AS PROMEDIO    /*DECIMALES INFINITOS*/
FROM tb_notas_alumnos;

SELECT CODIGO_AL, 
       NOMBRE_AL,
       CURSO_AL,
       ROUND(((NOTA1+NOTA2+NOTA3)/3),2) AS PROMEDIO    /*DECIMALES REDONDEADOS A 2*/
FROM tb_notas_alumnos;

/* Operadores Relacionales o de Comparacion Clase-20 */
/* Los operadores son:
   = IGUAL
   <> DISTINTO
   > MAYOR
   < MENOR
   >= MAYOR O IGUAL 
   <= MENOR O IGUAL */
SELECT * FROM TB_NOTAS_ALUMNOS WHERE NOTA1=15;  /* IGUAL A 15*/
SELECT * FROM TB_NOTAS_ALUMNOS WHERE NOTA1<>15; /* DISTINTO A 15*/
SELECT * FROM TB_NOTAS_ALUMNOS WHERE NOTA1>15;  /* MAYOR A 15*/
SELECT * FROM TB_NOTAS_ALUMNOS WHERE NOTA1<15;  /* MENOR A 15*/
SELECT * FROM TB_NOTAS_ALUMNOS WHERE NOTA1>=13; /* MAYOR O IGUAL A 13*/
SELECT * FROM TB_NOTAS_ALUMNOS WHERE NOTA1<=15; /* MENOR O IGUAL A 15*/

/* Operadores Concatenacion Clase-21 */
/* Operador de concatenacion (" || ")*/
SELECT * FROM tb_notas_alumnos;

SELECT codigo_al,
       nombre_al || curso_al    /* COMBINO NOMBRE_AL + CURSO_AL EN LA MISMA SALIDA */
FROM tb_notas_alumnos;

SELECT codigo_al,
       nombre_al || ' - ' || curso_al /* AGREGO ESPACIOS ENTRE LAS CATEGORIAS */
FROM tb_notas_alumnos;

SELECT codigo_al,
       (nombre_al || ' - ' || curso_al) AS NOMRE_CURSO
FROM tb_notas_alumnos;

/* Operadores logicos Clase-22 */
/* AND, significa 'y'
   OR, significa 'y/o'
   NOT, significa 'no', invierte el resultado
   (), parentesis (influye) */
SELECT * FROM tb_notas_alumnos;
/* POR TABLA DE VALORES :
   OPERADOR AND -> SI P Y Q SON VERDADEROS, SALIDA = VERDADERA. DEMAS CASOS = FALSO 
   OPERADOR OR -> SI P Y Q SON FALSOS, SALIDA = FALSA. DEMAS CASOS = VERDADEROS
   OPERADOR NOT -> NIEGA LOS VALORES : FALSO -> VERDADERO */

SELECT * FROM tb_notas_alumnos WHERE NOTA1>=13 AND NOTA2>=13;

SELECT * FROM tb_notas_alumnos WHERE NOTA2=13 OR NOTA3>10;

SELECT * FROM tb_notas_alumnos WHERE NOT NOTA1>=15;

SELECT * FROM tb_notas_alumnos WHERE (NOTA1>=10 AND NOTA1<=13) OR NOTA2>12;     /* EVALUO PRIMERO LOS () Y DESPUES EL OR*/

/*Seccion 6: Guardar cambios en Oracle */
/* COMMIT Clase-23 */
INSERT INTO tb_medidas VALUES (2,'KGS', 'KILOGRAMOS');
/* F11 PARA CONFIRMAR Y GUARDAR 
   O
   COMMIT; */