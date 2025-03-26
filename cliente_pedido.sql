USE CLIENTE_PEDIDO;
SELECT * FROM pedido;
SELECT * FROM producto_nuevo;
DESC producto_pedido;

ALTER TABLE pedido 
MODIFY COLUMN enviado boolean;

SELECT P.seccion, P.articulo, P.precio
FROM Producto P WHERE P.seccion like '%ceramica%' or P.seccion like '%deportes%'
ORDER BY P.seccion, P.precio;

SELECT c.direccion, c.telefono,c.poblacion as "residencia"
FROM CLIENTE C ORDER BY c.poblacion desc;


SELECT p.seccion, AVG (P.PRECIO) as "promedio_precio", sum(P.precio) as total
FROM  PRODUCTO P
where p.seccion like '%deportes%' or p.seccion like '%ceramica%'
group by p.seccion
order by total;

SELECT p.seccion, AVG (P.PRECIO) as "promedio_precio", sum(P.precio) as total
FROM  PRODUCTO P
group by p.seccion
having p.seccion like '%deportes%' or p.seccion like '%ceramica%'
order by promedio_precio;

select p.seccion, avg (p.precio) as "promedio_precio", sum(P.precio) as total
from producto p
group by p.seccion
having p.seccion not like '%jugueteria%'
order by total;

select p.seccion, count(p.articulo) as articulo
from producto p
group by p.seccion
having p.seccion like '%deportes%';




select p.articulo,p.seccion, p.precio, ROUND((p.precio*0.93), 2) as DESCUENTO_7
from producto p;

create table producto_pedido (
nro int,
codigo varchar(40),
constraint prod_ped_pk primary key (nro, codigo),
foreign key(nro) references pedido(nro),
foreign key (codigo) references producto(codigo));
alter table producto_pedido add column unidades int;



ALTER TABLE producto_nuevo MODIFY COLUMN importado boolean;

-- muestra todos los cl con sus pedidos. hay valores null xq hay cl q no hicieron pedidos 
select*
from cliente c left join pedido p on c.codigo=p.cod_cliente;

-- muestra todos los pedidos con cl. En este caso, no puede haber pedidos realizados con clientes q no existen x eso no hay valores null
select*
from cliente c join pedido p on c.codigo=p.cod_cliente;

-- filtra los cl de madrid q no tienen pedidos
select c.codigo, c.poblacion, c.direccion,p.nro, p.cod_cliente, p.pago
from cliente c left join pedido p on c.codigo=p.cod_cliente
where c.poblacion like '%madrid%' and p.cod_cliente is null;



