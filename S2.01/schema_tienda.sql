

DROP DATABASE IF EXISTS tienda;
CREATE DATABASE tienda CHARACTER SET utf8mb4;
USE tienda;

CREATE TABLE fabricante (
  codigo INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(100) NOT NULL
);

CREATE TABLE producto (
  codigo INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(100) NOT NULL,
  precio DOUBLE NOT NULL,
  codigo_fabricante INT UNSIGNED NOT NULL,
  FOREIGN KEY (codigo_fabricante) REFERENCES fabricante(codigo)
);

INSERT INTO fabricante VALUES(1, 'Asus');
INSERT INTO fabricante VALUES(2, 'Lenovo');
INSERT INTO fabricante VALUES(3, 'Hewlett-Packard');
INSERT INTO fabricante VALUES(4, 'Samsung');
INSERT INTO fabricante VALUES(5, 'Seagate');
INSERT INTO fabricante VALUES(6, 'Crucial');
INSERT INTO fabricante VALUES(7, 'Gigabyte');
INSERT INTO fabricante VALUES(8, 'Huawei');
INSERT INTO fabricante VALUES(9, 'Xiaomi');

INSERT INTO producto VALUES(1, 'Disco duro SATA3 1TB', 86.99, 5);
INSERT INTO producto VALUES(2, 'Memoria RAM DDR4 8GB', 120, 6);
INSERT INTO producto VALUES(3, 'Disco SSD 1 TB', 150.99, 4);
INSERT INTO producto VALUES(4, 'GeForce GTX 1050Ti', 185, 7);
INSERT INTO producto VALUES(5, 'GeForce GTX 1080 Xtreme', 755, 6);
INSERT INTO producto VALUES(6, 'Monitor 24 LED Full HD', 202, 1);
INSERT INTO producto VALUES(7, 'Monitor 27 LED Full HD', 245.99, 1);
INSERT INTO producto VALUES(8, 'Portátil Yoga 520', 559, 2);
INSERT INTO producto VALUES(9, 'Portátil Ideapd 320', 444, 2);
INSERT INTO producto VALUES(10, 'Impresora HP Deskjet 3720', 59.99, 3);
INSERT INTO producto VALUES(11, 'Impresora HP Laserjet Pro M26nw', 180, 3);



/*Councusltas*/
SELECT nombre FROM producto;
SELECT nombre, precio FROM producto;
SELECT * FROM producto;
SELECT nombre , precio , precio * 1.1,2 FROM producto;
SELECT nombre, precio AS euros, ROUND(precio * 1.1, 2) AS dollar FROM producto;
SELECT UPPER(nombre) AS "nombres", precio FROM producto;
SELECT LOWER(nombre) AS "nombres", precio FROM producto;
SELECT nombre, UPPER(SUBSTRING(nombre, 1, 2)) AS "fabricantes" FROM fabricante;
SELECT nombre , precio  FROM producto ORDER BY precio;
SELECT nombre, ROUND(precio,0) as precio FROM producto ORDER BY precio;
SELECT codigo FROM producto;
SELECT DISTINCT codigo FROM producto;
SELECT nombre FROM fabricante ORDER BY nombre ASC;
SELECT nombre FROM fabricante ORDER BY nombre DESC;
SELECT nombre , precio FROM producto ORDER BY nombre ASC, precio DESC; 
SELECT nombre FROM fabricante Limit 5;
SELECT * FROM fabricante LIMIT 2 OFFSET 3;
SELECT nombre, precio FROM producto GROUP BY precio, nombre ORDER BY precio ASC LIMIT 1;
SELECT nombre, precio FROM producto GROUP BY precio, nombre ORDER BY precio DESC LIMIT 1;
SELECT nombre FROM producto WHERE codigo =2;
SELECT p.nombre as nombre_Producto ,p.precio as precio_Producto , f.nombre as nombre_fabicante  FROM producto p JOIN fabricante f on p.codigo=f.codigo ;