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

ALTER TABLE F_I ADD CONSTRAINT farmacia_insumo_pk PRIMARY KEY(id_farmacia,id_insumo);
ALTER TABLE P_I ADD CONSTRAINT proveedor_insumo_pk PRIMARY KEY(id_proveedor,id_insumo);

ALTER TABLE F_I ADD CONSTRAINT farmacia_fi_fk FOREIGN KEY (id_farmacia) REFERENCES farmacias(id);
ALTER TABLE F_I ADD CONSTRAINT insumo_fi_fk FOREIGN KEY (id_insumo) REFERENCES insumos(id);
ALTER TABLE P_I ADD CONSTRAINT proveedor_pi_fk FOREIGN KEY (id_proveedor) REFERENCES proveedores(id);
ALTER TABLE P_I ADD CONSTRAINT insumo_pi_fk FOREIGN KEY (id_insumo) REFERENCES insumos(id); 

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
root_prov VARCHAR2(200);
nombre_insumo VARCHAR2(200);
nombre_farmacia VARCHAR(200);
BEGIN
    IF :new.cantidad < 100 THEN
        -- Nombre de insumo
        SELECT i.nombre INTO nombre_insumo FROM insumos i WHERE i.id = :new.id_insumo; 

        -- Nombre farmacia
        SELECT f.nombre INTO nombre_farmacia FROM farmacias f WHERE f.id = :new.id_farmacia;

        -- Proveedor que entregara insumo siempre y cuando lo tenga
        SELECT * INTO root_prov
        FROM
        (
            SELECT p.id FROM proveedores p 
            JOIN P_I pi on pi.id_proveedor = p.id AND pi.id_insumo = :new.id_insumo
            ORDER BY DBMS_RANDOM.VALUE 
        )
        WHERE rownum = 1;
    
        :new.cantidad:= :new.cantidad+1000;
        DBMS_OUTPUT.PUT_LINE('Se realizo una orden de compra a la farmacia ' || nombre_farmacia || 'por parte de el proveedor ' || root_prov || 'con el insumo' || nombre_insumo || '.');
    END IF;
END;  

/* Insumos en farmacia */
INSERT INTO F_I (id_farmacia,id_insumo,cantidad) VALUES (1,1,99);
INSERT INTO F_I (id_farmacia,id_insumo,cantidad) VALUES (1,2,117);
-- Farmacia 2
INSERT INTO F_I (id_farmacia,id_insumo,cantidad) VALUES (2,1,250);
INSERT INTO F_I (id_farmacia,id_insumo,cantidad) VALUES (2,2,32);
INSERT INTO F_I (id_farmacia,id_insumo,cantidad) VALUES (2,3,101);


