CREATE TABLE farmacias (
    id number PRIMARY KEY,
    nombre VARCHAR2(200) NOT NULL
);

CREATE TABLE insumos (
    id number PRIMARY KEY,
    nombre VARCHAR2(200) NOT NULL
);

CREATE TABLE proveedores(
    id number PRIMARY KEY,
    nombre VARCHAR2(200) NOT NULL
);

CREATE TABLE P_I(
    id_proveedor number NOT NULL,
    id_insumo number NOT NULL    
);

CREATE TABLE F_I(
    id_farmacia number NOT NULL,
    id_insumo number NOT NULL,
    cantidad number NOT NULL
);

CREATE TABLE ordenes_compra(
    codigo number PRIMARY KEY,
    id_proveedor number NOT NULL,
    id_insumo number NOT NULL,
    id_farmacia number NOT NULL
);

ALTER TABLE F_I ADD CONSTRAINT farmacia_insumo_pk PRIMARY KEY(id_farmacia,id_insumo);
ALTER TABLE P_I ADD CONSTRAINT proveedor_insumo_pk PRIMARY KEY(id_proveedor,id_insumo);

ALTER TABLE ordenes_compra ADD CONSTRAINT orden_compra_proveedor_fk FOREIGN KEY (id_proveedor) REFERENCES proveedores(id);
ALTER TABLE ordenes_compra ADD CONSTRAINT orden_compra_farmacia_fk FOREIGN KEY (id_farmacia) REFERENCES farmacias(id);
ALTER TABLE ordenes_compra ADD CONSTRAINT orden_compra_insumo_fk FOREIGN KEY (id_insumo) REFERENCES insumos(id);
ALTER TABLE F_I ADD CONSTRAINT farmacia_fi_fk FOREIGN KEY (id_farmacia) REFERENCES farmacias(id);
ALTER TABLE F_I ADD CONSTRAINT insumo_fi_fk FOREIGN KEY (id_insumo) REFERENCES insumos(id);
ALTER TABLE P_I ADD CONSTRAINT proveedor_pi_fk FOREIGN KEY (id_proveedor) REFERENCES proveedores(id);
ALTER TABLE P_I ADD CONSTRAINT insumo_pi_fk FOREIGN KEY (id_insumo) REFERENCES insumos(id); 

CREATE SEQUENCE ordenes_compra_codigo_seq;
/* Farmacias */
INSERT INTO farmacias (id,nombre) VALUES (1,'Pharma Fulla Hope');
INSERT INTO farmacias (id,nombre) VALUES (2,'Cherry Street Pharmacy');

/* Insumos */
INSERT INTO insumos (id,nombre) VALUES (1, 'Tapabocas');
INSERT INTO insumos (id,nombre) VALUES (2, 'Antibacterial');
INSERT INTO insumos (id,nombre) VALUES (3, 'Guantes quirurgicos');

/* Proveedores */
INSERT INTO proveedores(id,nombre) VALUES (1, 'Dream on Dreamer');
INSERT INTO proveedores(id,nombre) VALUES (2, 'Kintsugi Drugs');
INSERT INTO proveedores(id,nombre) VALUES (3, 'Eden');

/* Insumos en proveedores */
INSERT INTO P_I(id_proveedor,id_insumo) VALUES (1,1);
-- 2
INSERT INTO P_I(id_proveedor,id_insumo) VALUES (2,1);
INSERT INTO P_I(id_proveedor,id_insumo) VALUES (2,2);
INSERT INTO P_I(id_proveedor,id_insumo) VALUES (2,3);
-- 3
INSERT INTO P_I(id_proveedor,id_insumo) VALUES (3,1);
INSERT INTO P_I(id_proveedor,id_insumo) VALUES (3,2);

-- Trigger
CREATE OR REPLACE TRIGGER inventario BEFORE INSERT OR UPDATE ON F_I FOR EACH ROW
DECLARE 
root_prov number;
num_insumo number;
num_farmacia number;
BEGIN
    IF :new.cantidad < 100 THEN
        -- Nombre de insumo
        SELECT i.id INTO num_insumo FROM insumos i WHERE i.id = :new.id_insumo; 

        -- Nombre farmacia
        SELECT f.id INTO num_farmacia FROM farmacias f WHERE f.id = :new.id_farmacia;

        -- Proveedor que entregara insumo siempre y cuando lo tenga
        SELECT * INTO root_prov
        FROM
        (
            SELECT p.id FROM proveedores p 
            JOIN P_I pi on pi.id_proveedor = p.id AND pi.id_insumo = :new.id_insumo
            ORDER BY DBMS_RANDOM.VALUE 
        )
        WHERE rownum = 1;

        INSERT INTO ordenes_compra (codigo,id_proveedor,id_farmacia,id_insumo) VALUES (ordenes_compra_codigo_seq.NEXTVAL, root_prov, num_farmacia, num_insumo);
    
        :new.cantidad:= :new.cantidad+1000;
    END IF;
END;  

/* Insumos en farmacia */
INSERT INTO F_I (id_farmacia,id_insumo,cantidad) VALUES (1,1,99);
INSERT INTO F_I (id_farmacia,id_insumo,cantidad) VALUES (1,2,117);
-- Farmacia 2
INSERT INTO F_I (id_farmacia,id_insumo,cantidad) VALUES (2,1,250);
INSERT INTO F_I (id_farmacia,id_insumo,cantidad) VALUES (2,2,32);
INSERT INTO F_I (id_farmacia,id_insumo,cantidad) VALUES (2,3,101);

/* Consultar ordenes de compra */
SELECT o.codigo, p.nombre as proveedor, i.nombre as insumo, f.nombre as farmacia
FROM ordenes_compra o
JOIN proveedores p ON p.id = o.id_proveedor
JOIN insumos i ON i.id = o.id_insumo
JOIN farmacias f ON f.id = o.id_farmacia;

/* Consultar inventarios */
SELECT f.nombre as farmacia, i.nombre as insumo, fi.cantidad as disponible
FROM F_I fi
JOIN farmacias f ON f.id = fi.id_farmacia
JOIN insumos i ON i.id = fi.id_insumo;

