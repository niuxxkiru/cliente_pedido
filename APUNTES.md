| DDL  |DML   |DCL   |TCL   |
| ------------ | ------------ | ------------ | ------------ |
| CREATE  |SELECT   | GRANT  |COMMIT   |
|  ALTER | INSERT  |REVOKE   | ROLLBACK  |
| DROP  | UPDATE  |   | SAVEPOINT  |
| TRUNCATE |DELETE | | | | 

### UPDATE
```sql
UPDATE nombre_tabla
SET columna1 = nuevo_valor1, columna2 = nuevo_valor2
WHERE condición;```


###  SELECT junto con INSERT INTO para copiar datos de una tabla a otra.

✅** 1. Crear una copia solo de la estructura:**

```sql
CREATE TABLE nueva_tabla
AS
SELECT *
FROM tabla_original
WHERE 1 = 0;
```
🧠 WHERE 1 = 0 evita que se copien los datos, pero sí se copia la estructura

**✅ 2. Copiar datos con INSERT INTO + SELECT:**

```sql
INSERT INTO nueva_tabla
SELECT *
FROM tabla_original;
```
Esto copia todos los datos de tabla_original a nueva_tabla, si tienen la misma estructura.

**✅ 3. Copiar con filtros o columnas específicas:**

```sql
INSERT INTO nueva_tabla (col1, col2)
SELECT col1, col2
FROM tabla_original
WHERE fecha > '2023-01-01';
```

### DELETE
Elimina filas completas de una tabla.

```sql
DELETE FROM nombre_tabla
WHERE condición;
```
- **Sin WHERE borra todo el contenido de la tabla.**

- **No elimina la tabla en sí, solo los datos.**


```sql
DELETE FROM empleados
WHERE departamento = 'Ventas';
```
👉 Elimina todos los empleados del área de ventas.

### DISTINCT — Eliminar duplicados en resultados
Devuelve solo valores únicos, evitando duplicados en el resultado de un SELECT.

```sql
SELECT DISTINCT columna
FROM tabla;
```

```sql
SELECT DISTINCT ciudad
FROM clientes;
```
👉 Devuelve una sola vez cada ciudad, aunque haya varios clientes de la misma.

### DISTINCTROW — Similar a DISTINCT, pero en todas las columnas de la fila
📌 ¿Cuál es la diferencia?
**DISTINCT**: busca duplicados en las columnas seleccionadas.

**DISTINCTROW**: busca duplicados en la fila completa, como si aplicaras DISTINCT a todas las columnas.

Supongamos esta tabla cliente:

|  ID |NOMBRE   |CIUDAD   |
| ------------ | ------------ | ------------ | 
| 1  | ANA  |  ROSARIO | 
|   2|   JUAN|  CORDOBA |   
|   3|   ANA|  ROSARIO | 
|4| LAURA| MENDOZA
|5|ANA| SALTA

```sql
SELECT DISTINCTROW nombre, ciudad
FROM cliente;
```
|NOMBRE   |CIUDAD|
| ------------ | ------------ |
| ANA  |  ROSARIO | 
|  JUAN|  CORDOBA | 
| LAURA| MENDOZA
|ANA| SALTA

✅ Solo elimina filas si todas las columnas seleccionadas están repetidas. En este caso, aunque "Ana" aparece varias veces, las combinaciones con ciudad son distintas, así que no se eliminan.



### Insertar datos anexados:

```sql
INSERT INTO cliente
SELECT * FROM clientes_madrid;
```
Se refiere a insertar registros (filas) completos desde otra tabla (clientes_madrid) hacia la tabla principal (cliente).

En otras palabras:
Estás “anexando” datos, es decir, agregando registros existentes en otra tabla a cliente.

⚠️ **Ambas tablas (cliente y clientes_madrid) deben tener exactamente las mismas columnas y en el mismo orden**. Si no, mejor usar esta forma:

```sql
INSERT INTO cliente (id_cliente, nombre, direccion, poblacion, ...)
SELECT id_cliente, nombre, direccion, poblacion, ...
FROM clientes_madrid;
```
🔐 Si cliente.id_cliente es una clave primaria, asegurate de que no haya duplicados en clientes_madrid, o el INSERT va a fallar.




## 🔹 Explicación de IN

```sql
SELECT p.articulo, p.precio
FROM producto p
WHERE p.codigo IN (SELECT pp.codigo
                   FROM producto_pedido pp
                   WHERE unidades >= 20);
```
### ✅ Cómo funciona:

#### La subconsulta:

```sql
SELECT pp.codigo FROM producto_pedido pp WHERE unidades >= 20;
```
→ Devuelve una lista de códigos de productos que han sido pedidos en más de 20 unidades.

La consulta principal filtra los productos cuyo** p.codigo **esté en la lista de la subconsulta.

Entonces, el IN filtra los productos cuyo codigo sea uno de esos valores.

### 🔹 Por qué = devuelve toda la tabla
Si reemplazas IN por =, como esto:

```sql
SELECT p.articulo, p.precio
FROM producto p
WHERE p.codigo = (SELECT pp.codigo
                  FROM producto_pedido pp
                  WHERE unidades >= 20);
```
🚨 Aquí está el problema:

= espera un único valor, no una lista.

Si la subconsulta devuelve más de un resultado, MySQL lanza un error:
**Error Code: 1242. Subquery returns more than 1 row**

Pero si la subconsulta solo devuelve un valor, el filtro funcionará correctamente.

🛠 Solución si quisieras usar =:

Asegurarte de que la subconsulta siempre devuelva un solo valor, por ejemplo:

```sql
WHERE p.codigo = (SELECT pp.codigo
                  FROM producto_pedido pp
                  WHERE unidades >= 20
                  LIMIT 1);
```
				  
Pero esto cambia el significado de la consulta y solo devolverá productos asociados a un solo código.

### 📌 Conclusión:

Usa **IN** cuando la subconsulta devuelve varios valores.

Usa **=**  solo si la subconsulta devuelve un único valor.


