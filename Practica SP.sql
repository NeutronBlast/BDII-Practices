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
ALTER TABLE personas ADD CONSTRAINT estado_persona_chk CHECK(estado = 'I' OR  estado = 'F' OR estado = 'R' OR estado = 'S');

/* Urbanizaciones */
INSERT INTO urbanizaciones (id,nombre) VALUES (1, 'Carrolton');
INSERT INTO urbanizaciones (id,nombre) VALUES (2, 'Magnolia');

/* Carrolton */
INSERT INTO personas (id,primer_nombre,primer_apellido,estado,urbanizacion_id) VALUES (1,'Frank','Hesse','S',1);
INSERT INTO personas (id,primer_nombre,primer_apellido,estado,urbanizacion_id) VALUES (2,'Jack','Russell','S',1);
INSERT INTO personas (id,primer_nombre,primer_apellido,estado,urbanizacion_id) VALUES (3,'Fernando','Lopez','S',1);
INSERT INTO personas (id,primer_nombre,primer_apellido,estado,urbanizacion_id) VALUES (4,'Felix','Schmidt','S',1);
INSERT INTO personas (id,primer_nombre,primer_apellido,estado,urbanizacion_id) VALUES (5,'Leo','Barnes','S',1);
INSERT INTO personas (id,primer_nombre,primer_apellido,estado,urbanizacion_id) VALUES (6,'Omar','Hernandez','S',1);
INSERT INTO personas (id,primer_nombre,primer_apellido,estado,urbanizacion_id) VALUES (7,'Gregg','Spinetti','S',1);
INSERT INTO personas (id,primer_nombre,primer_apellido,estado,urbanizacion_id) VALUES (8,'Anthony','Mars','S',1);
INSERT INTO personas (id,primer_nombre,primer_apellido,estado,urbanizacion_id) VALUES (9,'Norman','Atomic','S',1);
INSERT INTO personas (id,primer_nombre,primer_apellido,estado,urbanizacion_id) VALUES (10,'Angel','Revilla','S',1);
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
INSERT INTO personas (id,primer_nombre,primer_apellido,estado,urbanizacion_id) VALUES (37,'Gabriel','Brown','S',2);
INSERT INTO personas (id,primer_nombre,primer_apellido,estado,urbanizacion_id) VALUES (38,'Mary','Johnson','S',2);
INSERT INTO personas (id,primer_nombre,primer_apellido,estado,urbanizacion_id) VALUES (39,'Ariel','Graham','S',2);
INSERT INTO personas (id,primer_nombre,primer_apellido,estado,urbanizacion_id) VALUES (40,'Mark','Spiegel','S',2);
INSERT INTO personas (id,primer_nombre,primer_apellido,estado,urbanizacion_id) VALUES (41,'Gart','Johnson','S',2);
INSERT INTO personas (id,primer_nombre,primer_apellido,estado,urbanizacion_id) VALUES (42,'Paolo','Rossi','S',2);
INSERT INTO personas (id,primer_nombre,primer_apellido,estado,urbanizacion_id) VALUES (43,'Sven','Bender','S',2);
INSERT INTO personas (id,primer_nombre,primer_apellido,estado,urbanizacion_id) VALUES (44,'Leon','Muller','S',2);
INSERT INTO personas (id,primer_nombre,primer_apellido,estado,urbanizacion_id) VALUES (45,'Leah','Wulf','S',2);
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
