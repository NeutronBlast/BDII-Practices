--Practica 2 Stored Procedure

CREATE TABLE urbanizaciones (
    id number PRIMARY KEY,
    nombre VARCHAR2(200)
);

CREATE TABLE personas (
    id number PRIMARY KEY,
    primer_nombre VARCHAR2(100),
    primer_apellido VARCHAR2(100),
    estado VARCHAR2(100),
    urbanizacion_id number
);

ALTER TABLE personas ADD CONSTRAINT urbanizacion_persona_fk FOREIGN KEY (urbanizacion_id) REFERENCES urbanizaciones(id);
ALTER TABLE personas ADD CONSTRAINT estado_persona_chk CHECK(estado = 'I' OR  estado = 'F' OR estado = 'S');

/* Urbanizaciones */
INSERT INTO urbanizaciones (id,nombre) VALUES (1, 'Carrolton');
INSERT INTO urbanizaciones (id,nombre) VALUES (2, 'Magnolia');

/* Carrolton */
INSERT INTO personas (id,primer_nombre,primer_apellido,estado,urbanizacion_id) VALUES (1,'Frank','Hesse','I',1);
INSERT INTO personas (id,primer_nombre,primer_apellido,estado,urbanizacion_id) VALUES (2,'Jack','Russell','S',1);
INSERT INTO personas (id,primer_nombre,primer_apellido,estado,urbanizacion_id) VALUES (3,'Fernando','Lopez','S',1);
INSERT INTO personas (id,primer_nombre,primer_apellido,estado,urbanizacion_id) VALUES (4,'Felix','Schmidt','S',1);
INSERT INTO personas (id,primer_nombre,primer_apellido,estado,urbanizacion_id) VALUES (5,'Leo','Barnes','S',1);
INSERT INTO personas (id,primer_nombre,primer_apellido,estado,urbanizacion_id) VALUES (6,'Omar','Hernandez','S',1);
INSERT INTO personas (id,primer_nombre,primer_apellido,estado,urbanizacion_id) VALUES (7,'Gregg','Spinetti','S',1);
INSERT INTO personas (id,primer_nombre,primer_apellido,estado,urbanizacion_id) VALUES (8,'Anthony','Mars','S',1);
INSERT INTO personas (id,primer_nombre,primer_apellido,estado,urbanizacion_id) VALUES (9,'Norman','Atomic','S',1);
INSERT INTO personas (id,primer_nombre,primer_apellido,estado,urbanizacion_id) VALUES (10,'Angel','Revilla','I',1);
INSERT INTO personas (id,primer_nombre,primer_apellido,estado,urbanizacion_id) VALUES (11,'John','Anderson','S',1);
INSERT INTO personas (id,primer_nombre,primer_apellido,estado,urbanizacion_id) VALUES (12,'Julian','Brandt','S',1);
INSERT INTO personas (id,primer_nombre,primer_apellido,estado,urbanizacion_id) VALUES (13,'Yonaikel','Alexander','S',1);
INSERT INTO personas (id,primer_nombre,primer_apellido,estado,urbanizacion_id) VALUES (14,'Martha','Corey','S',1);
INSERT INTO personas (id,primer_nombre,primer_apellido,estado,urbanizacion_id) VALUES (15,'Elizabeth','Warren','S',1);
INSERT INTO personas (id,primer_nombre,primer_apellido,estado,urbanizacion_id) VALUES (16,'Budd','Dwyer','S',1);
INSERT INTO personas (id,primer_nombre,primer_apellido,estado,urbanizacion_id) VALUES (17,'Joseph','Costa','S',1);
INSERT INTO personas (id,primer_nombre,primer_apellido,estado,urbanizacion_id) VALUES (18,'Johan','Watzke','S',1);
INSERT INTO personas (id,primer_nombre,primer_apellido,estado,urbanizacion_id) VALUES (19,'Edward','Elric','S',1);
INSERT INTO personas (id,primer_nombre,primer_apellido,estado,urbanizacion_id) VALUES (20,'Edward','Meyer','S',1);
INSERT INTO personas (id,primer_nombre,primer_apellido,estado,urbanizacion_id) VALUES (21,'Ruby','Jones','S',1);
INSERT INTO personas (id,primer_nombre,primer_apellido,estado,urbanizacion_id) VALUES (22,'Ada','Hill','S',1);
INSERT INTO personas (id,primer_nombre,primer_apellido,estado,urbanizacion_id) VALUES (23,'Steven','Clinton','S',1);
INSERT INTO personas (id,primer_nombre,primer_apellido,estado,urbanizacion_id) VALUES (24,'Adam','Gontier','S',1);
INSERT INTO personas (id,primer_nombre,primer_apellido,estado,urbanizacion_id) VALUES (25,'Frank','Roosevelt','S',1);
INSERT INTO personas (id,primer_nombre,primer_apellido,estado,urbanizacion_id) VALUES (26,'Rick','Derringer','S',1);
INSERT INTO personas (id,primer_nombre,primer_apellido,estado,urbanizacion_id) VALUES (27,'Brenda','Nicholson','S',1);
INSERT INTO personas (id,primer_nombre,primer_apellido,estado,urbanizacion_id) VALUES (28,'Maria','Castellar','S',1);
INSERT INTO personas (id,primer_nombre,primer_apellido,estado,urbanizacion_id) VALUES (29,'Trevor','Lobsterman','S',1);
INSERT INTO personas (id,primer_nombre,primer_apellido,estado,urbanizacion_id) VALUES (30,'Mildred','Johnson','S',1);

