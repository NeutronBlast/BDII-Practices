CREATE TABLE camisas(
    id number NOT NULL,
    nombre VARCHAR(200) NOT NULL,
    marca VARCHAR(200) NOT NULL,
    genero VARCHAR(2) NOT NULL,
    precio number NOT NULL
);

CREATE TABLE pantalones(
    id number NOT NULL,
    nombre VARCHAR(200) NOT NULL,
    marca VARCHAR(200) NOT NULL,
    genero VARCHAR(2) NOT NULL,
    precio number NOT NULL
);

CREATE TABLE zapatos(
    id number NOT NULL,
    nombre VARCHAR(200) NOT NULL,
    marca VARCHAR(200) NOT NULL,
    genero VARCHAR(2) NOT NULL,
    precio number NOT NULL
);

CREATE TABLE accesorios(
    id number NOT NULL,
    nombre VARCHAR(200) NOT NULL,
    marca VARCHAR(200) NOT NULL,
    genero VARCHAR(2) NOT NULL,
    tipo VARCHAR(100) NOT NULL,
    precio number NOT NULL
);

CREATE TABLE wallets(
    id number NOT NULL,
    balance number NOT NULL
);

CREATE TABLE personas(
    doc_iden number NOT NULL,
    primer_nombre VARCHAR(200) NOT NULL,
    segundo_nombre VARCHAR(200),
    primer_apellido VARCHAR(200) NOT NULL,
    segundo_apellido VARCHAR(200),
    genero VARCHAR(2) NOT NULL,
    id_wallet number NOT NULL
);

CREATE TABLE matrimonios(
    id number NOT NULL,
    fecha_inicio DATE NOT NULL,
    fecha_fin DATE,
    id_persona_1 number NOT NULL,
    id_persona_2 number NOT NULL
);

CREATE TABLE calles(
    id number NOT NULL,
    nombre VARCHAR(40) NOT NULL,
    codigo_postal number NOT NULL
);

CREATE TABLE registro_asistencia(
    id number NOT NULL,
    fecha_llegada DATE,
    fecha_salida DATE,
    id_persona number NOT NULL,
    id_matrimonio number NOT NULL,
    id_calle number NOT NULL
);

CREATE TABLE AVATAR(
    id number NOT NULL,
    genero VARCHAR(2) NOT NULL,
    id_camisa number,
    id_pantalon number,
    id_zapatos number,
    id_accesorio number
    id_persona number
);

INSERT INTO wallets (id, balance) VALUES (1, 8000);
INSERT INTO wallets (id, balance) VALUES (2, 0);
INSERT INTO wallets (id, balance) VALUES (3, 3450);
INSERT INTO wallets (id, balance) VALUES (4, 40);

INSERT INTO personas (doc_iden,primer_nombre,primer_apellido,genero,id_wallet) VALUES (1,'Eric','Morning','M',1);
INSERT INTO personas (doc_iden,primer_nombre,primer_apellido,genero,id_wallet) VALUES (2,'Leo','Barnes','M',2);
INSERT INTO personas (doc_iden,primer_nombre,primer_apellido,genero,id_wallet) VALUES (3,'Andrea','Lau','F',3);
INSERT INTO personas (doc_iden,primer_nombre,primer_apellido,genero,id_wallet) VALUES (4,'Andrew','Miller','M',4);

INSERT INTO camisas (id, nombre, marca, genero) VALUES (1, 'Nike Black', 'NIKE', 'M', 100);
INSERT INTO camisas (id, nombre, marca, genero) VALUES (2, 'Vans Big Logo', 'VANS', 'M', 200);
INSERT INTO camisas (id, nombre, marca, genero) VALUES (3, 'Simons Classic', 'Simons', 'F', 100);

INSERT INTO pantalones (id, nombre, marca, genero) VALUES (1, 'Nike Sweatpants', 'NIKE', 'M', 100);
INSERT INTO pantalones (id, nombre, marca, genero) VALUES (2, 'H&M', 'H&M', 'M', 50);
INSERT INTO pantalones (id, nombre, marca, genero) VALUES (3, 'Nike Grey Shorts', 'NIKE', 'F', 30);

INSERT INTO zapatos (id, nombre, marca, genero) VALUES (1, 'Nike Air', 'NIKE', 'M', 100);
INSERT INTO zapatos (id, nombre, marca, genero) VALUES (2, 'Vans Old Skool', 'VANS', 'M', 150);
INSERT INTO zapatos (id, nombre, marca, genero) VALUES (3, 'Doc Martens', 'DOC MARTENS', 'F', 130);

INSERT INTO accesorios (id, nombre, marca, genero, tipo) VALUES (1, 'Sunglasses', 'NIKE', 'M', 100, 'Lentes de sol');
INSERT INTO accesorios (id, nombre, marca, genero, tipo) VALUES (2, 'Black Airpods', 'APPLE', 'M', 10, 'Audifonos');
INSERT INTO accesorios (id, nombre, marca, genero, tipo) VALUES (3, 'Gold Necklace', 'GUCCI', 'F', 300, 'Joyeria');

INSERT INTO calles (id,nombre,codigo_postal) VALUES (1,'St Louis', 183);

INSERT INTO matrimonios(id, fecha_inicio, fecha_fin, id_persona_1, id_persona_2) VALUES (1, to_date('01-01-2001 10:30', 'dd-mm-yyyy hh:mi'), to_date('01-01-2001 12:30', 'dd-mm-yyyy hh:mi'), 1, 2);

INSERT INTO registro_asistencia (id, fecha_llegada, fecha_salida, id_persona, id_matrimonio, id_calle) VALUES (1, to_date('01-01-2001 10:30', 'dd-mm-yyyy hh:mi'), to_date('01-01-2001 1:30', 'dd-mm-yyyy hh:mi'), 1, 1, 1);
INSERT INTO registro_asistencia (id, fecha_llegada, fecha_salida, id_persona, id_matrimonio, id_calle) VALUES (1, to_date('01-01-2001 10:30', 'dd-mm-yyyy hh:mi'), to_date('01-01-2001 2:30', 'dd-mm-yyyy hh:mi'), 2, 1, 1);
INSERT INTO registro_asistencia (id, fecha_llegada, fecha_salida, id_persona, id_matrimonio, id_calle) VALUES (1, to_date('01-01-2001 10:30', 'dd-mm-yyyy hh:mi'), to_date('01-01-2001 3:30', 'dd-mm-yyyy hh:mi'), 4, 1, 1);