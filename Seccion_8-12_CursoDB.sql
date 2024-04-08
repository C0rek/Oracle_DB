/* CURSO: BASE DE DATOS ORACLE DATABASE BY VICTOR RAMOS
SITIO: UDEMY
FECHA: 05-07/04/2024 */
/* Seccion 8: Generando cambios a las tablas */
/* Generando cambios a las tablas Clase-32 */

select * from tb_articulos;

UPDATE tb_articulos set activo=1;

update tb_articulos set stock_actual=0;

update tb_articulos set fecha_registro = sysdate;

/* Seccion 9: Relaciones de datos de tablas */
/* Relaciones de datos SELECT INNER JOIN Clase-33 */

select tb_articulos.codigo_ar,
       tb_articulos.descripcion_ar,
       tb_articulos.marca_ar,
       tb_articulos.codigo_me,
       tb_categorias.descripcion_ca,
       tb_articulos.stock_actual,
       tb_articulos.fecha_registro
from tb_articulos
inner join tb_categorias on tb_articulos.codigo_ca = tb_categorias.codigo_ca;

/* Relaciones de datos SELECT INNER JOIN Clase-34 Parte2 */
select * from tb_articulos;
select tb_articulos.codigo_ar,
       tb_articulos.descripcion_ar,
       tb_articulos.marca_ar,
       tb_medidas.descripcion_me,
       tb_categorias.descripcion_ca,
       tb_articulos.stock_actual,
       tb_articulos.fecha_registro
from tb_articulos
inner join tb_categorias on tb_articulos.codigo_ca = tb_categorias.codigo_ca
inner join tb_medidas on tb_articulos.codigo_me = tb_medidas.codigo_me;

/* Relaciones de datos SELECT LEFT JOIN Clase-35 */
select tb_categorias.codigo_ca,
       tb_categorias.descripcion_ca,
       tb_articulos.descripcion_ar,
       tb_articulos.marca_ar
from tb_categorias
left join tb_articulos on tb_categorias.codigo_ca=tb_articulos.codigo_ca;

/* Relaciones de datos SELECT RIGHT JOIN Clase-36 */
select a.codigo_ar,
       a.descripcion_ar,
       a.marca_ar,
       b.descripcion_me
from tb_articulos A
right join tb_medidas B on A.codigo_me = B.codigo_me;

/* Seccion 10: Procesos ORDER BY y Clausula WHERE */
/* Select order by Clase-37 */
select * 
from tb_articulos
order by descripcion_ar DESC, marca_ar;

select * 
from tb_articulos       /* -> Ordena respecto a la columna 5, def = ASC */
order by 5;

/* Clausula WHERE Parte01 by Clase-38 */
/* La sintaxis para usar WHERE en la intruccion SQL en la siguiente:
   UPDATE "table_name" SET campo1=dato1 WHERE "condicion";
   DELETE FROM "table_name" WHERE "condicion";
   SELECT * FROM "table_name" WHERE "condicion"
   *** "condicion" puede incluir una unica clausula de comparacion (llamada condicion simple)
   o multiples clausulas de comparacion combinadas
   utilizando los operadores AND u OR (condicion compuesta). 
   
   Ademas, las clausulas WHERE puede especificar una condicion utilizando la comparacion
   o los operadores logicos como >, <, =, LIKE, NOT, etc. */

/* Clausula WHERE Parte02 by Clase-39 */
select * 
from tb_articulos
where stock_actual > 0;

select * 
from tb_articulos
where stock_actual > 0 and codigo_ar=5;

update tb_articulos set stock_actual=tb_articulos.stock_actual+2 
where marca_ar='STANDAR';

delete from tb_articulos where marca_ar='STANDAR' or marca_ar= 'LENOVO';
delete from tb_articulos where marca_ar in ('STANDAR','LENOVO');

/* Seccion 11: Crear vistas */
/* Create view Clase-40 */
/* create view NOMBREVISTA as SUBCONSULTA; */
create view VISTA_ARTICULOS_1 AS
select a.codigo_ar,
       a.descripcion_ar,
       a.marca_ar,
       b.descripcion_me,
       c.descripcion_ca,
       a.stock_actual,
       a.fecha_registro,
       a.activo
from tb_articulos A
inner join tb_medidas B on a.codigo_me=b.codigo_me
inner join tb_categorias C on a.codigo_me=c.codigo_ca
order by a.codigo_ar;

select * from vista_articulos_1;

/* Seccion 12: Agrupamiento de datos de tablas */
/* Select group by Clase-41 */
select a.descripcion_ca,
       count(b.descripcion_ar) as total_articulos
from tb_categorias A
inner join tb_articulos B on a.codigo_ca=b.codigo_ca
group by a.descripcion_ca;

select marca_ar,
       count(descripcion_ar) as total_articulos
from tb_articulos
group by marca_ar;

select curso_al,
       sum(nota1) as total_suma_nota
from tb_notas_alumnos
group by curso_al;