/* Magnolia */
INSERT INTO personas (id,primer_nombre,primer_apellido,estado,urbanizacion_id) VALUES (31,'Josh','Dunn','S',2);
INSERT INTO personas (id,primer_nombre,primer_apellido,estado,urbanizacion_id) VALUES (32,'Manuel','Trudell','S',2);
INSERT INTO personas (id,primer_nombre,primer_apellido,estado,urbanizacion_id) VALUES (33,'Nick','Powell','S',2);
INSERT INTO personas (id,primer_nombre,primer_apellido,estado,urbanizacion_id) VALUES (34,'Luca','Jovic','S',2);
INSERT INTO personas (id,primer_nombre,primer_apellido,estado,urbanizacion_id) VALUES (35,'Louis','Poirot','S',2);
INSERT INTO personas (id,primer_nombre,primer_apellido,estado,urbanizacion_id) VALUES (36,'Alexis','Berkowitz','S',2);
INSERT INTO personas (id,primer_nombre,primer_apellido,estado,urbanizacion_id) VALUES (37,'Gabriel','Brown','I',2);
INSERT INTO personas (id,primer_nombre,primer_apellido,estado,urbanizacion_id) VALUES (38,'Mary','Johnson','S',2);
INSERT INTO personas (id,primer_nombre,primer_apellido,estado,urbanizacion_id) VALUES (39,'Ariel','Graham','S',2);
INSERT INTO personas (id,primer_nombre,primer_apellido,estado,urbanizacion_id) VALUES (40,'Mark','Spiegel','S',2);
INSERT INTO personas (id,primer_nombre,primer_apellido,estado,urbanizacion_id) VALUES (41,'Gart','Johnson','S',2);
INSERT INTO personas (id,primer_nombre,primer_apellido,estado,urbanizacion_id) VALUES (42,'Paolo','Rossi','S',2);
INSERT INTO personas (id,primer_nombre,primer_apellido,estado,urbanizacion_id) VALUES (43,'Sven','Bender','S',2);
INSERT INTO personas (id,primer_nombre,primer_apellido,estado,urbanizacion_id) VALUES (44,'Leon','Muller','S',2);
INSERT INTO personas (id,primer_nombre,primer_apellido,estado,urbanizacion_id) VALUES (45,'Leah','Wulf','I',2);
INSERT INTO personas (id,primer_nombre,primer_apellido,estado,urbanizacion_id) VALUES (46,'Viktor','Fischer','S',2);
INSERT INTO personas (id,primer_nombre,primer_apellido,estado,urbanizacion_id) VALUES (47,'John','Ki','S',2);
INSERT INTO personas (id,primer_nombre,primer_apellido,estado,urbanizacion_id) VALUES (48,'Sophia','Krueger','S',2);
INSERT INTO personas (id,primer_nombre,primer_apellido,estado,urbanizacion_id) VALUES (49,'Ralph','Johnson','S',2);
INSERT INTO personas (id,primer_nombre,primer_apellido,estado,urbanizacion_id) VALUES (50,'Markus','Selznyov','S',2);
INSERT INTO personas (id,primer_nombre,primer_apellido,estado,urbanizacion_id) VALUES (51,'Kaita','Tou','S',2);
INSERT INTO personas (id,primer_nombre,primer_apellido,estado,urbanizacion_id) VALUES (52,'Kinuka','Tagami','S',2);
INSERT INTO personas (id,primer_nombre,primer_apellido,estado,urbanizacion_id) VALUES (53,'Ryan','Micallef','S',2);
INSERT INTO personas (id,primer_nombre,primer_apellido,estado,urbanizacion_id) VALUES (54,'Zoe','Anderson','S',2);
INSERT INTO personas (id,primer_nombre,primer_apellido,estado,urbanizacion_id) VALUES (55,'Dylan','Burns','S',2);
INSERT INTO personas (id,primer_nombre,primer_apellido,estado,urbanizacion_id) VALUES (56,'Lucas','Johnson','S',2);
INSERT INTO personas (id,primer_nombre,primer_apellido,estado,urbanizacion_id) VALUES (57,'Flynn','Schaffer','S',2);
INSERT INTO personas (id,primer_nombre,primer_apellido,estado,urbanizacion_id) VALUES (58,'Maya','Edwards','S',2);
INSERT INTO personas (id,primer_nombre,primer_apellido,estado,urbanizacion_id) VALUES (59,'Henry','Martinez','S',2);
INSERT INTO personas (id,primer_nombre,primer_apellido,estado,urbanizacion_id) VALUES (60,'Lucia','Cardoso','S',2);
INSERT INTO personas (id,primer_nombre,primer_apellido,estado,urbanizacion_id) VALUES (61,'Rick','Harrison','S',2);
INSERT INTO personas (id,primer_nombre,primer_apellido,estado,urbanizacion_id) VALUES (62,'Kai','Togami','S',2);
INSERT INTO personas (id,primer_nombre,primer_apellido,estado,urbanizacion_id) VALUES (63,'Freddie','Dredd','S',2);
INSERT INTO personas (id,primer_nombre,primer_apellido,estado,urbanizacion_id) VALUES (64,'Alicia','Duncan','S',2);
INSERT INTO personas (id,primer_nombre,primer_apellido,estado,urbanizacion_id) VALUES (65,'Scarlet','Woods','S',2);
INSERT INTO personas (id,primer_nombre,primer_apellido,estado,urbanizacion_id) VALUES (66,'Josh','Woods','S',2);
INSERT INTO personas (id,primer_nombre,primer_apellido,estado,urbanizacion_id) VALUES (67,'Jacob','Griffiths','S',2);
INSERT INTO personas (id,primer_nombre,primer_apellido,estado,urbanizacion_id) VALUES (68,'Andrew','Miller','S',2);
INSERT INTO personas (id,primer_nombre,primer_apellido,estado,urbanizacion_id) VALUES (69,'Aaron','Vinachi','S',2);
INSERT INTO personas (id,primer_nombre,primer_apellido,estado,urbanizacion_id) VALUES (70,'Thomas','Rizek','S',2);

