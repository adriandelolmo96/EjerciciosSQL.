Ejercicio 3
Nivel de dificultad: Difícil

/* 1. Crea una tabla llamada "Productos" con las columnas: "id" (entero, clave
primaria), "nombre" (texto) y "precio" (numérico). */

CREATE TABLE productos(
  id INT AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(50),
  precio DECIMAL(7,2)
);

/* 2. Inserta al menos cinco registros en la tabla "Productos". */

INSERT INTO productos (nombre, precio)
VALUES ('pantalla', 120),
('ordenador',650),
('mesa',90.5),
('lampara', 18.99),
('silla', 233);

/* 3. Actualiza el precio de un producto en la tabla "Productos". */

UPDATE productos
SET precio = 250
WHERE id = 5;

/* 4. Elimina un producto de la tabla "Productos". */

DELETE FROM productos 
WHERE id = 5;

/* 5. Realiza una consulta que muestre los nombres de los usuarios junto con los
nombres de los productos que han comprado (utiliza un INNER JOIN con la
tabla "Productos"). */

SELECT usuarios.nombre, productos.nombre as nombre_del_producto FROM usuarios
INNER JOIN pedidos on pedidos.usuario_id = usuario.id
INNER JOIN productos on productos.id = pedidos.producto_id;
