/* CURSO: BASE DE DATOS ORACLE DATABASE BY VICTOR RAMOS
SITIO: UDEMY
FECHA: 04/04/2024 */
/*Seccion 7: Tipos de funciones */

/* Funciones string o de cadena Clase-24 */
/* Funciones que se encuentran en Oracle Database
   * Funciones string o de cadena
   * Funciones numericas
   * Funciones fecha y hora 
*/
select * from dual; /* Tabla especial. Utili para generar resultados de una sola fila */
select 'Hola mundo' from dual;

/* Funciones de string o de cadena */
/*select concat(Elemento1, Elemento2, Elemento3) from dual;*/

select concat ('Hola tomas', 'Curso de base de datos Oracle Database') from dual;
select chr(65) from dual; /* CHR retorna un codigo equivalente ASCII -> Retorna 'A'*/ 
select chr(64) from dual; /* Retorna @ */
select initcap ('hola tomas rodriguez') from dual; /* Retorna primera letra de cada palabra en mayusc */
select upper ('hola tomas rodriguez') from dual; /* Retorna cada palabra en mayusc */
select lower ('HOLA TOMAS RODRIGUEZ') from dual; /* Retorna cada palabra en minuscula */

/* Funciones string o de cadena - Parte02 Clase-25 */
/* Realizar un 'rellenado' 
    sintexis Lpad (expresion_texto, cant_relleno, texto_relleno)
    RESULTADO FINAL = xxxxxTomas
*/

select lpad('Tomas', 11, 'x') from dual; /* Tomas tiene 5 cartacteres que suman al total del relleno*/

select concat('BOL-',LPAD('1', 5, '0')) from dual;

/* Realizar un 'rellenado' a la derecha
    sintexis Rpad (expresion_texto, cant_relleno, texto_relleno)
    RESULTADO FINAL = Tomasxxxxx
*/
select rpad('Tomas',9,'x') from dual;

select rpad('P',10,'0') from dual;

select concat(rpad('P',10,'0'),'1') from dual;

/* Realizar espacios en blanco derecha-izq */
/* Funcion Ltrim() -> IZQ,  Rtrim() -> DER */
select concat(rtrim('tomas   '), 'rene') from dual;
select concat(rtrim('tomas   '), ltrim('       rene')) from dual;

/* Funcion replace( expresion_texto, caracter_buscado, caracter_reemplazo) */
select 'WWW.GRUPODATSOFT.NET' from dual;

select replace('WWW.GRUPODATSOFT.NET', 'W', 'L') from dual;  /* Case Sensitivity -> no encontrara 'w' sino que encontrara 'W'*/

/* Funciones string o de cadena - Parte03 Clase-26 */
/* Funcion: substr( expresion_texto, posicion_inicial, cantidad_caracteres )*/
select substr('curso de base de datos oracle database', 10, 13) from dual; /* Sustrae caracteres de una expresion */

select length('curso de base de datos oracle database') from dual; /* Obtener cantidad de caracteres con espacios en blanco */

/* Funcion: instr( cadena, subcadena). 
   Busca un contenido dentro de un texto y devuelve el numero de la primera coincidencia 
   Si no encuentra da 0*/
select instr('curso de base de datos','de') from dual; /* Case Sensitivity */

/* Funcion: translate( expresion_texto, contenido_a_buscar, contenido_de_reemplazo ) 
   Remplaza los caracteres */
select translate('curso de base de datos', 'oes', '035') from dual; /* Case Sensitivity */

/* Funciones numericas - Parte01 Clase-27 */
select round(135.657,1) from dual; /* Redondea el numero */
select trunc(135.657,2) from dual; /* Trunca/Recorta el numero */

select 11/2 from dual; /* devuelve con 'residuo'. No como entero */
select mod(11,3) from dual; /* devuelve el residuo */

/* Funciones numericas - Parte02 Clase-28 */
select * from tb_articulos;
select count(codigo_ar) as total from tb_articulos; /* Devuelve la cantidad de registros que tiene la tabla */

/* Agrego valores que faltaban en la tabla
insert into tb_articulos(codigo_ar, descripcion_ar, marca_ar, codigo_me, codigo_ca) 
            values (4,'MICROONDAS','SAMSUNG', 1, 2); */
select sum(codigo_ar) as total from tb_articulos; /* Devuelve la suma total de toda la categoria */
select min(codigo_ar) as valor_minimo from tb_articulos; /* Devuelve el valor minimo de toda la categoria */
select max(codigo_ar) as valor_maximo from tb_articulos; /* Devuelve el valor maximo de toda la categoria */
select avg(codigo_ar) as valor_promedio from tb_articulos; /* Devuelve el valor de promedio de toda la categoria */

/* Funcion Fecha y Hora - Parte01 Clase-29 */
select current_date from dual; /* Devuelve fecha actual */

select add_months(current_date,1) from dual; /* Devuelve fecha actual + 1 mes */

select add_months('01/12/2022',2) from dual; /* funciona tambien con fecha determinada */

/* last_day() Devuelve ultimo dia del mes */
select last_day('01/12/2022') from dual;
select last_day('01/02/2022') from dual;

/* months_between(f1,f2) Devuelve ultimo dia del mes
    f1= fecha maxima
    f2= fecha minima
*/
select months_between('01/07/2022','01/01/2022') from dual;

/* Funcion Fecha y Hora - Parte02 Clase-30 */
/* next_day(fecha,dia) Devuelve la fecha de cuando sera el proximo dia ('Jueves') */
select next_day('4/4/2024','Jueves') from dual;
select next_day('4/4/2024','Viernes') from dual; /* siguiente Viernes mas cerca, es el dia siguiente */
select next_day('4/4/2024','Lunes') from dual;   /* siguiente Lunes mas cerca */

select sysdate from dual; /* Devuelve fecha del sistema */
select current_timestamp from dual; /* Devuelve fecha del sistema, con hora y con ubicacion */
select systimestamp from dual; /* Devuelve fecha del sistema con hora */

/* extract (parte, fecha) */
select extract(month from sysdate) from dual; /* Devuelve solo el Mes de systate */

select extract(day from sysdate) from dual; /* Devuelve el dia */

select extract(year from sysdate) from dual; /* Devuelve el ano */

/* Funcion Fecha y Hora - Parte03 Clase-31 */
select concat(sysdate, ' fecha actual') from dual;

select to_char(sysdate) from dual; /* Convierto la fecha a string */
select concat(to_char(sysdate), ' Fecha del Sistema') from dual;

select to_date('19/12/2022') from dual; /* 19/12/2022 estaria en string y deberia pasarlo a tipo fecha*/
select to_date('19/12/2022')+2 from dual; /* ya en tipo fecha puedo operar con las funciones */

commit; /* Actualizo los datos */