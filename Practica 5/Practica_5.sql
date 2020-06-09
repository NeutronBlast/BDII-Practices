

CREATE TABLE PAISES(
    id number PRIMARY KEY,
    nombre VARCHAR2(100) NOT NULL
);

CREATE TABLE INFECCIONES(
    id number PRIMARY KEY,
    id_pais number not null,
    fecha date not null,
    nuevas_i integer not null
);

CREATE TABLE INFECCIONES_ACUMULADAS(
    id number PRIMARY KEY,
    pais VARCHAR2(100) not null,
    fecha date not null,
    nuevas_i integer not null,
    cantidad_i integer
);

ALTER TABLE INFECCIONES ADD CONSTRAINT PAISES_INFECCIONES_FK FOREIGN KEY (id_pais) REFERENCES PAISES(id);

INSERT INTO PAISES VALUES (1,'VENEZUELA');
INSERT INTO PAISES VALUES (2,'USA');
INSERT INTO PAISES VALUES (3,'ARGENTINA');
INSERT INTO PAISES VALUES (4,'ESPAÑA');
INSERT INTO PAISES VALUES (5,'COLOMBIA');
INSERT INTO PAISES VALUES (6,'CANADÁ');
INSERT INTO PAISES VALUES (7,'ALEMANIA');

INSERT INTO INFECCIONES VALUES(1,1,TO_DATE('2020-06-05','YYYY-MM-DD'),100);
INSERT INTO INFECCIONES VALUES(2,2,TO_DATE('2020-06-06','YYYY-MM-DD'),20000);
INSERT INTO INFECCIONES VALUES(3,3,TO_DATE('2020-06-07','YYYY-MM-DD'),1200);
INSERT INTO INFECCIONES VALUES(4,4,TO_DATE('2020-06-08','YYYY-MM-DD'),1000);
INSERT INTO INFECCIONES VALUES(5,5,TO_DATE('2020-06-09','YYYY-MM-DD'),800);
INSERT INTO INFECCIONES VALUES(6,6,TO_DATE('2020-06-10','YYYY-MM-DD'),4000);
INSERT INTO INFECCIONES VALUES(7,7,TO_DATE('2020-06-11','YYYY-MM-DD'),700);
INSERT INTO INFECCIONES VALUES(8,1,TO_DATE('2020-06-12','YYYY-MM-DD'),150);
INSERT INTO INFECCIONES VALUES(9,2,TO_DATE('2020-06-13','YYYY-MM-DD'),15000);
INSERT INTO INFECCIONES VALUES(10,3,TO_DATE('2020-06-14','YYYY-MM-DD'),900);
INSERT INTO INFECCIONES VALUES(11,4,TO_DATE('2020-06-15','YYYY-MM-DD'),1400);
INSERT INTO INFECCIONES VALUES(12,5,TO_DATE('2020-06-16','YYYY-MM-DD'),200);
INSERT INTO INFECCIONES VALUES(13,6,TO_DATE('2020-06-17','YYYY-MM-DD'),2500);
INSERT INTO INFECCIONES VALUES(14,7,TO_DATE('2020-06-18','YYYY-MM-DD'),1100);

declare
    ACUMULADO INTEGER;
    REGISTRO_PAISES PAISES%rowtype;
    REGISTRO_INFECCIONES INFECCIONES%rowtype;

    cursor ITERADOR_PAISES is
        select * from PAISES;
    cursor ITERADOR_INFECTADOS is
        select * from INFECCIONES;
BEGIN
    OPEN ITERADOR_PAISES;
        FETCH ITERADOR_PAISES INTO REGISTRO_PAISES;
        WHILE ITERADOR_PAISES%FOUND
        LOOP
        ACUMULADO := 0;
        OPEN ITERADOR_INFECTADOS;
            FETCH ITERADOR_INFECTADOS INTO REGISTRO_INFECCIONES;
                WHILE ITERADOR_INFECTADOS%FOUND
                    LOOP
                    IF REGISTRO_PAISES.id = REGISTRO_INFECCIONES.id_pais THEN
                    ACUMULADO := ACUMULADO + REGISTRO_INFECCIONES.nuevas_i;
                    INSERT INTO INFECCIONES_ACUMULADAS 
                        VALUES(REGISTRO_INFECCIONES.id,REGISTRO_PAISES.nombre,
                                REGISTRO_INFECCIONES.fecha,REGISTRO_INFECCIONES.nuevas_i,ACUMULADO);
                    END IF;
                    FETCH ITERADOR_INFECTADOS INTO REGISTRO_INFECCIONES;
                END LOOP;
        CLOSE ITERADOR_INFECTADOS;
        FETCH ITERADOR_PAISES INTO REGISTRO_PAISES;
        END LOOP;
    CLOSE ITERADOR_PAISES;
END;

SELECT * FROM INFECCIONES_ACUMULADAS;