/* 1. Crea una base de datos llamada "MiBaseDeDatos". */

CREATE DATABASE MiBaseDeDatos;

/* 2. Crea una tabla llamada "Usuarios" con las columnas: "id" (entero, clave
primaria), "nombre" (texto) y "edad" (entero). */

CREATE TABLE usuarios(
id INT AUTO_INCREMENT PRIMARY KEY,
nombre VARCHAR (50),
edad INT
);
/* 3. Inserta dos registros en la tabla "Usuarios". */

INSERT INTO usuarios (nombre, edad)
VALUES ('Pablo',25),
('Claudia', 26);

/* 4. Actualiza la edad de un usuario en la tabla "Usuarios". */

UPDATE usuarios
SET edad = 22
WHERE id = 1;
/* 5. Elimina un usuario de la tabla "Usuarios". */

DELETE FROM usuarios 
WHERE id = 1;

/* Nivel de dificultad: Moderado
1. Crea una tabla llamada "Ciudades" con las columnas: "id" (entero, clave
primaria), "nombre" (texto) y "pais" (texto). */

CREATE TABLE ciudades (
id INT AUTO_INCREMENT PRIMARY KEY,
nombre VARCHAR (50),
pais VARCHAR (50)
);

/* 2. Inserta al menos tres registros en la tabla "Ciudades". */

INSERT INTO ciudades (nombre, pais)
VALUES ('Madrid', 'Spain'),
('London', 'England');

/* 3. Crea una foreign key en la tabla "Usuarios" que se relacione con la columna "id"
de la tabla "Ciudades". */

 ALTER TABLE usuarios
 ADD COLUMN ciudades_id INT;

 ALTER TABLE usuarios
ADD CONSTRAINT referencia_ciudades_id
FOREIGN KEY (ciudades_id) REFERENCES ciudades(id);

 /* 4. Realiza una consulta que muestre los nombres de los usuarios junto con el
nombre de su ciudad y país (utiliza un LEFT JOIN). */

SELECT usuarios.nombre, ciudades.nombre as ciudad, ciudades.pais FROM usuarios
LEFT JOIN ciudades ON ciudades.id = usuarios.ciudades_id;


/* 5. Realiza una consulta que muestre solo los usuarios que tienen una ciudad
asociada (utiliza un INNER JOIN). */


SELECT usuarios.*, ciudades.nombre FROM usuarios
INNER JOIN ciudades ON ciudades.id = usuarios.ciudades_id
WHERE usuarios.ciudades_id = ciudades.id;