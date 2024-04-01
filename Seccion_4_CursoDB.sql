/*
CURSO: BASE DE DATOS ORACLE DATABASE BY VICTOR RAMOS
SITIO: UDEMY
FECHA: 01/04/2024 */
/*Seccion 4: Registros de tablas*/

/*INSERTAR REGISTRO EN TABLAS -01 CLASE-13*/

/*DEFINICION DE INSERT INTO
INSERT INTO NOMBRETABLA (NOMBRECAMPO,... ,NOMBRECAMPOn)
VALUES (VALORCAMPO1, ..., VALORCAMPOn);*/

INSERT INTO TB_CATEGORIAS(CODIGO_CA, DESCRIPCION_CA)
                    VALUES(1,'OFICINAS');
INSERT INTO TB_CATEGORIAS(CODIGO_CA, DESCRIPCION_CA)
                    VALUES(2,'HOGARES');
INSERT INTO TB_CATEGORIAS(CODIGO_CA, DESCRIPCION_CA)
                    VALUES(3,'EVENTOS');
INSERT INTO TB_MEDIDAS(CODIGO_ME,ABREVIATURA_ME,DESCRIPCION_ME)
                    VALUES(1,'UND','UNIDADES');
INSERT INTO TB_MEDIDAS(CODIGO_ME,ABREVIATURA_ME,DESCRIPCION_ME)
                    VALUES(2,'KGS','KILOGRAMOS');
INSERT INTO TB_MEDIDAS(CODIGO_ME,ABREVIATURA_ME,DESCRIPCION_ME)
                    VALUES(3,'MTS','METROS');
INSERT INTO TB_MEDIDAS(CODIGO_ME,ABREVIATURA_ME,DESCRIPCION_ME)
                    VALUES(4,'LTS','LITROS');

/*INSERTAR REGISTROS EN TABLAS -02 CLASE-14*/
INSERT INTO TB_ARTICULOS(CODIGO_AR, 
                         DESCRIPCION_AR,
                         MARCA_AR,
                         CODIGO_ME,
                         CODIGO_CA)
                         VALUES(1,
                                 'COMPUTADOR',
                                 'LENOVO',
                                 1,
                                 1);
INSERT INTO TB_ARTICULOS(CODIGO_AR, 
                         DESCRIPCION_AR,
                         MARCA_AR,
                         CODIGO_ME,
                         CODIGO_CA)
                         VALUES(3,
                                 'REFRIGERADOR',
                                 'LG',
                                 1,
                                 2);
INSERT INTO TB_ARTICULOS(CODIGO_AR, 
                         DESCRIPCION_AR,
                         MARCA_AR,
                         CODIGO_ME,
                         CODIGO_CA)
                         VALUES(4,
                                 'MICROONDAS',
                                 'LG',
                                 1,
                                 2);
INSERT INTO TB_ARTICULOS(CODIGO_AR, 
                         DESCRIPCION_AR,
                         MARCA_AR,
                         CODIGO_ME,
                         CODIGO_CA)
                         VALUES(5,
                                 'MESA EVENTO',
                                 'ESTANDAR',
                                 1,
                                 3);
INSERT INTO TB_ARTICULOS(CODIGO_AR, 
                         DESCRIPCION_AR,
                         MARCA_AR,
                         CODIGO_ME,
                         CODIGO_CA)
                         VALUES(6,
                                 'ESCRITORIO',
                                 'ESTANDAR',
                                 1,
                                 1);

/*ACTUALIZAR REGISTRO DE TABLAS CLASE-15*/
/*UPDATE NOMBRETABLA SET CAMPO=NUEVOVALOR;*/
UPDATE TB_ARTICULOS SET MARCA_AR='CANON' WHERE CODIGO_AR=2;
UPDATE TB_ARTICULOS SET MARCA_AR='SAMSUNG' WHERE CODIGO_AR IN (3,4);
UPDATE TB_ARTICULOS SET DESCRIPCION_AR = CONCAT('* ',DESCRIPCION_AR)
                WHERE MARCA_AR='ESTANDAR';

/*BORRAR REGISTROS DE TABLAS CLASE-15*/
/*DELETE FROM TABLA;*/
DELETE FROM  TB_ARTICULOS WHERE CODIGO_AR IN (5,6);
DELETE FROM TB_ARTICULOS WHERE CODIGO_AR>4;
DELETE FROM TB_ARTICULOS WHERE MARCA_AR = 'ESTANDAR';

DELETE FROM TB_MEDIDAS WHERE CODIGO_ME=1; /*NO PUEDO PORQUE HAY DEPENDENCIA*/
DELETE FROM TB_MEDIDAS WHERE CODIGO_ME IN (2,3,4); /*CODIGO_ME>1*/

/*CONSULTA DE REGISTROS EN TABLAS CLASE-16*/
/*SELECT * FROM NOMBRETABLA;
SELECT * COLUMNASDEINFORMACION FROM NOMBRETABLA*/
SELECT * FROM TB_MEDIDAS;
SELECT * FROM TB_ARTICULOS;
SELECT * FROM TB_ARTICULOS WHERE CODIGO_CA=2;

SELECT CODIGO_AR,
       DESCRIPCION_AR,
       MARCA_AR
FROM TB_ARTICULOS WHERE CODIGO_CA=2;

SELECT *
FROM TB_ARTICULOS WHERE MARCA_AR IN ('LENOVO','CANON');

SELECT *
FROM TB_ARTICULOS WHERE NOT MARCA_AR IN ('LENOVO','CANON');

SELECT *
FROM TB_ARTICULOS WHERE DESCRIPCION_AR LIKE 'R%'; /* %INDICA QUE PUEDE SEGUIR CUALQUIER LETRA*/

SELECT *
FROM TB_ARTICULOS WHERE DESCRIPCION_AR LIKE 'RI%';

/* FIN SECCION 4 */