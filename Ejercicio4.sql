Ejercicio 4
Nivel de dificultad: Experto

/* 1. Crea una tabla llamada "Pedidos" con las columnas: "id" (entero, clave
primaria), "id_usuario" (entero, clave foránea de la tabla "Usuarios") y
"id_producto" (entero, clave foránea de la tabla "Productos"). */


CREATE TABLE pedidos (
  pedidos_id INT AUTO_INCREMENT PRIMARY KEY,
  usuario_id INT,
  producto_id INT,
  FOREIGN KEY (usuario_id) REFERENCES usuarios(id),
  FOREIGN KEY (producto_id) REFERENCES productos(id)
)

/* 2. Inserta al menos tres registros en la tabla "Pedidos" que relacionen usuarios con
productos. */

INSERT INTO pedidos (usuario_id, producto_id)
VALUES (12,5),
(3,7),
(11,23),
(12,13);


/* 3. Realiza una consulta que muestre los nombres de los usuarios y los nombres de
los productos que han comprado, incluidos aquellos que no han realizado
ningún pedido (utiliza LEFT JOIN y COALESCE). */


SELECT 
usuarios.nombre,
COALESCE(productos.nombre, 'sin compra') as nombre_de_producto
FROM usuarios
LEFT JOIN pedidos on pedidos.usuario_id = usuarios.id
LEFT JOIN productos on productos.id = pedidos.producto_id;

/* 4. Realiza una consulta que muestre los nombres de los usuarios que han
realizado un pedido, pero también los que no han realizado ningún pedido
(utiliza LEFT JOIN). */

SELECT usuarios.nombre, COUNT(pedidos.id) FROM usuarios
LEFT JOIN pedidos ON pedidos.usuario_id = usuarios.id
GROUP BY usuarios.nombre
HAVING COUNT(pedidos.id) <=1 ;


/* 5. Agrega una nueva columna llamada "cantidad" a la tabla "Pedidos" y actualiza
los registros existentes con un valor (utiliza ALTER TABLE y UPDATE) */

ALTER TABLE pedidos
ADD COLUMN cantidad INT;

UPDATE pedidos
SET cantidad = 10
WHERE id = 3 

