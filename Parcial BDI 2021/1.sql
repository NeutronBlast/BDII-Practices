/* a */

CREATE TABLE edificios (
    id BIGINT PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL
);

CREATE TABLE pisos (
    numero BIGINT NOT NULL,
    id_edificio BIGINT NOT NULL,
    PRIMARY KEY (numero, id_edificio),
    CONSTRAINT fk_edificio FOREIGN KEY (id_edificio) REFERENCES edificios(id)
);

CREATE TABLE apartamentos (
    id BIGINT,
    descripcion VARCHAR(200),
    id_piso BIGINT NOT NULL,
    id_edificio BIGINT NOT NULL,
    PRIMARY KEY (id, id_piso, id_edificio),
    CONSTRAINT fk_piso FOREIGN KEY (id_piso, id_edificio) REFERENCES pisos (numero, id_edificio)
);

/* b */
ALTER TABLE edificios ADD UNIQUE(nombre);
ALTER TABLE edificios ADD fecha_inauguracion DATE;

/* c */
CREATE SEQUENCE id_piso_seq;
CREATE SEQUENCE id_edificio_seq START WITH 10 INCREMENT BY 10;
CREATE SEQUENCE id_apartamento_seq START WITH 100 INCREMENT BY 10;

INSERT INTO edificios VALUES (NEXTVAL('id_edificio_seq'), 'Residencias Las Cumbres');

INSERT INTO pisos VALUES(NEXTVAL('id_piso_seq'), (SELECT id FROM edificios WHERE nombre = 'Residencias Las Cumbres'));
INSERT INTO pisos VALUES(NEXTVAL('id_piso_seq'), (SELECT id FROM edificios WHERE nombre = 'Residencias Las Cumbres'));

INSERT INTO apartamentos VALUES (NEXTVAL('id_apartamento_seq'), '1 habitacion, 1 baño, Wi-Fi incluido', 1, (SELECT id FROM edificios WHERE nombre = 'Residencias Las Cumbres'));
INSERT INTO apartamentos VALUES (NEXTVAL('id_apartamento_seq'), '1 habitacion, 1 baño, sin amoblar', 1, (SELECT id FROM edificios WHERE nombre = 'Residencias Las Cumbres'));
INSERT INTO apartamentos VALUES (NEXTVAL('id_apartamento_seq'), 'estudio', 2, (SELECT id FROM edificios WHERE nombre = 'Residencias Las Cumbres'));
INSERT INTO apartamentos VALUES (NEXTVAL('id_apartamento_seq'), '2 habitaciones, 2 baños', 2, (SELECT id FROM edificios WHERE nombre = 'Residencias Las Cumbres'));