--Procediemeto que debe recibir el nombre de la urbanizaci�n 
CREATE OR REPLACE Procedure simulacion_urb(urb VARCHAR2) 
IS
    v_infectados number(4); --numero de personas infectadas originalemtne
    v_total number(4);      --numero de personas infectadas actualizado
    v_random number(4);     --numero aleatorio de contagios
    v_limit number(4);      --numero de personas en la urbanizacion
    v_urb_id number(4);     --id de la urbanizacion
    salida SYS_REFCURSOR;   --salida de script
    
BEGIN
    --Almacenar id de la urbanizacion
    SELECT id INTO v_urb_id FROM urbanizaciones WHERE nombre = urb;
    
    --Almacenar numero de personas infectadas en la urbanizacion
    SELECT count(*) INTO v_infectados
        FROM personas
        WHERE estado = 'I';
    
    --Almacenar numero de personas en la urbanizacion
    SELECT count(*) INTO v_limit
        FROM personas
        WHERE (urbanizacion_id = v_urb_id AND estado = 'S');
    
    --Generar valor alearotio de infecciones
    v_random := DBMS_RANDOM.VALUE(1,v_limit);
    
    --calculo de infectados totales
    v_total := v_infectados + v_random;
    
    --Actualiza un aletoriamente un grupo de personas sanas a infectadas. Tantas como el numero aleatorio generado
    UPDATE personas 
        SET estado = 'I'
        WHERE id IN (SELECT id FROM (
            SELECT * FROM personas WHERE (urbanizacion_id = v_urb_id AND estado = 'S') ORDER BY dbms_random.value 
            )WHERE rownum <= v_random);
    
    --Impresiones en pantalla
    DBMS_OUTPUT.PUT_LINE('Al romper la cuarentena urbanizacion '|| urb ||' se contagiaron '||v_random ||' peronas sanas');
    DBMS_OUTPUT.PUT_LINE('Ahora el total de infectados aumento de '|| v_infectados ||' hasta '|| v_total ||' contagiados');
EXCEPTION
    WHEN no_data_found THEN
        DBMS_OUTPUT.PUT_LINE('ERROR, Urbanizacion no registrada');
    
END;

SET SERVEROUTPUT ON;
EXECUTE SIMULACION_URB('Magnolia');

SELECT p.primer_nombre as "NOMBRE", p.primer_apellido as "APELLIDO", u.nombre as "URBANIZACION", 
(CASE WHEN p.estado = 'I' THEN 'INFECTADO' ELSE 'SANO' END) as "ESTADO"
FROM personas p
JOIN urbanizaciones u ON u.id = p.urbanizacion_id
ORDER BY p.estado;