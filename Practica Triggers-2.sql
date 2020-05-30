CREATE TABLE LogCreates(
    username varchar(250),
    creation_date date,
    object_name varchar(250)
);

CREATE OR REPLACE TRIGGER LogAfterCreate 
AFTER CREATE
ON SCHEMA
DECLARE
    evt VARCHAR(50);
BEGIN

SELECT ora_dict_obj_type INTO evt FROM DUAL;
    IF evt = 'TABLE' THEN        
        INSERT INTO LogCreates (username, creation_date, object_name) VALUES ((SELECT USER FROM DUAL), (SELECT SYSDATE FROM DUAL), (SELECT ora_dict_obj_name FROM DUAL));
    END IF;
END;

CREATE TABLE paises(
    id NUMBER PRIMARY KEY,
    nombre VARCHAR(200) NOT NULL
);

/* Se hizo una secuencia para demostrar que no se agrega el LOG cuando se crea algo que no sea una tabla */
CREATE SEQUENCE id_paises_seq;

SELECT * FROM LOGCREATES;