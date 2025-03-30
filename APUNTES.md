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
