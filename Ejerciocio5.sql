Ejercicio 5


/* 1. Crea una tabla llamada "Clientes" con las columnas id (entero) y nombre
(cadena de texto). */

CREATE TABLE clientes (
  id INT AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(50)
);


/* 2. Inserta un cliente con id=1 y nombre='John' en la tabla "Clientes". */

INSERT INTO clientes (nombre)
VALUES ('John')


/* 3. Actualiza el nombre del cliente con id=1 a 'John Doe' en la tabla "Clientes". */

UPDATE clientes
SET nombre = 'john Doe'
WHERE id = 1 ;


/* 4. Elimina el cliente con id=1 de la tabla "Clientes". */

DELETE FROM clientes
WHERE id = 1;


/* 5. Lee todos los clientes de la tabla "Clientes". */

SELECT * FROM clientes;


/* 6. Crea una tabla llamada "Pedidos" con las columnas id (entero) y cliente_id
(entero). */

CREATE TABLE pedidos (
id INT AUTO_INCREMENT PRIMARY KEY,
cliente_id INT,
FOREIGN KEY (cliente_id) REFERENCES clientes(id)
);


/* 7. Inserta un pedido con id=1 y cliente_id=1 en la tabla "Pedidos".*/

INSERT INTO clientes(id,nombre)
VALUES (1,'Juan');

INSERT INTO pedidos (id,cliente_id)
VALUES (1,1)


/* 8. Actualiza el cliente_id del pedido con id=1 a 2 en la tabla "Pedidos". */

INSERT INTO clientes (id, nombre)
VALUES (2,'Alberto');

UPDATE pedidos
SET id = 2 
WHERE id = 1;

/* 9. Elimina el pedido con id=1 de la tabla "Pedidos". */

DELETE FROM pedidos
WHERE id = 1;


/* 10. Lee todos los pedidos de la tabla "Pedidos".*/

SELECT * FROM pedidos;


/* 11. Crea una tabla llamada "Productos" con las columnas id (entero) y nombre
(cadena de texto).*/

CREATE TABLE productos (
  id INT AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(255)
);


/* 12. Inserta un producto con id=1 y nombre='Camisa' en la tabla "Productos". */

INSER INTO productos (id,nombre)
VALUES (1,'camisa');


/* 13. Actualiza el nombre del producto con id=1 a 'Pantalón' en la tabla "Productos". */

UPDATE productos 
SET nombre = 'pantalon'
WHERE id = 1;


/* 14. Elimina el producto con id=1 de la tabla "Productos". */

DELETE FROM productos
WHERE id = 1;


/* 15. Lee todos los productos de la tabla "Productos".*/

SELECT * FROM productos;


/* 16. Crea una tabla llamada "DetallesPedido" con las columnas pedido_id (entero) y
producto_id (entero). */

CREATE TABLE detallespedido (
pedido_id INT,
producto_id INT,
FOREIGN KEY (pedido_id) REFERENCES pedidos(id),
FOREIGN KEY (producto_id) REFERENCES productos(id)
);


/* 17. Inserta un detalle de pedido con pedido_id=1 y producto_id=1 en la tabla
"DetallesPedido". */
/* Para poder cumplir con todas las claves externas tengo que crear registros en las otras tablas */

INSERT INTO pedidos (id, cliente_id)
VALUES (1,1);

INSERT INTO productos (id, nombre)
VALUES (1,'martillo');

INSERT INTO detallespedido(pedido_id, producto_id)
VALUES (1,1)


/* 18. Actualiza el producto_id del detalle de pedido con pedido_id=1 a 2 en la tabla
"DetallesPedido".*/
/* Vuelvo a meter un registro en la tabla producto(id) 2 para que pueda cumplirse el registro de producto_id = 2 en la tabla detallespedido */

UPDATE detallespedido 
SET producto_id = 2
WHERE producto_id =1

/* 19. Elimina el detalle de pedido con pedido_id=1 de la tabla "DetallesPedido". */

DELETE FROM detallespedido
WHERE id = 1


/* 20. Lee todos los detalles de pedido de la tabla "DetallesPedido". */

SELECT * FROM detallespedido;


/* 21. Realiza una consulta para obtener todos los clientes y sus pedidos
correspondientes utilizando un inner join. */


SELECT clientes.id as cliente_id, clientes.nombre, pedidos.id as pedido_id FROM clientes
INNER JOIN pedidos on pedidos.cliente_id = clientes.id;


/* 22. Realiza una consulta para obtener todos los clientes y sus pedidos
correspondientes utilizando un left join. */

SELECT clientes.id as cliente_id, clientes.nombre, COALESCE(pedidos.id,'sin pedidos') as pedido_id FROM clientes
LEFT JOIN pedidos on pedidos.cliente_id = clientes.id;

/* 23. Realiza una consulta para obtener todos los productos y los detalles de pedido
correspondientes utilizando un inner join. */

SELECT productos.*, detallespedido.pedido_id
FROM productos 
INNER JOIN detallespedido on detallespedido.producto_id = productos.id;


/* 24. Realiza una consulta para obtener todos los productos y los detalles de pedido
correspondientes utilizando un left join. */

SELECT productos.*, COALESCE(detallespedido.pedido_id, 'Sin pedidos') as pedidos_id
FROM productos 
LEFT JOIN detallespedido on detallespedido.producto_id = productos.id;

/* 25. Crea una nueva columna llamada "telefono" de tipo cadena de texto en la tabla
"Clientes". */

ALTER TABLE clientes
ADD COLUMN telefono VARCHAR(11);


/* 26. Modifica la columna "telefono" en la tabla "Clientes" para cambiar su tipo de
datos a entero. */

ALTER TABLE clientes
MODIFY telefono INT;


/* 27. Elimina la columna "telefono" de la tabla "Clientes". */

ALTER TABLE clientes
DROP COLUMN telefono;


/* 28. Cambia el nombre de la tabla "Clientes" a "Usuarios". */

RENAME TABLE clientes TO usuarios;


/* 29. Cambia el nombre de la columna "nombre" en la tabla "Usuarios" a
"nombre_completo". */

ALTER TABLE usuarios
RENAME COLUMN nombre TO usuarios;


/* 30. Agrega una restricción de clave primaria a la columna "id" en la tabla "Usuarios".*/
/* He creado la tabla con una restriccion desde el primer momento */

ALTER TABLE usuarios
ADD CONSTRAINT clave_primaria PRIMARY KEY (id);

