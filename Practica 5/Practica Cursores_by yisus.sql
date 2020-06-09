CREATE TABLE casos(
    id number PRIMARY KEY,
    pais VARCHAR2(200),
    fecha DATE,
    nuevas_infecciones INTEGER,
    infecciones_acumuladas INTEGER
)

CREATE TABLE casos_acumulado(
    id number PRIMARY KEY,
    pais VARCHAR2(200),
    fecha DATE,
    nuevas_infecciones INTEGER,
    infecciones_acumuladas INTEGER
)


INSERT INTO casos (id,pais,fecha,nuevas_infecciones,infecciones_acumuladas) VALUES (1, 'Venezuela',TO_DATE('02/06/2020','DD/MM/YYYY'),100,NULL);
INSERT INTO casos (id,pais,fecha,nuevas_infecciones,infecciones_acumuladas) VALUES (2, 'Venezuela',TO_DATE('08/06/2020','DD/MM/YYYY'),500,NULL);
INSERT INTO casos (id,pais,fecha,nuevas_infecciones,infecciones_acumuladas) VALUES (3, 'Venezuela',TO_DATE('03/06/2020','DD/MM/YYYY'),200,NULL);
INSERT INTO casos (id,pais,fecha,nuevas_infecciones,infecciones_acumuladas) VALUES (4, 'USA',TO_DATE('04/06/2020','DD/MM/YYYY'),5000,NULL);
INSERT INTO casos (id,pais,fecha,nuevas_infecciones,infecciones_acumuladas) VALUES (5, 'USA',TO_DATE('01/06/2020','DD/MM/YYYY'),2000,NULL);

DECLARE
    CURSOR v_cursor IS
        SELECT * FROM casos;

    CURSOR v_cont_pais IS
        SELECT distinct pais FROM casos;
        
    registro_caso casos%rowtype;
    v_acumulado INTEGER;
    v_pais VARCHAR2(200);
      
 BEGIN
    
    OPEN v_cont_pais;
    FETCH v_cont_pais INTO v_pais;
    
    WHILE v_cont_pais%FOUND
    LOOP
        v_acumulado := 0;
        OPEN v_cursor;
        FETCH v_cursor INTO registro_caso;
        
        WHILE v_cursor%FOUND 
        LOOP  
            IF registro_caso.pais = v_pais THEN
                v_acumulado := v_acumulado + registro_caso.nuevas_infecciones;
                INSERT INTO casos_acumulado VALUES (registro_caso.id, registro_caso.pais, registro_caso.fecha, registro_caso.nuevas_infecciones, v_acumulado);    
            END IF;
            FETCH v_cursor INTO registro_caso;
        END LOOP;
        
        CLOSE v_cursor;
        FETCH v_cont_pais INTO v_pais;
    END LOOP;
    CLOSE v_cont_pais;
 END;
 
 SELECT * FROM casos_acumulado