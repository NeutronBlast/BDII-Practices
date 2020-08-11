CREATE TABLE PAISES (
    id NUMBER PRIMARY KEY,
    nombre VARCHAR2(200) NOT NULL,
    t_km_2 NUMBER
);

CREATE TABLE p_p (
    id_pais_1 NUMBER NOT NULL,
    id_pais_2 NUMBER NOT NULL,
    PRIMARY KEY (id_pais_1, id_pais_2)
);

ALTER TABLE P_P ADD CONSTRAINT pp_1_fk FOREIGN KEY (id_pais_1) REFERENCES PAISES(id) ON DELETE CASCADE;
ALTER TABLE P_P ADD CONSTRAINT pp_2_fk FOREIGN KEY (id_pais_2) REFERENCES PAISES(id) ON DELETE CASCADE;

/* Agregar las dos columnas */
ALTER TABLE PAISES
ADD (
    habitantes number not null,
    id_continente number not null
);

/* Crear tabla continentes */
CREATE TABLE CONTINENTES (
    id NUMBER PRIMARY KEY,
    nombre VARCHAR2(200) NOT NULL
);

/* Constraint */
ALTER TABLE PAISES ADD CONSTRAINT pais_continente_fk FOREIGN KEY (id_continente) REFERENCES continentes(id);

/* Insert */
INSERT INTO CONTINENTES VALUES(1, 'America');

INSERT INTO PAISES (id, nombre, habitantes, id_continente) VALUES (1, 'Brasil', 38924892, 1);
INSERT INTO PAISES (id, nombre, habitantes, id_continente) VALUES (2, 'Colombia', 500000000, 1);
INSERT INTO PAISES (id, nombre, habitantes, id_continente) VALUES (3, 'Guyana', 779000, 1);
INSERT INTO PAISES (id, nombre, habitantes, id_continente) VALUES (4, 'Venezuela', 29000000, 1);

INSERT INTO P_P VALUES (4,1);
INSERT INTO P_P VALUES (4,2);
INSERT INTO P_P VALUES (4,3);

/* Empleado: Imprimir apellido, fecha de evaluacion inicial de desempeño que es 90 dias despues
de su fecha de ingreso, el dia de la semana en que cae esa fecha, fecha final de revision la cual
si cae domingo o sabado debe ser el proximo lunes, sino se queda igual.

La columna que guarda la fecha de ingreso es fechaing y su formato es dd-mm-yyyy*/

SELECT e.apellido, e.fechaing as "Fecha de ingreso" , e.fechaing + 90 as "Fecha de Revision", TO_CHAR(e.fechaing + 90, 'FmDay') as "Dia semana", (
CASE TO_NUMBER(TO_CHAR(e.fechaing + 90, 'D')) WHEN 7 THEN e.fechaing + 92
WHEN 1 THEN e.fechaing + 91
ELSE e.fechaing END
) as "Fecha final de revision"
FROM EMPLEADO e

-- Borrar paises con mas de 5 fronteras
DELETE FROM dm_pais pp WHERE 
(SELECT COUNT(*) as fronteras FROM dm_pais p
JOIN dm_frontera f ON f.id_frontera = pp.id_pais) > 5;

-- Dada una tabla de artistas y maestros que tiene relacion artista-artista eliminar los artistas que no hayan tenido alumnos entre 1990 y 2010 
DELETE FROM mp_artista maa WHERE NOT EXISTS (
SELECT a.id
FROM mp_artista a
JOIN mp_maestroalumnos ma ON ma.id_maestro = a.id
WHERE (ma.fecha_ensenanza_inicio BETWEEN TO_DATE('01/01/1990', 'DD-MM-YYYY') AND TO_DATE('31/12/2010', 'DD-MM-YYYY')
OR ma.fecha_ensenanza_fin BETWEEN TO_DATE('01/01/1990', 'DD-MM-YYYY') AND TO_DATE('31/12/2010', 'DD-MM-YYYY') OR ma.fecha_ensenanza_fin IS NULL) AND a.id = maa.id);

-- Dada una tabla empleados que guarda la fecha de inicio mostrar los empleados cuya fecha de ingreso corresponde a cada dia de la semana 
-- Ej Lunes = 4, Martes = 2, Miercoles = 0, Jueves = 1, Viernes = 0
SELECT (SELECT COUNT(*) FROM EMPLEADO ee WHERE TO_NUMBER(TO_CHAR(ee.fechaing, 'D')) = 2) as Lunes, 
(SELECT COUNT(*) FROM EMPLEADO ee WHERE TO_NUMBER(TO_CHAR(ee.fechaing, 'D')) = 3) as Martes,
(SELECT COUNT(*) FROM EMPLEADO ee WHERE TO_NUMBER(TO_CHAR(ee.fechaing, 'D')) = 4) as Miercoles,
(SELECT COUNT(*) FROM EMPLEADO ee WHERE TO_NUMBER(TO_CHAR(ee.fechaing, 'D')) = 5) as Jueves,
(SELECT COUNT(*) FROM EMPLEADO ee WHERE TO_NUMBER(TO_CHAR(ee.fechaing, 'D')) = 6) as Viernes
FROM
DUAL;

-- Dada una tabla con proyectos del tipo proyecto, tarea o actividad y una tabla de subproyectos que apunta a la tabla proyecto (id_proyecto_padre, id_proyecto_hijo) eliminar PROYECTOS que tengan menos de 2 ACTIVIDADES
DELETE FROM vv_proyecto_actividades paaa WHERE (
SELECT COUNT(*)
FROM vv_proyecto_actividades pa
JOIN vv_subproyecto s ON s.id_padre = pa.id
WHERE pa.tipo LIKE 'proyecto%' AND (SELECT paa.tipo FROM vv_proyecto_actividades paa WHERE paa.id = s.id_hijo) LIKE 'actividad%'
AND pa.id = paaa.id) < 2;