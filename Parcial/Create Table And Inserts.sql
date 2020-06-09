CREATE TABLE domicilios(
    id number NOT NULL,
    nombre VARCHAR(200) NOT NULL,
    numero number NOT NULL,
    id_calle number NOT NULL
);

CREATE TABLE calles (
    id number NOT NULL,
    nombre VARCHAR(200),
    codigo_postal number,
    id_urbanizacion number NOT NULL
);

CREATE TABLE urbanizaciones (
    id number NOT NULL,
    nombre VARCHAR(200),
    id_ciudad number NOT NULL
);

CREATE TABLE ciudades (
    id number NOT NULL,
    nombre VARCHAR(200),
    id_estado number NOT NULL
);

CREATE TABLE estados (
    id number NOT NULL,
    nombre VARCHAR(200),
    id_pais number NOT NULL
);

CREATE TABLE paises (
    id number NOT NULL,
    nombre VARCHAR(200)
);

CREATE TABLE actividades(
    id number NOT NULL,
    nombre VARCHAR(200)
);


CREATE TABLE personas(
    doc_iden number NOT NULL,
    primer_nombre VARCHAR(200) NOT NULL,
    primer_apellido VARCHAR(200) NOT NULL,
    estado VARCHAR(10) NOT NULL,
    id_domicilio number NOT NULL
);

CREATE TABLE P_P_C_A(
    id_persona_1 number NOT NULL,
    id_persona_2 number NOT NULL,
    id_calle number NOT NULL,
    id_actividad number NOT NULL,
    fecha_contacto date
);

CREATE TABLE telefonos(
    cod_pais number NOT NULL,
    cod_area number NOT NULL,
    numero number NOT NULL,
    clave_publica number NOT NULL,
    clave_privada number NOT NULL,
    id_persona number NOT NULL
);

INSERT INTO paises (id,nombre) VALUES (1,'Estados Unidos');
INSERT INTO estados (id,nombre,id_pais) VALUES (1,'Louisiana',1);
INSERT INTO ciudades (id,nombre,id_estado) VALUES (1,'New Orleans',1);
INSERT INTO urbanizaciones (id,nombre,id_ciudad) VALUES (1,'Magnolia',1);
INSERT INTO calles (id,nombre,codigo_postal,id_urbanizacion) VALUES (1,'St Louis', 183, 1);
INSERT INTO domicilios (id,nombre,numero,id_calle) VALUES (1,'Uno',1,1);
INSERT INTO domicilios (id,nombre,numero,id_calle) VALUES (2,'Dos',2,1);
INSERT INTO domicilios (id,nombre,numero,id_calle) VALUES (3,'Tres',3,1);
INSERT INTO domicilios (id,nombre,numero,id_calle) VALUES (4,'Cuatro',4,1);
INSERT INTO domicilios (id,nombre,numero,id_calle) VALUES (5,'Cinco',5,1);
INSERT INTO actividades (id,nombre) VALUES (1,'Gym');
INSERT INTO actividades (id,nombre) VALUES (2,'Compras');
INSERT INTO actividades (id,nombre) VALUES (3,'Restaurant');
INSERT INTO actividades (id,nombre) VALUES (4,'Lavanderia');
INSERT INTO actividades (id,nombre) VALUES (5,'Pasear al perro');
INSERT INTO personas (doc_iden,primer_nombre,primer_apellido,estado,id_domicilio) VALUES (1,'Frank','Hesse','SANO',1);
INSERT INTO personas (doc_iden,primer_nombre,primer_apellido,estado,id_domicilio) VALUES (2,'Leo','Barnes','SANO',2);
INSERT INTO personas (doc_iden,primer_nombre,primer_apellido,estado,id_domicilio) VALUES (3,'Mark','Hesse','SANO',3);
INSERT INTO personas (doc_iden,primer_nombre,primer_apellido,estado,id_domicilio) VALUES (4,'Jesus','Requena','SANO',4);
INSERT INTO personas (doc_iden,primer_nombre,primer_apellido,estado,id_domicilio) VALUES (5,'Andrew','Miller','SANO',1);
INSERT INTO personas (doc_iden,primer_nombre,primer_apellido,estado,id_domicilio) VALUES (6,'David','Ortuño','SANO',3);
INSERT INTO personas (doc_iden,primer_nombre,primer_apellido,estado,id_domicilio) VALUES (7,'Omar','Hernandez','SANO',2);
INSERT INTO personas (doc_iden,primer_nombre,primer_apellido,estado,id_domicilio) VALUES (8,'Gregg','Spinetti','INFECTADO',1);
INSERT INTO P_P_C_A (id_persona_1,id_persona_2,id_calle,id_actividad,fecha_contacto) VALUES (1,2,1,2,'01-01-2020');
INSERT INTO P_P_C_A (id_persona_1,id_persona_2,id_calle,id_actividad,fecha_contacto) VALUES (1,8,1,3,'01-01-2020');
INSERT INTO P_P_C_A (id_persona_1,id_persona_2,id_calle,id_actividad,fecha_contacto) VALUES (1,7,1,3,'01-01-2020');
INSERT INTO P_P_C_A (id_persona_1,id_persona_2,id_calle,id_actividad,fecha_contacto) VALUES (1,4,1,4,'01-01-2020');
INSERT INTO P_P_C_A (id_persona_1,id_persona_2,id_calle,id_actividad,fecha_contacto) VALUES (2,1,1,4,'01-01-2020');
INSERT INTO P_P_C_A (id_persona_1,id_persona_2,id_calle,id_actividad,fecha_contacto) VALUES (2,3,1,1,'01-01-2020');
INSERT INTO P_P_C_A (id_persona_1,id_persona_2,id_calle,id_actividad,fecha_contacto) VALUES (2,5,1,2,'01-01-2020');
INSERT INTO P_P_C_A (id_persona_1,id_persona_2,id_calle,id_actividad,fecha_contacto) VALUES (8,4,1,4,'01-01-2020');
INSERT INTO P_P_C_A (id_persona_1,id_persona_2,id_calle,id_actividad,fecha_contacto) VALUES (8,5,1,1,'01-01-2020');
INSERT INTO P_P_C_A (id_persona_1,id_persona_2,id_calle,id_actividad,fecha_contacto) VALUES (8,7,1,2,'01-01-2020');
INSERT INTO telefonos (cod_pais,cod_area,numero,clave_publica,clave_privada,id_persona) VALUES (49,281,8318,1111,282,1);
INSERT INTO telefonos (cod_pais,cod_area,numero,clave_publica,clave_privada,id_persona) VALUES (49,282,8657,1111,246,2);
INSERT INTO telefonos (cod_pais,cod_area,numero,clave_publica,clave_privada,id_persona) VALUES (49,282,8123,1111,274,3);
INSERT INTO telefonos (cod_pais,cod_area,numero,clave_publica,clave_privada,id_persona) VALUES (49,283,4123,5555,865,4);
INSERT INTO telefonos (cod_pais,cod_area,numero,clave_publica,clave_privada,id_persona) VALUES (49,284,8552,1111,455,5);
INSERT INTO telefonos (cod_pais,cod_area,numero,clave_publica,clave_privada,id_persona) VALUES (49,285,3432,3333,324,6);
INSERT INTO telefonos (cod_pais,cod_area,numero,clave_publica,clave_privada,id_persona) VALUES (49,286,6542,3333,235,7);
INSERT INTO telefonos (cod_pais,cod_area,numero,clave_publica,clave_privada,id_persona) VALUES (49,287,8353,1111,282,8);
