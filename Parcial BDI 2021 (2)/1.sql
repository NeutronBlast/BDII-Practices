CREATE TABLE pcs(
    modelo BIGINT PRIMARY KEY,
    fabricante VARCHAR(50),
    velocidad INT,
    ram INT,
    HD BOOLEAN,
    CD BOOLEAN,
    precio INT
);

CREATE TABLE laptops(
    modelo BIGINT PRIMARY KEY,
    fabricante VARCHAR(50),
    velocidad INT,
    ram INT,
    pantalla INT,
    precio INT
);

CREATE TABLE impresoras(
    modelo BIGINT PRIMARY KEY,
    color VARCHAR(50),
    tipo VARCHAR(50),
    precio INT
);

CREATE TABLE clientes(
    id BIGINT PRIMARY KEY,
    nombre VARCHAR(50),
    renta_anual INT,
    tipo VARCHAR(50)
);

CREATE TABLE ciudades(
    id BIGINT PRIMARY KEY,
    nombre VARCHAR(50),
    poblacion INT
);

CREATE TABLE ventas(
    modelo BIGINT PRIMARY KEY,
    id_cliente BIGINT NOT NULL,
    id_ciudad BIGINT NOT NULL,
    CONSTRAINT fk_cliente FOREIGN KEY(id_cliente) REFERENCES clientes(id),
    CONSTRAINT fk_ciudad FOREIGN KEY(id_ciudad) REFERENCES ciudades(id)
);


INSERT INTO pcs VALUES (1, 'Compaq', 133, 4, true, true, 400);
INSERT INTO pcs VALUES (2, 'Compaq', 133, 6, true, true, 500);
INSERT INTO pcs VALUES (3, 'Compaq', 133, 7, true, true, 560);
INSERT INTO pcs VALUES (4, 'Lenovo', 133, 7, true, true, 560);
INSERT INTO pcs VALUES (5, 'Compaq', 130, 7, true, true, 500);
INSERT INTO pcs VALUES (6, 'Asus', 133, 12, true, true, 500);
INSERT INTO pcs VALUES (7, 'Asus', 133, 16, true, true, 600);
INSERT INTO pcs VALUES (8, 'Sony', 133, 32, true, false, 400);

INSERT INTO laptops VALUES (1, 'Compaq', 133, 4, 1000, 400);
INSERT INTO laptops VALUES (2, 'Compaq', 133, 6, 1000, 500);
INSERT INTO laptops VALUES (3, 'Compaq', 133, 32, 1000, 560);
INSERT INTO laptops VALUES (4, 'Compaq', 133, 16, 1000, 560);
INSERT INTO laptops VALUES (5, 'Compaq', 130, 7, 1000, 500);
INSERT INTO laptops VALUES (6, 'Asus', 133, 12, 1000, 500);
INSERT INTO laptops VALUES (7, 'Asus', 133, 16, 1000, 600);
INSERT INTO laptops VALUES (8, 'Sony', 133, 64, 1200, 1400);
INSERT INTO laptops VALUES (9, 'Compaq', 133, 4, 1000, 400);
INSERT INTO laptops VALUES (10, 'Compaq', 233, 6, 1000, 500);
INSERT INTO laptops VALUES (11, 'Compaq', 273, 32, 1000, 560);
INSERT INTO laptops VALUES (12, 'Compaq', 391, 16, 1000, 560);
INSERT INTO laptops VALUES (13, 'Lenovo', 410, 7, 1000, 500);
INSERT INTO laptops VALUES (14, 'Asus', 100, 12, 1000, 200);
INSERT INTO laptops VALUES (15, 'Asus', 100, 16, 1000, 300);
INSERT INTO laptops VALUES (16, 'Sony', 100, 64, 1200, 100);
INSERT INTO laptops VALUES (17, 'Sony', 134, 64, 1200, 100);

INSERT INTO ciudades VALUES (1, 'New Orleans', 9000);
INSERT INTO ciudades VALUES (2, 'Memphis', 100000000);
INSERT INTO ciudades VALUES (3, 'Flint', 300);
INSERT INTO ciudades VALUES (4, 'Maracay', 400);
INSERT INTO ciudades VALUES (5, 'Texas', 401);

INSERT INTO clientes VALUES (1, 'Frank Hesse', 200000);
INSERT INTO clientes VALUES (2, 'Eric Morning', 200000);
INSERT INTO clientes VALUES (3, 'Alex Hunter', 90000);
INSERT INTO clientes VALUES (4, 'Noel Volta', 300000);
INSERT INTO clientes VALUES (5, 'Alissa Bosconovich', 300000);
INSERT INTO clientes VALUES (6, 'Khaled Jazzy', 300000);

INSERT INTO ventas VALUES (1, 1, 1);
INSERT INTO ventas VALUES (2, 2, 1);
INSERT INTO ventas VALUES (3, 3, 1);
INSERT INTO ventas VALUES (4, 4, 2);
INSERT INTO ventas VALUES (5, 5, 5);
INSERT INTO ventas VALUES (6, 6, 3);

/* 1 */
SELECT p.fabricante FROM pcs p
WHERE p.velocidad = 133 AND (SELECT COUNT(*) FROM pcs WHERE fabricante = p.fabricante) + (SELECT COUNT(*) FROM laptops WHERE fabricante = p.fabricante) >= 2
GROUP BY p.fabricante;

SELECT pr.fabricante FROM productos pr
JOIN pcs p ON p.modelo = pr.modelo 
JOIN laptops l ON l.modelo = pr.modelo

WHERE p.velocidad = 133 AND 

(SELECT COUNT(*) FROM pcs pc
JOIN productos pp ON pp.modelo = pc.modelo
WHERE pp.fabricante = pr.fabricante) + 

(SELECT COUNT(*) FROM laptops la
JOIN productos pp ON pp.modelo = la.modelo
WHERE pp.fabricante = pr.fabricante) >= 2

GROUP BY pr.fabricante;

/* 2 */
SELECT p.modelo, p.tipo FROM pcs p WHERE p.precio <> (SELECT MIN(precio) FROM pcs);

SELECT pr.modelo, pr.tipo FROM productos pr
JOIN pcs p ON p.modelo = pr.modelo
WHERE p.precio <> (SELECT MIN(precio) FROM pcs);

/* 3 */
SELECT l.fabricante FROM laptops l
WHERE l.velocidad > 133 AND l.precio > (SELECT AVG(precio) FROM laptops WHERE velocidad = 100)
GROUP BY l.fabricante;

SELECT pr.fabricante FROM productos pr
JOIN laptops l ON l.modelo = pr.modelo
WHERE l.velocidad > 133 AND l.precio > (SELECT AVG(precio) FROM laptops WHERE velocidad = 100)
GROUP BY pr.fabricante;

/* 4 */
SELECT c.nombre FROM ciudades c
JOIN ventas v ON v.id_ciudad = c.id
JOIN clientes cl ON cl.id = v.id_cliente
WHERE c.poblacion < 1000000 AND c.poblacion > (SELECT poblacion FROM ciudades WHERE nombre = 'Maracay') AND cl.renta_anual > 100000
GROUP BY c.nombre;