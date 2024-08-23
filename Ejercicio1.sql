/* 1. Crear una tabla llamada "Clientes" con las columnas: id (entero, clave primaria), nombre (texto) y email (texto). */

CREATE table Clientes (
id int AUTO_INCREMENT PRIMARY key, 
nombre VARCHAR(50),
email VARCHAR(255)
);

/* 2. Insertar un nuevo cliente en la tabla "Clientes" con id=1, nombre="Juan" y
email="juan@example.com". */

INSERT INTO Clientes (nombre, email)
VALUES("Juan", "Juan@example.com");

/*3. Actualizar el email del cliente con id=1 a "juan@gmail.com". */

UPDATE Clientes
SET email = 'Juan@gmail.com'
WHERE email = 'Juan@example.com';

/*4. Eliminar el cliente con id=1 de la tabla "Clientes". */

DELETE FROM Clientes
WHERE id = 1;

/* 5. Crear una tabla llamada "Pedidos" con las columnas: id (entero, clave primaria),
cliente_id (entero, clave externa referenciando a la tabla "Clientes"), producto
(texto) y cantidad (entero). */

CREATE TABLE Pedidos (
id INT AUTO_INCREMENT PRIMARY KEY,
cliente_id INT,
producto VARCHAR (255),
cantidad INT,
FOREIGN KEY (cliente_id) REFERENCES clientes(id)
);

/* 6. Insertar un nuevo pedido en la tabla "Pedidos" con id=1, cliente_id=1,
producto="Camiseta" y cantidad=2. */
/* Para realizar este ejercicio he creado un registro nuevo en la tabla clientes para poder tener un id de cliente 1 al cual hacer referencia con el cliente_id de productos el cual es una Foreign key */

INSERT INTO pedidos (cliente_id, producto, cantidad)
VALUES (1, 'camiseta' ,2);

/* 7. Actualizar la cantidad del pedido con id=1 a 3. */

UPDATE pedidos
SET cantidad = 3
WHERE id = 1;

/* 8. Eliminar el pedido con id=1 de la tabla "Pedidos". */

DELETE FROM pedidos
WHERE id = 1;

/* 9. Crear una tabla llamada "Productos" con las columnas: id (entero, clave
primaria), nombre (texto) y precio (decimal). */

CREATE TABLE productos (
id INT AUTO_INCREMENT PRIMARY KEY,
nombre VARCHAR(255),
precio DECIMAL(7,2)
);

/* 10. Insertar varios productos en la tabla "Productos" con diferentes valores. */

INSERT INTO productos (nombre, precio)
VALUES 
('martillo', 12.5),
('sierra', 15),
('masilla 1kg', 20),
('mascarilla', 3),
('taladro bosch', 150),
('brocas 6mm', 8);

/* 11. Consultar todos los clientes de la tabla "Clientes". */

SELECT * FROM clientes;

/* 12. Consultar todos los pedidos de la tabla "Pedidos" junto con los nombres de los
clientes correspondientes. */

SELECT pedidos.* ,clientes.nombre FROM pedidos
join clientes on pedidos.cliente_id = clientes.id;

/* 13. Consultar los productos de la tabla "Productos" cuyo precio sea mayor a $50. */

SELECT * FROM productos
WHERE precio > 50;

/* 14. Consultar los pedidos de la tabla "Pedidos" que tengan una cantidad mayor o
igual a 5. */

SELECT * FROM pedidos
WHERE cantidad >= 5;

/* 15. Consultar los clientes de la tabla "Clientes" cuyo nombre empiece con la letra
"A". */

SELECT * FROM clientes 
WHERE nombre LIKE 'A%';
