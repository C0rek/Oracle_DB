/* CURSO: BASE DE DATOS ORACLE DATABASE BY VICTOR RAMOS
SITIO: UDEMY
FECHA: 09/04/2024 */
/* Seccion 13: Procedimientos almacenados */
/* Procedimientos almacenados parte01 Clase-42 */

/*
CREACION DE PROCEDIMIENTOS ALMACENADOS:
    * ES UN CONJUNTO DE SENTENCIA.
    * ES UN CONJUNTO DE TAREA O TAREAS.
    * ES UN CONJUNTO DE PROCESOS DE CODIFICACION.
    * ES UN CONJUNTO DE INSTRUCCIONES.
    
    INSERT,
    UPDATE,
    DELETE
    
SINTAXIS:
CREATE OR REPLACE PROCEDURE NOMBREPROCEDIMIENTO (PARAMETRO IN TIPODATO) -> ELIMINAR EL 'OR REPLACE'
  AS
   NOMBREVARIABLE TIPO;
  BEGIN
   INSTRUCCIONES;
  END;
*/

/* Procedimientos almacenados parte02 Clase-43 */

create procedure insertar_un_registro_me
as
begin
    insert into tb_medidas(codigo_me, 
                           abreviatura_me, 
                           descripcion_me)
                           values(3,
                                  'LT',
                                  'LITROS');
    commit;                                  
end;

execute insertar_un_registro_me;    /* Llamo al registro */

/* Procedimientos almacenados parte03 Clase-44 */
create procedure crud_medidas_categorias
as
begin
    insert into tb_medidas(codigo_me, 
                           abreviatura_me, 
                           descripcion_me)
                            values
                           (4,'MT','METROS');
    update tb_categorias set descripcion_ca='EVENTOS 2023'
        where codigo_ca=3;
    commit;
end;

execute crud_medidas_categorias;

/* Procedimientos almacenados parte04 Clase-45 */
/* PROCEDIMIENTOS ALMACENADOS : PARAMETROS

Hay tres tipos de parametros que se pueden declarar:

1) Parametro tipo IN: Estos tipos de parametros se utilizan para enviar valores
a procedimientos almacenados por lo tanto su valor de parametros no puede ser reemplazado.

2) Parametro tipo OUT: Estos tipos de parametros se utilizan para obtener valores 
de los procedimientos almacenados. Por consiguiente es similar a un tipo de retorno en funciones.

3) Parametro IN OUT: Estos tipos de parametros se utilizan para enviar valores aunque 
tambien para obtener valores en los procedimientos almacenados

NOTA: Si un parametro no se define explicitamente un tipo de parametro,
entonces por defecto es un parametro IN 

CREATE PROCEDURE nombre_procedimiento
(<param1> [IN|OUT|IN OUT] <type>,
 <param2> [IN|OUT|IN OUT] <type>,...)

IS / AS
-- Declaraciion de variables locales
BEGIN 
-- Sintaxis o cuerpo del procedimiento
EXCEPTION
-- Sentencias control de excepcion
END nombre_procedimiento
*/

/* Procedimientos almacenados parte05 Clase-46 */
select * from tb_categorias
insert into tb_categorias (codigo_ca, descripcion_ca) values (4,'OTROS');
insert into tb_categorias (codigo_ca, descripcion_ca) values (5,'CATEGORIA NUEVA');

create or replace procedure actualizar_ca
(pcodigo in int,
 pdescripcion in varchar)
as
begin
    update tb_categorias set descripcion_ca = pdescripcion
                            where codigo_ca=pcodigo;
    commit;
end;

execute actualizar_ca(3,'EVENTOS ESPECIALES');
execute actualizar_ca(4,'EVENTOS GENERALES');
execute actualizar_ca(5,'EVENTOS SOCIALES');

/* Procedimientos almacenados parte06 Clase-47 */
select * from tb_articulos;

create or replace NONEDITIONABLE procedure guardar_ar (pCODIGO_AR number,
                             pDESCRIPCION_AR varchar2,
                             pMARCA_AR varchar2,
                             pCODIGO_ME number,
                             pCODIGO_CA number,
                             pSTOCK_ACTUAL number,
                             pFECHA_REGISTRO DATE,
                             pACTIVO number)
as
begin
    insert into tb_articulos(codigo_ar,
                             descripcion_ar,
                             marca_ar,
                             codigo_me,
                             codigo_ca,
                             stock_actual,
                             fecha_registro,
                             activo)
                        values
                         (pCODIGO_AR,
                        pDESCRIPCION_AR,
                        pMARCA_AR,
                        pCODIGO_ME,
                        pCODIGO_CA,
                        pSTOCK_ACTUAL,
                        pFECHA_REGISTRO,
                        pACTIVO);
    Commit;
end;

execute guardar_ar(7,'NUEVO ARTICULO','MARCA NUEVA',1,4,5,'08/04/2024',1);

/* Procedimientos almacenados parte07 Clase-48 */
create or replace procedure buscar_nota_al(pcodigo_alumno in number,
                                pNota1 out number)
as
begin
    select nota1 into pNOta1 
    from tb_notas_alumnos
    where codigo_al=pcodigo_alumno;
end;

var vNota1 number;
execute buscar_nota_al(4,:vNota1);
print vNota1;

/* Procedimientos almacenados parte08 Clase-49 */
create procedure proc_descripcion_me (p01 in varchar2,
                                      p02 out varchar2)
as
begin
    select descripcion_me into p02 
    from tb_medidas
    where abreviatura_me=p01;
end;

var v01 varchar2;
execute proc_descripcion_me('UND', :v01);
print v01;

/* Procedimientos almacenados parte09 Clase-50 */
create procedure buscar_descripcion_me(p01 in out varchar)
as
begin
    select descripcion_me into p01
    from tb_medidas
    where abreviatura_me = p01;
end;

/* Seccion 14: Funciones definidas por el usuario */
/* Funciones parte01 Clase-51 */

/*  *** SINTAXIS ***
create o replace function NOMBREFUNCION (PARAMETRO1 TIPODATO, PARAMETRON TIPODATO)
 return TIPODATO is
  DECLARACION DE VARIABLES
 begin
  ACCIONES;
  return VALOR;
end;
*/
create or replace function f_sumar(p01 number,p02 number)
return number
as
begin
    return (p01+p02);
end;

create or replace function f_mayuscula(texto varchar2)
return varchar2
as
begin
    return upper(texto);
end;

/* Funciones parte02 Clase-52 */
/* DEFINIR UNA FUNCION QUE PERMITA AVALUAR MI EDAD:
SI MI EDAD ES < 18 -> SOY MENOR DE EDAD
SI MI EDAD ES > 18 -> SOY MAYOR */

create or replace function f_evaluar_edad(pedad number)
return varchar2
as
    v_retorno varchar2(50);
begin
    v_retorno:='';
    if pedad<18 then
        v_retorno:='ERES MENOR DE EDAD';
    else 
        v_retorno:='ERES UN ADULTO';
    end if;
    return v_retorno;
end;

/* Seccion 15: Final del curso */
/* Final del curso Clase-53 */